class AppException implements Exception  {


  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);
  @override
   String toString(){
    return '$_prefix$_message';
   }
}



class FetchDataException extends AppException{
  FetchDataException([String ? message]) : super(message,'Error During Communication');
}




class BadRequestException extends AppException{
  BadRequestException([String ? message]) : super(message,'Invalid request');
}



class UnAuthorizedException extends AppException{
  UnAuthorizedException([String ? message]) : super(message,'UnAuthorized request');
}



class InvaliInputException extends AppException{
  InvaliInputException([String ? message]) : super(message,'Invalid Input');
}