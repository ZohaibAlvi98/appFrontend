import 'package:flutter/material.dart';

class HomeScreenButtonTextPicture extends StatelessWidget {
  final String boldText;
  final String infotext;
  final String imgPath;
  final Function onPressed;

  HomeScreenButtonTextPicture(
      {this.boldText, this.infotext, this.imgPath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 4.0),
        color: Colors.grey[200],
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 15.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      boldText,
                      style: TextStyle(
                        fontFamily: 'RMNUEU',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        infotext,
                        style: TextStyle(
                          fontFamily: 'RMNUEUREGULAR',
                          fontSize: 13.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Image.network(imgPath),
            ),
          ],
        ),
      ),
    );
  }
}
