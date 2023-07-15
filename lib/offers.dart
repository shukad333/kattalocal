import 'package:flutter/material.dart';
import 'package:kattalocal/data/offer_data.dart';

class OfferPage extends StatefulWidget {
  var obj;

  OfferPage({Key? key, required this.obj}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OfferPage(obj: obj);
  }
}

class _OfferPage extends State<OfferPage> {
  var obj;

  _OfferPage({Key? key, required this.obj});

  final nameCont = TextEditingController();
  final discount = TextEditingController();

  var data = Offer.getOffers();

  // @override
  // void setState(VoidCallback fn) {
  //   print('Set state CXXXX');
  //   data = Offer.getOffers();
  // }
  // var data = Offer.getOffers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(obj['name']),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return MyCard(obj: data[index]);
              }),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Add Offer'),
                  content: Center(
                      child: Column(
                    children: [
                      TextField(
                        controller: nameCont,
                        decoration: const InputDecoration.collapsed(
                            hintText: 'Item Name'),
                      ),
                      TextField(
                        controller: discount,
                        decoration: const InputDecoration.collapsed(
                            hintText: 'Discount'),
                      ),
                    ],
                  )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () =>
                          save(nameCont.text, discount.text, context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }));
  }

  save(n, d, context) {
    print('XXXX');
    Offer.addOffer(Offer(n, int.parse(d)));
    setState(() {
      data = Offer.getOffers();
    });
    print(data);
    Navigator.pop(context, 'OK');
  }
}

class MyCard extends StatelessWidget {
  var obj;

  MyCard({Key? key, required this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OfferPage(obj: obj)));
          },
          child: Card(
            color: Colors.blue[200],
            shadowColor: Colors.amber,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.add)),
              title: Text(obj.name),
              subtitle: Text(obj.percent.toString() + " %"),
              trailing: Icon(Icons.hotel),
            ),
          ),
        ),
        const Divider(
          //*iki eleman arasini bolen cizgi
          color: Colors.red,
          thickness: 1,
          height: 10,
          indent: 20,
          //*soldan bosluk
          endIndent: 20, //*sagdan bosluk
        )
      ],
    );
  }
}
