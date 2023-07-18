import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:kattalocal/data/offer_data.dart';
import 'package:kattalocal/new_offer_page.dart';

class BusinessDetailPage extends StatefulWidget {
  var obj;

  BusinessDetailPage({Key? key, required this.obj}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OfferPage(obj: obj);
  }
}

class _OfferPage extends State<BusinessDetailPage> {
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
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];

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
        floatingActionButton: SpeedDial(
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          // / This is ignored if animatedIcon is non null
          // child: Text("open"),
          // activeChild: Text("close"),

          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          mini: mini,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
                  return ElevatedButton(
                    onPressed: toggleChildren,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 18),
                    ),
                    child: const Text(
                      "Custom Dial Root",
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                }
              : null,
          buttonSize: buttonSize,
          // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          label: extend ? const Text("Open") : null,
          // The label of the main button.
          /// The active label of the main button, Defaults to label if not specified.
          activeLabel: extend ? const Text("Close") : null,

          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the SpeedDial childrens size
          childrenButtonSize: childrenButtonSize,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,

          /// If true user is forced to close dial manually
          closeManually: closeManually,

          /// If false, backgroundOverlay will not be rendered.
          renderOverlay: renderOverlay,
          // overlayColor: Colors.black,
          // overlayOpacity: 0.5,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.white,
          // activeForegroundColor: Colors.red,
          // activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: customDialRoot
              ? const RoundedRectangleBorder()
              : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            // SpeedDialChild(
            //   child: !rmicons ? const Icon(Icons.accessibility) : null,
            //   backgroundColor: Colors.red,
            //   foregroundColor: Colors.white,
            //   label: 'First',
            //   onTap: () => setState(() => rmicons = !rmicons),
            //   onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            // ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.brush) : null,
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'New Events',
              onTap: () => debugPrint('SECOND CHILD'),
            ),
            SpeedDialChild(
                child: !rmicons ? const Icon(Icons.margin) : null,
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                label: 'New Offer',
                visible: true,
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewOfferPage()))
                    }),
          ],
        ));
    // floatingActionButton: FloatingActionButton(
    //     child: const Icon(Icons.add),
    //     onPressed: () {
    //       showDialog<String>(
    //         context: context,
    //         builder: (BuildContext context) => AlertDialog(
    //           title: const Text('Add Offer'),
    //           content: Center(
    //               child: Column(
    //             children: [
    //               TextField(
    //                 controller: nameCont,
    //                 decoration: const InputDecoration.collapsed(
    //                     hintText: 'Item Name'),
    //               ),
    //               TextField(
    //                 controller: discount,
    //                 decoration: const InputDecoration.collapsed(
    //                     hintText: 'Discount'),
    //               ),
    //             ],
    //           )),
    //           actions: <Widget>[
    //             TextButton(
    //               onPressed: () => Navigator.pop(context, 'Cancel'),
    //               child: const Text('Cancel'),
    //             ),
    //             TextButton(
    //               onPressed: () =>
    //                   save(nameCont.text, discount.text, context),
    //               child: const Text('OK'),
    //             ),
    //           ],
    //         ),
    //       );
    //     }));
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BusinessDetailPage(obj: obj)));
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
