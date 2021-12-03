import 'package:finance_app/pages/profile_page.dart';
import 'package:finance_app/services/api_auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final api = APIAuth();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 25),
              width: ((MediaQuery.of(context).size.width ~/ 4).toDouble()),
              height: ((MediaQuery.of(context).size.width ~/ 6).toDouble()),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Icon(Icons.person_add_alt_1_rounded,
                  size: ((MediaQuery.of(context).size.width ~/ 6).toDouble()),
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: Text(
                    'Create a new account',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Mulish',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Form(
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
                          onPressed: () async {
                            final token = await api.register(
                              _firstName.text, 
                              _lastName.text, 
                              _email.text, 
                              _password.text);
                            print('Value at widget - $token');
                            print(_password.text);
                            if (token != null) {
                              Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => ProfilePage(token: token,)),
                                        (Route<dynamic> route) => false,
                                      );
                            } else {
                              showDialog(
                              context: context, 
                              builder: (BuildContext context ) => AlertDialog(
                                title: const Text('Register failed!'),
                                content: const Text('Fill in the fields correctly and try again.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));
                            }
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
            ),
          ],
        ),
      ),
    );
  }
}
