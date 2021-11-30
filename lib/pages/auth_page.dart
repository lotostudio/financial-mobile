import 'package:finance_app/widgets/appbars.dart';
import 'package:finance_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthPageAppBar(height: (MediaQuery.of(context).size.height ~/ 3).toDouble()),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all((MediaQuery.of(context).size.height ~/ 10).toDouble()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  'Sign up to create a secure account',
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Mulish',
                    ),),
              ),
              AuthPageButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already registered?',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    }, 
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Mulish',
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}