
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kattalocal/business.dart';
import 'package:kattalocal/business_detail.dart';
import 'package:kattalocal/offers.dart';
import 'package:kattalocal/routes.dart';
import 'package:kattalocal/screens/splash/splash_screen.dart';
import 'package:kattalocal/theme.dart';



void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // runApp(MaterialApp(home: Dashboard()));
  runApp(const LocalApp());
}

class LocalApp extends StatelessWidget {
  const LocalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katta Local',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}




class Business {
  static final getData = [
    {
      'name': 'Home Fresh',
      'location' : 'Mananthavady'
    },
    {
      'name': 'Sports Town',
      'location' : 'Kalpetta'
    }
  ];
}
class Dashboard extends StatelessWidget {
  var data = Business.getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: ListView.builder(itemCount:data.length,itemBuilder: (context,index) {
          return MyCard(obj: data[index]);
        }),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessPage()));},
      ),
    );
  }
}

class MyCard extends StatelessWidget{
   var obj;
   MyCard({Key? key, required this.obj}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Column(
       children: [
         InkWell(
           onTap: (){

       Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessDetailPage(obj:obj)));
           },
           child: Card(
             color: Colors.blue[200],
             shadowColor: Colors.amber,
             elevation: 5,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10),
             ),
             child:  ListTile(
               leading: CircleAvatar(child: Icon(Icons.add)),
               title: Text(this.obj['name']),
               subtitle: Text(obj['location']),
               trailing: Icon(Icons.hotel),
             ),
           ),
         ),
         const Divider(
           //*iki eleman arasini bolen cizgi
           color: Colors.red,
           thickness: 1,
           height: 10,
           indent: 20, //*soldan bosluk
           endIndent: 20, //*sagdan bosluk
         )
       ],
     );
  }

}