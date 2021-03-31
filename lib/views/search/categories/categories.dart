import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

Widget list(context, headings, index, width) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(3.0, 3, 3, 5),
    child: InkWell(
      onTap: () {
        // _navigatorPage(heading[index]);
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

class _CategoriesState extends State<Categories> {
  List<Widget> containers = [
    ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 12,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(right: 20.0, left: 7, top: 20),
        itemBuilder: (context, index) {
          List women = [
            'New In',
            'Shop By',
            'Clothing',
            'Bags',
            'Jewelry',
            'Accessories',
            'Item 1',
            'Item 2',
            'Item 3',
            'Item 4',
            'Item 5',
            'Item 6',
          ];
          double width = MediaQuery.of(context).size.width;
          return list(context, women, index, width);
        }),
    ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 12,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(right: 20.0, left: 7, top: 20),
        itemBuilder: (context, index) {
          List men = [
            'Shop By',
            'Clothing',
            'Activewear',
            'Shoes',
            'Sneakers',
            'Watches',
            'Item 1',
            'Item 2',
            'Item 3',
            'Item 4',
            'Item 5',
            'Item 6',
          ];
          double width = MediaQuery.of(context).size.width;
          return list(context, men, index, width);
        }),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: innerAppbar(context, 'categories'),
        body: TabBarView(children: containers),
      ),
    );
  }
}
