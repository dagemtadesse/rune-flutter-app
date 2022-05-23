import 'dart:convert';

import '../models.dart';
import '../providers/provider.dart';
import 'network.dart';
import 'package:http/http.dart' as http;

Future<Channels> fetchChannels(Repository repo,
    {String searchKey = "",
    int page = 0,
    int pageSize = 12,
    bool pinned = false,
    String order = 'asc'}) async {
  try {
    final response = await http.get(
      Uri.parse(
          "${Repository.baseUrl}/channels?size=$pageSize&query=$searchKey&page=$page&order=$order" +
              (pinned ? "&bookmark=$pinned" : "")),
      headers: {'Authorization': "Bearer ${repo.authenticationKey}"},
    );

    final apiResponse = APIResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode != 200) {
      throw apiResponse;
    }

    return (apiResponse.data as List)
        .map((channel) => Channel.fromJson(channel as Map<String, dynamic>))
        .toList();
  } on Exception {
    throw connectionError;
  }
}
