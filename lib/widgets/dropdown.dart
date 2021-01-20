import 'package:flutter/material.dart';

// class DropDown extends StatefulWidget {
//   final String heading;
//   final String content;
//   DropDown({Key key, @required this.heading, this.content}) : super(key: key);
//   @override
//   _DropDownState createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('hey');
//         setState(() {

//         });
//       },
//       child: Container(
//         margin: EdgeInsets.only(left: 20, right: 20),
//         // color: Colors.red,
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//         child: Row(
//           children: [
//             Text(
//               'Sizes',
//               style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w600),
//             ),
//             Spacer(),
//             Icon(
//               Icons.arrow_downward,
//               color: Colors.black87,
//               size: 30,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Item {
//   Item({
//     this.expandedValue,
//     this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List name = ['Description', 'Vendor', 'Sizing', 'Shipping & Returns'];

// List<Item> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: name[index],
//     );
//   });
// }

// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   List<Item> _data = generateItems(4);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               tileColor: Colors.white54,
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//             title: Text('heyy'),
//             // title: Text(item.expandedValue),
//             subtitle: Text('To delete this panel, tap the trash can icon'),
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

class DropDown extends StatefulWidget {
  final String brand;
  final String link;
  DropDown({Key key, @required this.brand, @required this.link})
      : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final list2 = ['Description', 'Vendor', 'Sizing', 'Shipping & returns'];

  final list = new List.generate(1, (i) => "item");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: list2.length,
          itemBuilder: (context, i) => Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Card(
                  child: ExpansionTile(
                      title: new Text(
                        list2[i],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      children: list
                          .map((val) => new ListTile(
                                title: i == 0
                                    ? Text(
                                        'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.\n',
                                        style: TextStyle(height: 1.8),
                                      )
                                    : i == 1
                                        ? Column(
                                            children: [
                                              Text(
                                                widget.brand,
                                                style: TextStyle(
                                                    fontSize:
                                                        width < 400 ? 18 : 20,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Container(
                                                  height: 45,
                                                  width: 250,
                                                  child: FlatButton(
                                                    color: Colors.black,
                                                    // height: 45,
                                                    // minWidth: 23,
                                                    onPressed: () {},
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Text(
                                                        'More Products from ${widget.brand}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        : i == 2
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Shoe Size Chart',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Image.asset(
                                                        'assets/images/productDetail/size1.jpg'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            8.0, 20, 8, 10),
                                                    child: Text(
                                                      'Clothing Size Chart',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Image.asset(
                                                        'assets/images/productDetail/size2.jpg'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              )
                                            : Text(
                                                'For more information about return please click here.\n',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                              ))
                          .toList()),
                ),
              )),
    );
  }
}
