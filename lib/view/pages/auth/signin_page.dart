import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drinkapp/model/account_model.dart';
import 'package:drinkapp/view/custom/auth/custom_button.dart';
import 'package:drinkapp/view/custom/auth/custom_text_field.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/sign_in_page';

  SignInPage({super.key, this.name = ''});

  final String name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
  username.text = name;

  bool checkLogin(BuildContext context) {
    if (username.text.isEmpty || password.text.isEmpty) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text(
              'Vui lòng nhập đầy đủ thông tin ',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    } else {
      return true;
    }
  }

  signInFailed(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: const Text(
            'Mật khẩu hoặc SDT-Email không đúng ',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/signin-signup_image/background-login.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                          'assets/images/signin-signup_image/hello.png',
                          width: 200,
                        ),
                      const SizedBox(height: 10.0),
                      const Text('Sign in to '),
                      const SizedBox(height: 10.0),
                      CustomTextFiled(
                        labelText: 'Tài khoản ',
                        hintText: 'Tài khoản',
                        controller: username,
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextFiled(
                        isPassword: true,
                        labelText: 'Mật khẩu ',
                        hintText: 'Mật khẩu',
                        controller: password,
                      ),
                      CustomButton(
                        name: 'Đăng nhập',
                        onPressed: () async {
                          if (checkLogin(context)) {
                            bool checkSignInAPI = AccountModel().signIn(
                                username.text,
                                password.text);
                            if (checkSignInAPI) {
                              if (kDebugMode) {
                                print('Đăng nhập thành công');
                              }
                              Navigator.of(context)
                                  .pushNamed('/bottom_nav_bar_page');
                            } else {
                              if (kDebugMode) {
                                print('Đăng nhập thất bại');
                              }
                              signInFailed(context);
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Bạn chưa có tài khoản?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/sign_up_page');
                            },
                            child: const Text('Đăng kí ngay'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
