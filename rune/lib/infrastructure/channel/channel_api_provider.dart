import 'package:rune/domain/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rune/infrastructure/api_response.dart';

class ChannelAPIProvider {
  ChannelAPIProvider(this.host);

  final String host;

  Future<List<Channel>> fetchChannels(
      {required User user,
      int size = 12,
      int page = 0,
      String query = " ",
      String onlyBookmarked = ""}) async {
    try {
      final response = await http.get(
          Uri.http(
            host,
            '/api/v1/channels',
            {
              'size': size.toString(),
              'page': page.toString(),
              'query': query,
              'bookmark': onlyBookmarked
            },
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return (apiResponse.data as List).map((channel) {
          return Channel.fromJson(channel as Map<String, dynamic>);
        }).toList();
      }
      throw apiResponse;
    } catch (error, stackTrace) {
      throw APIResponse.serverConnectionError;
    }
  }

  pinChannel(
    User user,
    int channelId, {
    bool reverse = false,
  }) async {
    try {
      final action = reverse ? 'unpin' : 'pin';

      final response = await http.put(
          Uri.http(
            host,
            '/api/v1/$action/$channelId',
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});
      // print(response.body);
      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status != 'success') throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Channel> createChannel(
    User user, {
    required String name,
    required String description,
    required String email,
    String address = "",
  }) async {
    try {
      final response = await http.post(
          Uri.http(
            host,
            '/api/v1/channels/',
          ),
          headers: {
            'Authorization': 'Bearer ${user.authToken}'
          },
          body: {
            'name': name,
            'description': description,
            'email': email,
            'address': address
          });

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Channel.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } catch (error, stackTrace) {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Channel> updateChannel(User user, int channelId,
      {String? name,
      String? description,
      String? address,
      String? email,
      String? imagePath}) async {
    try {
      final request = http.MultipartRequest(
        'PUT',
        Uri.http(host, '/api/v1/channels/$channelId'),
      );

      request.headers['Authorization'] = 'Bearer ${user.authToken}';
      if (email != null) request.fields['email'] = email;
      if (name != null) request.fields['name'] = name;
      if (description != null) request.fields['description'] = description;
      if (imagePath != null) {
        request.files.add(await http.MultipartFile.fromPath("logo", imagePath));
      }

      final response = await request.send();
      final body = await response.stream.bytesToString();
      print(body);
      final apiResponse = APIResponse.fromJson(jsonDecode(body));

      if (apiResponse.status == 'success') {
        return Channel.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } catch (error, stackTrace) {
      print(stackTrace);
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Channel> fetchChannel(User user, int channelId) async {
    try {
      final response = await http.get(
          Uri.http(
            host,
            '/api/v1/channels/$channelId',
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Channel.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } catch (error, stackTrace) {
      throw APIResponse.serverConnectionError;
    }
  }

  deleteChannel(User user, int channelId) async {
    try {
      final response = await http.delete(
          Uri.http(
            host,
            '/api/v1/channels/$channelId',
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Channel.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } catch (error, stackTrace) {
      throw APIResponse.serverConnectionError;
    }
  }
}
