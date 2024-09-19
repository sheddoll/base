

bool inputChek(String email,String password){
final emailRegExp = RegExp(
  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
  );
  if(emailRegExp.hasMatch(email) && password != null && password != ''){
    return false;
  }
  else{
    return true;
  }



}