class Expect<T> {
  final T? _data;
  final String? _error;

  Expect(this._data, this._error);

  bool get hasError => _error != null;

  String get error => _error!;
  T get data => _data!;
}
