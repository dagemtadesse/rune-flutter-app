import 'package:flutter/foundation.dart';

class Repository with ChangeNotifier {
  static const baseUrl = "http://localhost:9999/api/v1";
  static const resBaseUrl = "http://localhost:9999/";
  late String authenticationKey;
}
