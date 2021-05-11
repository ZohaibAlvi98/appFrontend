import 'package:flutter/material.dart';
import 'package:splyxp/views/search/categories/categories.dart';
import 'package:splyxp/views/search/designer/designer.dart';
import 'package:splyxp/views/search/bygender.dart';
import 'package:splyxp/views/search/bybrand.dart';
import 'package:splyxp/views/search/search_products.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'Categories') {
            return ByGender();
          } else {
            return ByBrand();
          }
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new SlideTransition(
            child: child,
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
          );
        }));
  }

  void _nagvigatorsearch(value) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return SearchProducts(searchName: value);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new SlideTransition(
            child: child,
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
          );
        }));
  }

  List heading = ['Brands', 'Categories'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 15),
            child: Text(
              'SEARCH',
              style: TextStyle(
                  fontFamily: 'RMNUEU',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1),
            ),
          ),
          Container(
            width: 460,
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
            child: new TextField(
              onSubmitted: (value) {
                _nagvigatorsearch(value);
              },
              textInputAction: TextInputAction.search,
              cursorColor: Colors.black,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
                filled: true,
                fillColor: Colors.grey[300],
                // focusedBorder: InputBorder.none,
                // enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300], width: 0.01),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300], width: 0.01),
                ),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: '  Search Products, Design & etc',
                hintStyle: TextStyle(fontFamily: 'RMNUEUREGULAR'),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: 2,
              padding: EdgeInsets.only(right: 20.0, left: 7),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5, 5, 8),
                  child: InkWell(
                    onTap: () {
                      _navigatorPage(heading[index]);
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
                                  heading[index],
                                  style: TextStyle(
                                      fontFamily: 'RMNUEUSEMIBOLD',
                                      fontSize: width < 400 ? 18 : 21,
                                      fontWeight: FontWeight.w700),
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
                          padding: EdgeInsets.only(top: 8),
                          child: new Divider(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
