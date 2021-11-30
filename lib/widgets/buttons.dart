import 'package:flutter/material.dart';

class AuthPageButtons extends StatelessWidget {
  const AuthPageButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: TextButton.icon(
            icon: Image(image: AssetImage('images/google.png'), height: 25),
            onPressed: () => {},
            label: Text('Sign up with Google account',
                style: TextStyle(fontSize: 20, fontFamily: 'Mulish')),
            style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Color.fromRGBO(142, 232, 140, 1),
                elevation: 10),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: TextButton.icon(
            icon: Icon(Icons.person_add_alt_1_sharp),
            onPressed: () => {
              Navigator.pushNamed(context, '/register')
            },
            label: Text('Sign up',
                style: TextStyle(fontSize: 20, fontFamily: 'Mulish')),
            style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Color.fromRGBO(142, 232, 140, 1),
                elevation: 10),
          ),
        ),
      ],
    );
  }
}
