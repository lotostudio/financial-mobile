import 'package:finance_app/pages/profile_page.dart';
import 'package:finance_app/services/api_auth_service.dart';
import 'package:flutter/material.dart';

class RegisterFrom extends StatelessWidget {
  RegisterFrom({ Key? key }) : super(key: key);

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: ((MediaQuery.of(context).size.width ~/ 1.3).toDouble()),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name',
                        style: TextStyle(fontFamily: 'Mulish')),
                    TextField(
                      controller: _firstName,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            )),
                        hintText: 'Enter your first name',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1, horizontal: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last Name',
                        style: TextStyle(fontFamily: 'Mulish')),
                    TextField(
                      controller: _lastName,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            )),
                        hintText: 'Enter your last name',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1, horizontal: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail', style: TextStyle(fontFamily: 'Mulish')),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            )),
                        hintText: 'Enter your e-mail',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1, horizontal: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password',
                        style: TextStyle(fontFamily: 'Mulish')),
                    TextField(
                      controller: _password,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            )),
                        hintText: 'Enter your password',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1, horizontal: 15),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15, bottom: 20),
                child: TextButton(
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProfilePage()),
                    //   (Route<dynamic> route) => false,
                    // );
                  },
                  child: Text('Sign up',
                      style: TextStyle(fontSize: 20, fontFamily: 'Mulish')),
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Color.fromRGBO(142, 232, 140, 1),
                      elevation: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({ Key? key }) : super(key: key);

  final api = APIAuth();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: ((MediaQuery.of(context).size.width ~/ 1.3).toDouble()),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('E-mail', style: TextStyle(fontFamily: 'Mulish')),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(0.0)),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5,
                          )
                      ),
                      hintText: 'Enter your e-mail',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password', style: TextStyle(fontFamily: 'Mulish')),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(0.0)),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5,
                          )
                      ),
                      hintText: 'Enter your password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 15),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15, bottom: 20),
              child: TextButton(
                onPressed: () {
                  final token = api.signIn(_emailController.text, _passwordController.text);
                  print(token);
                  // if (token != null) {
                  //   Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()),
                  //     (Route<dynamic> route) => false,
                  //   );
                  // }
                },
                child: Text('Sign in',
                    style: TextStyle(fontSize: 20, fontFamily: 'Mulish')),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Color.fromRGBO(142, 232, 140, 1),
                    elevation: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}