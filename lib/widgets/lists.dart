import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget Lists(context, check, image, index, name, price, id, brand) {
  final f = NumberFormat('#,###.0#');
  return Container(
    margin: EdgeInsets.all(1.0),
    color: Color(int.parse('#e5e6ea'.replaceAll('#', '0xff'))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(1.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 8, right: 10.0, left: 10.0),
            child: Text(
              brand,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RMNUEUREGULAR'),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 8, right: 10.0, left: 10.0),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.w600,
                  fontFamily: 'RMNUEUREGULAR'),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              '\$' + f.format(num.tryParse(price)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'RMNUEUREGULAR',
                  color: Colors.grey[600]),
            ),
          ),
        ),
      ],
    ),
  );
}
