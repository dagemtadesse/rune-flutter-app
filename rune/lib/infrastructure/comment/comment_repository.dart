import '../../domain/comment/comment_model.dart';
import '../../domain/user/user_model.dart';
import 'comment_api_provider.dart';

class CommentRepository {
 final CommentAPIProvider dataProvider;
 CommentRepository(this.dataProvider);

 Future<List<Comment>> fetchComments(User user,int postId ) async {
   return dataProvider.fetchComments(user,postId);
 }

Future<Comment> fetchComment(User user,int commentId ) async {
  return dataProvider.fetchComment(user,commentId);
}

Future<Comment> createComment(User user,int postId , String content) async {
  return dataProvider.createComment(user,postId,content);
}

Future<Comment> delete(User user,int commentId ) async {
  return dataProvider.delete(user,commentId);
}

Future<Comment> update(User user,int commentId , String content) async {
  return dataProvider.update(user,commentId,content);
}

Future<Comment> vote(User user,int commentId ) async {
  return dataProvider.vote(user,commentId);
}









}


