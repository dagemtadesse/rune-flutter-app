import 'dart:convert';

import '../models.dart';
import '../providers/provider.dart';
import 'network.dart';
import 'package:http/http.dart' as http;

Future<Posts> fetchPosts({
  required Repository repo,
  required int channelId,
  int page = 0,
  int pageSize = 12,
}) async {
  try {
    final response = await http.get(
      Uri.parse(
          "${Repository.baseUrl}/$channelId/posts?page=$page&size=$pageSize"),
      headers: {'Authorization': "Bearer ${repo.authenticationKey}"},
    );

    final apiResponse = APIResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode != 200) {
      throw apiResponse;
    }

    Posts posts = [];

    for (var postJson in apiResponse.data as List) {
      final post = Post.fromJson(postJson);
      post.author = await fetchUser(repo, post.authorId);

      posts.add(post);
    }

    return posts;
  } on Exception {
    throw connectionError;
  }
}

uploadPost(int channelId, String postTitle, String postContent,
    String? imagePath) async {
  var url = Uri.parse(Repository.baseUrl + '/$channelId/post');
  var request = http.MultipartRequest('POST', url, )
    ..fields['title'] = postTitle
    ..fields['text'] = postContent;

  if (imagePath != null) {
    request.files.add(await http.MultipartFile.fromPath('media', imagePath));
  }

  try {
    var response = await request.send();
    if (response.statusCode != 200) throw connectionError;
  } on Exception {
    throw connectionError;
  }
}
