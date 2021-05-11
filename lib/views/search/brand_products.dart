import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/views/products/product-detail-withapi.dart';
import 'package:splyxp/widgets/lists.dart';
import '../../services/drawr-services.dart';
import 'package:splyxp/widgets/lineHeading.dart';

DrawrServices data = DrawrServices();

class BrandProducts extends StatefulWidget {
  final String brandId;
  final String brandname;
  BrandProducts({Key key, @required this.brandId, @required this.brandname})
      : super(key: key);
  @override
  _BrandProductsState createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  String getBrand(prodList) {
    for (var a = 0; a < prodList['meta_data'].length; a++) {
      if (prodList['meta_data'][a]['key'] == '_select_brand') {
        return prodList['meta_data'][a]['value'];
      }
    }
  }

  void _navigatorPage(context, id) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return ProductDetail(
            prodId: id,
          );
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Heading(context, widget.brandname),
              FutureBuilder(
                  future: data.getDrawrProducts(widget.brandId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(left: 1, right: 1, top: 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.1),
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = snapshot.data[index];
                            final brand = getBrand(item);
                            return InkWell(
                              onTap: () => _navigatorPage(
                                  context, item['id'].toString()),
                              child: Lists(
                                context,
                                'men',
                                item['images'][0]['src'],
                                index,
                                item['name'],
                                item['price'],
                                item['id'].toString(),
                                brand,
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      print('Sorry');
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
