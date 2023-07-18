import 'package:flutter/material.dart';
import 'package:kattalocal/data/offer_data.dart';


class NewOfferPage extends StatefulWidget {
  const NewOfferPage({Key? key}) : super(key: key);

  @override
  State<NewOfferPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewOfferPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String description = "";
  String currentPrice = "";
  String offerPrice = "";

  var measure;

  void _submit() {
    Offer.addOffer(Offer(description,currentPrice,offerPrice,startDate.text,endDate.text));
    // showDialog<void>(
    //   context: context,
    //   barrierDismissible: true, // user can tap anywhere to close the pop up
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: const Text('Your information has been submitted'),
    //       content: SingleChildScrollView(
    //         child: Column(
    //           children: <Widget>[
    //             const Align(
    //                 alignment: Alignment.topLeft,
    //                 child: Text("Full name:",
    //                     style: TextStyle(fontWeight: FontWeight.w700))),
    //             Align(
    //               alignment: Alignment.topLeft,
    //               child: Text(firstName + " " + lastName),
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             const Align(
    //                 alignment: Alignment.topLeft,
    //                 child: Text("Body Temperature:",
    //                     style: TextStyle(fontWeight: FontWeight.w700))),
    //             Align(
    //               alignment: Alignment.topLeft,
    //               child: Text("$bodyTemp ${measure == 1 ? "ºC" : "ºF"}"),
    //             )
    //           ],
    //         ),
    //       ),
    //       actions: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 primary: Colors.white,
    //                 backgroundColor: Colors.grey,
    //                 shape: const RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.all(Radius.circular(10))),
    //               ),
    //               child: const Text('Go to profile'),
    //               onPressed: () {},
    //               // onPressed: () async {
    //               //   FocusScope.of(context)
    //               //       .unfocus(); // unfocus last selected input field
    //               //   Navigator.pop(context);
    //               //   await Navigator.push(
    //               //       context,
    //               //       MaterialPageRoute(
    //               //           builder: (context) =>
    //               //               MyProfilePage())) // Open my profile
    //               //       .then((_) => _formKey.currentState
    //               //       ?.reset()); // Empty the form fields
    //               //   setState(() {});
    //               // }, // so the alert dialog is closed when navigating back to main page
    //             ),
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 primary: Colors.white,
    //                 backgroundColor: Colors.blue,
    //                 shape: const RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.all(Radius.circular(10))),
    //               ),
    //               child: const Text('OK'),
    //               onPressed: () {
    //                 Navigator.of(context).pop(); // Close the dialog
    //                 FocusScope.of(context)
    //                     .unfocus(); // Unfocus the last selected input field
    //                 _formKey.currentState?.reset(); // Empty the form fields
    //               },
    //             )
    //           ],
    //         )
    //       ],
    //     );
    //   },
    // );
    Navigator.of(context).pop();
  }

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Add New Offer"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, size: 32.0),
            tooltip: 'new Offer',
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => MyProfilePage(),
              //     ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Add Offer",
                  style: TextStyle(
                    fontSize: 24,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Description',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      setState(() {
                        description = value.toUpperCase();
                        // firstNameList.add(firstName);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        description = value.toUpperCase();
                      });
                    },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty || value.length < 3) {
                    //     return 'Business Name must contain at least 3 characters';
                    //   } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                    //     return 'Business Name cannot contain special characters';
                    //   }
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Current Price',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty || value.length < 3) {
                    //     return 'Primary Name must contain at least 3 characters';
                    //   } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                    //     return 'Primary Name cannot contain special characters';
                    //   }
                    // },
                    onFieldSubmitted: (value) {
                      setState(() {
                        currentPrice = value.toUpperCase();
                        // lastNameList.add(lastName);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        currentPrice = value.toUpperCase();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Offer Price',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null
                          // value.isEmpty ||
                          // value.contains(RegExp(r'^[a-zA-Z\-]')
                      ) {
                        return 'Use only numbers!';
                      }
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        offerPrice = value;
                        // bodyTempList.add(bodyTemp);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        offerPrice = value;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: startDate,
                    decoration: const InputDecoration(
                      labelText: "Start Date",
                      hintText: "Ex. Insert your dob",
                    ),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      var stDate = DateTime.parse(date!.toIso8601String());
                      startDate.text = "${stDate.day}-${stDate.month}-${stDate.year}";
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: endDate,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                      hintText: "Ex. Insert your dob",
                    ),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      var eDate = DateTime.parse(date!.toIso8601String());
                      endDate.text = "${eDate.day}-${eDate.month}-${eDate.year}";
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // DropdownButtonFormField(
                  //     decoration: const InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(20.0)),
                  //           borderSide:
                  //           BorderSide(color: Colors.grey, width: 0.0),
                  //         ),
                  //         border: OutlineInputBorder()),
                  //     items: [
                  //       const DropdownMenuItem(
                  //         child: Text("ºC"),
                  //         value: 1,
                  //       ),
                  //       const DropdownMenuItem(
                  //         child: Text("ºF"),
                  //         value: 2,
                  //       )
                  //     ],
                  //     hint: const Text("Select item"),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         measure = value;
                  //         // measureList.add(measure);
                  //       });
                  //     },
                  //     onSaved: (value) {
                  //       setState(() {
                  //         measure = value;
                  //       });
                  //     }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60)),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        _submit();
                      }
                    },
                    child: const Text("Publish Offer"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
