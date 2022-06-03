class Expect<T> {
  final T? _data;
  final String? error;

  Expect(this._data, this.error);

  bool get hasError => error != null;

  T get data => _data!;
}
