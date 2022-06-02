import 'package:rune/domain/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rune/infrastructure/api_response.dart';

class CommentAPIProvider {
  CommentAPIProvider(this.host);

  final String host;

  Future<List<Comment>> fetchComments(User user, int postId,
      {int size = 12, int page = 0}) async {
    try {
      final response = await http.get(
          Uri.http(
            host,
            '/api/v1/$postId/comments',
            {'size': size.toString(), 'page': page.toString()},
          ),
          headers: {'Authorization': 'Bearer ${user.token}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return (apiResponse.data as List).map((comment) {
          return Comment.fromJson(comment as Map<String, dynamic>);
        }).toList();
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Comment> fetchComment(User user, int commentId) async {
    try {
      final response = await http.get(
          Uri.http(
            host,
            '/api/v1/comments/$commentId',
          ),
          headers: {'Authorization': 'Bearer ${user.token}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Comment.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Comment> createComment(User user, int postId, String content) async {
    try {
      final response = await http.post(
          Uri.http(host, '/api/v1/post/$postId/comment'),
          headers: {'Authorization': 'Bearer ${user.token}'},
          body: {"content": content});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Comment.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Comment> delete(User user, int commentId) async {
    try {
      final response = await http.delete(
          Uri.http(
            host,
            '/api/v1/comments/$commentId',
          ),
          headers: {'Authorization': 'Bearer ${user.token}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Comment.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Comment> update(User user, int commentId, String content) async {
    try {
      final response = await http.put(
          Uri.http(host, '/api/v1/comments/$commentId'),
          headers: {'Authorization': 'Bearer ${user.token}'},
          body: {"content": content});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return Comment.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<Comment> vote(User user, int commentId,
      {String action = "NONE"}) async {
    try {
      final response = await http.post(
          Uri.http(
            host,
            '/api/v1/$action/comments/$commentId',
          ),
          headers: {'Authorization': 'Bearer ${user.token}'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));

      if (apiResponse.status == 'success') {
        return Comment.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }
}
