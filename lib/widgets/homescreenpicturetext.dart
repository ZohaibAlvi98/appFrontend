import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreenButtonPictureText extends StatelessWidget {
  final String boldText;
  final String infotext;
  final String imgPath;
  final Function onPressed;

  HomeScreenButtonPictureText(
      {this.boldText, this.imgPath, this.infotext, this.onPressed});

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
              child: CachedNetworkImage(imageUrl: imgPath),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.only(right: 7),
                      child: Text(
                        infotext,
                        style: TextStyle(
                          fontFamily: 'RMNUEUREGULAR',
                          fontSize: 13.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
