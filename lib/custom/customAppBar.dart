import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double _preferredHeight = 100.0;

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.center,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xFF002B32),
                  child: Text(
                    'My Investments',
                    style: TextStyle(
                        color: Color(0xFFDBDBDB),
                        fontSize: 19.0
                    ),
                  ),
                )
            ),
            Expanded(
              child: RaisedButton(
                color: Color(0xFFFEAD34),
                child: Text(
                  'Add an Investment',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/addInvestment');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}