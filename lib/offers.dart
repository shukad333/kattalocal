import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:kattalocal/data/offer_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

  var data;// = Offer.getOffers();

  @override
  void setState(VoidCallback fn) async{
    // TODO: implement setState
    print('YYYYYYY');
    data = await offers();
  }

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

  Future<List<Offer>>? _future;
  @override
  void initState() {
    // TODO: implement initState
    print('XXXXXXXOOOO');
    data = offers();
    _future = offers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('XXX'),
        ),
        body: FutureBuilder<List>(
          future: offers(),
            builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return MyCard(obj: snapshot.data![index]);
              });
        }),
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
          buttonSize:
          buttonSize, // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          label: extend
              ? const Text("Open")
              : null, // The label of the main button.
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
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(("Third Child Pressed")))),
              onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        )
        );
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
    // Offer.addOffer(Offer(n, int.parse(d)));
    setState(() {
      // data = Offer.getOffers();
    });
    print(data);
    Navigator.pop(context, 'OK');
  }

  Future<List<Offer>> offers() async {
    // Get a reference to the database.

    print("XVXVXVX");
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      // onCreate: (db, version) {
      //   // Run the CREATE TABLE statement on the database.
      //   return db.execute(
      //     'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      //   );
      // },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('offer');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Offer(
        maps[i]['description'],
         maps[i]['currentPrice'],
        maps[i]['offerPrice'],
        maps[i]['startDate'],
        maps[i]['endDate'],
      );
    });
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
              title: Text(obj.description),
              subtitle: Text(obj.currentPrice),
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
