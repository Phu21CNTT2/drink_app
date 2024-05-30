class AccountModel {
  void signUp(String username, String password) {
    _account['username'] = username;
    _account['password'] = password;
  }

  bool signIn(String username, String password) {
    if (_account['username'] == username && _account['password'] == password) {
      return true;
    }
    return false;
  }

  bool isExits(){
    if(_account['username'] != ''){
      return true;
    }
    return false;
  }
}

Map _account = {'username': '', 'password': ''};
