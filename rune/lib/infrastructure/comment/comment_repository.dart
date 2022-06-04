import 'package:rune/infrastructure/cache_provider.dart';
import 'package:rune/infrastructure/comment/comment_api_provider.dart';
import 'package:rune/infrastructure/comment/comment_cache_provider.dart';

class CommentRepository {
  final CommentAPIProvider commentAPIProvider;
  final CommentCacheProvider commentCacheProvider;

  CommentRepository(CacheDatabase database, String host)
      : commentCacheProvider = CommentCacheProvider(database),
        commentAPIProvider = CommentAPIProvider(host);
}
