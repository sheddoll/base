abstract class DataState{
  final Object ? data;
  final Exception ? exception;

  const DataState({this.data,this.exception});

}

class DataSuccess extends DataState{

  const DataSuccess(Object data):super(data: data);
}

class DataFailed extends DataState{
  const DataFailed(Exception exception):super(exception: exception);
}