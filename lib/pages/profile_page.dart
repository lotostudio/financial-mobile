import 'package:finance_app/models/user_model.dart';
import 'package:finance_app/pages/auth_page.dart';
import 'package:finance_app/services/api_user_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({ Key? key, required this.token }) : super(key: key);

  final String token;

  final api = APIUserDetail();

  @override
  Widget build(BuildContext context) {
    return FutureProvider<UserModel>(
      initialData: UserModel(
        firstName: '',
        lastName: '',
        email: '',
        authSucceed: false
      ),
      create: (context) => api.getUserData(token),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Color.fromRGBO(53, 166, 91, 1),
          titleTextStyle: TextStyle(fontFamily: 'Mulish', fontSize: 20),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              color: Color.fromRGBO(230, 238, 238, 1),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Mulish',
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Consumer<UserModel>(
                                    builder: (context, model, child) {
                                       return Text(
                                                model.firstName,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Mulish',
                                                ),
                                                textAlign: TextAlign.start,
                                              );
                                    }, 
                                  ),
                                  const Divider(),
                                  Text(
                                    'Last Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Mulish',
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Consumer<UserModel>(
                                    builder: (context, model, child) {
                                       return Text(
                                                model.lastName,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Mulish',
                                                ),
                                                textAlign: TextAlign.start,
                                              );
                                    }, 
                                  ),
                                  const Divider(),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Mulish',
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Consumer<UserModel>(
                                    builder: (context, model, child) {
                                       return Text(
                                                model.email,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Mulish',
                                                ),
                                                textAlign: TextAlign.start,
                                              );
                                    }, 
                                  ),
                                ],
                              ),
                              Image(image: AssetImage('images/google.png'))
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => AuthPage()),
                                    (Route<dynamic> route) => false,
                                  );
                              },
                              child: Text('Log out',
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
                  Card(child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text(
                          'Change password',
                          style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Mulish',
                                    ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Leave blank if you do not want to change it',
                          style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Mulish',
                                    ),
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 15),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Confirm password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 15),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 15),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => AuthPage()),
                                    (Route<dynamic> route) => false,
                                  );
                              },
                              child: Text('Change password',
                                  style: TextStyle(fontSize: 20, fontFamily: 'Mulish')),
                              style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: Color.fromRGBO(142, 232, 140, 1),
                                  elevation: 10),
                            ),
                          ),
                      ],
                    ),
                  ),)
                ],
              ),
            )
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(53, 166, 91, 1),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_membership), 
              label: 'Wallet'),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows), 
              label: 'Transactions'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), 
              label: 'Analytics'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              label: 'Profile'),
          ],
        ),
      ),
    );
  }
}