import 'package:flutter/material.dart';

class AuthPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AuthPageAppBar({Key? key, required this.height}) : super(key: key);

  final double height;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(53, 166, 91, 1),
      flexibleSpace: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: ((MediaQuery.of(context).size.height ~/ 16).toDouble()),
              horizontal:
                  ((MediaQuery.of(context).size.width ~/ 5).toDouble())),
          child: const Image(
            image: AssetImage('images/logo.png'),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
