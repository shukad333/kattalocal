import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Business'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.person))
                ],
              ),
              const SizedBox(
                height: 40,
              ),Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: TextFormField(
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
