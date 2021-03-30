import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Designer extends StatefulWidget {
  @override
  _DesignerState createState() => _DesignerState();
}

class _DesignerState extends State<Designer> {
  List designer = [
    'Designer 1',
    'Designer 2',
    'Designer 3',
    'Designer 4',
    'Designer 5',
    'Designer 6',
    'Designer 7',
    'Designer 8',
    'Designer 9',
    'Designer 10',
    'Designer 11',
    'Designer 12',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: innerAppbar(context, 'DESIGNERS'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 90,
              // width: 450,
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
              child: new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: '  Search Designers',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.8,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // shrinkWrap: true,
                  itemCount: 12,
                  // physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(right: 20.0, left: 7, top: 20),
                  itemBuilder: (context, index) {
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
                                      designer[index],
                                      style: TextStyle(
                                          fontSize: width < 400 ? 15 : 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: width < 400
                                          ? EdgeInsets.only(left: 291, top: 3)
                                          : EdgeInsets.only(
                                              left: 343, top: 1.2),
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
