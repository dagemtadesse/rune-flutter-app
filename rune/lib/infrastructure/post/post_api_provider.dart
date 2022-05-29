import 'package:rune/domain/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rune/infrastructure/api_response.dart';

class PostAPIProvider {
  PostAPIProvider(this.host);

  final String host;

  Future<List<Post>> fetchPosts(User user, int channelId,
      {int size = 12, int page = 0}) async {
    try {
      final response = await http.get(
          Uri.http(
            host,
            '/api/v1/$channelId/posts',
            {'size': size.toString(), 'page': page.toString()},
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return (apiResponse.data as List).map((post) {
          return Post.fromJson(post as Map<String, dynamic>);
        }).toList();
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Post> fetchPost(User user, int postId) async {
    try {
      final response = await http.get(
          Uri.http(
            host,
            '/api/v1/posts/$postId',
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      print(response.body);
      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Post.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Post> createPost(User user, int channelId,
      {required String title,
      required String content,
      String? imagePath}) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.http(host, '/api/v1/$channelId/post'),
      );

      request.headers['Authorization'] = 'Bearer ${user.authToken}';
      request
        ..fields['title'] = title
        ..fields['text'] = content;

      if (imagePath != null) {
        request.files
            .add(await http.MultipartFile.fromPath("media", imagePath));
      }

      final response = await request.send();
      final body = await response.stream.bytesToString();
      print(body);

      final apiResponse = APIResponse.fromJson(jsonDecode(body));
      if (apiResponse.status == 'success') {
        return Post.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Post> delete(User user, int postId) async {
    try {
      final response = await http.delete(
          Uri.http(
            host,
            '/api/v1/posts/$postId',
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      print(response.body);
      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Post.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Post> update(User user, int postId,
      {String? title, String? content, String? imagePath}) async {
    try {
      final request = http.MultipartRequest(
        'PUT',
        Uri.http(host, '/api/v1/posts/$postId'),
      );

      request.headers['Authorization'] = 'Bearer ${user.authToken}';

      if (title != null) request.fields['title'] = title;
      if (content != null) request.fields['text'] = content;
      if (imagePath != null) {
        request.files
            .add(await http.MultipartFile.fromPath("media", imagePath));
      }

      final response = await request.send();
      final body = await response.stream.bytesToString();
      print(body);

      final apiResponse = APIResponse.fromJson(jsonDecode(body));
      if (apiResponse.status == 'success') {
        return Post.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } catch (error, stackTrace) {
      print(stackTrace);
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Post> vote(User user, int postId, {String action = "NONE"}) async {
    try {
      final response = await http.post(
          Uri.http(
            host,
            '/api/v1/$action/posts/$postId',
          ),
          headers: {'Authorization': 'Bearer ${user.authToken}'});

      print(response.body);
      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));

      if (apiResponse.status == 'success') {
        return Post.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }
}
