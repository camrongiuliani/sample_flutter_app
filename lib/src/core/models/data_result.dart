class DataResult<T> {
  bool success;
  String? message;
  T? data;

  bool get hasData => data != null;

  DataResult.success( this.data, [ this.message ] ) : success = true;

  DataResult.error( [ this.message ] ): success = false;

}