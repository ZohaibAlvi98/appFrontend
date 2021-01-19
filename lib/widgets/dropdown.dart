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
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List name = ['Description', 'Vendor', 'Sizing', 'Shipping & Returns'];

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: name[index],
    );
  });
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              tileColor: Colors.white54,
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text('heyy'),
            // title: Text(item.expandedValue),
            subtitle: Text('To delete this panel, tap the trash can icon'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
