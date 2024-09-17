abstract class DataState{
  final Object ? data;
  final String ? exception;

  const DataState({this.data,this.exception});

}

class DataSuccess extends DataState{

  const DataSuccess(Object data):super(data: data);
}

class DataFailed extends DataState{
  const DataFailed(String exception):super(exception: exception);
}