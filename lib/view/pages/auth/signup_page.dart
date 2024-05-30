import 'package:flutter/material.dart';
import 'package:drinkapp/model/account_model.dart';
import 'package:drinkapp/view/custom/auth/custom_button.dart';
import 'package:drinkapp/view/custom/auth/custom_text_field.dart';
import 'package:drinkapp/view/pages/auth/signin_page.dart';
import 'package:drinkapp/view/resource/responsive.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = '/sign_up_page';

  SignUpPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController confirmPassword = TextEditingController();

  snackBar(IconData icon, String messenge, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.green,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              messenge,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      const SizedBox(height: 10),
                      const Text('Đăng kí tài khoản'),
                      const SizedBox(height: 10),
                      CustomTextFiled(
                        labelText: 'Tài khoản ',
                        hintText: 'Tài khoản',
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tài khoản';
                          }
                          return null;
                        },
                      ),
                      CustomTextFiled(
                        isPassword: true,
                        labelText: 'Mật khẩu ',
                        hintText: 'Mật khẩu',
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập mật khẩu';
                          }
                          return null;
                        },
                      ),
                      CustomTextFiled(
                        isPassword: true,
                        labelText: 'Xác nhận mật khẩu ',
                        hintText: 'Xác nhận mật khẩu',
                        controller: confirmPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng xác nhận mật khẩu';
                          } else if (password.text != confirmPassword.text) {
                            return 'Mật khẩu không khớp';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(
                                    Responsive.size(context) * 0.035)),
                            child: const Icon(Icons.arrow_back_rounded,
                                color: Colors.blue),
                          ),
                          CustomButton(
                            name: 'Đăng kí',
                            onPressed: () async {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                AccountModel()
                                    .signUp(username.text, password.text);
                                snackBar(Icons.check_circle_outline_rounded,
                                    'Đăng kí thành công ', context);
                                Navigator.of(context).pushAndRemoveUntil(
                                   MaterialPageRoute(builder: (context) => SignInPage(name: username.text)), (route) => false);
                              }
                            },
                          ),
                        ],
                      ),
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
