import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/views/search/categories/accessories_search.dart';

class Categories extends StatefulWidget {
  final String gender;
  Categories({Key key, @required this.gender}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithMenu(context),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.black, //This will change the drawer background to blue.
            //other styles
          ),
          child: drawerAppBar(context, '', false)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              widget.gender + ' Categories',
              style: TextStyle(
                  fontFamily: 'RMNUEU',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1),
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 8,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(right: 20.0, left: 7, top: 10),
              itemBuilder: (context, index) {
                List men = [
                  'Accessories',
                  'Bottoms',
                  'Hoodies',
                  'Jackets and Coats',
                  'Shoes',
                  'Shorts',
                  'Sweaters',
                  'Tops',
                ];
                double width = MediaQuery.of(context).size.width;
                return list(context, men, index, width);
              }),
        ],
      ),
    );
  }

  Widget list(context, headings, index, width) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 3, 3, 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            new PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(),
              pageBuilder: (BuildContext context, _, __) {
                if (index == 0) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else if (index == 1) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else if (index == 2) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else if (index == 3) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else if (index == 4) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else if (index == 5) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else if (index == 6) {
                  return Accessories(
                    gender: widget.gender,
                  );
                } else
                  return Accessories(
                    gender: widget.gender,
                  );
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new SlideTransition(
                  child: child,
                  position: new Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                );
              },
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Stack(
                  children: [
                    Text(
                      headings[index],
                      style: TextStyle(
                          fontSize: width < 400 ? 15 : 17,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: width < 400
                          ? EdgeInsets.only(left: 291, top: 3)
                          : EdgeInsets.only(left: 343, top: 1.2),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: new Divider(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
