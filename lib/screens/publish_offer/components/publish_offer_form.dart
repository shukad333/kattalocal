import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kattalocal/components/custom_surfix_icon.dart';
import 'package:kattalocal/components/default_button.dart';
import 'package:kattalocal/components/form_error.dart';
import 'package:kattalocal/data/offer_rest_util.dart';
import 'package:kattalocal/models/offer.dart';
import 'package:kattalocal/screens/home/home_screen.dart';
import 'package:kattalocal/screens/otp/otp_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class PublishOfferForm extends StatefulWidget {
  @override
  _PublishOfferFormState createState() => _PublishOfferFormState();
}

class _PublishOfferFormState extends State<PublishOfferForm> {
  bool _isLoaderVisible = false;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  late String title;
  late String description;
  late String currentPrice;
  late String offerPrice;
  late String startDate;
  late String endDate;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          offerTitleFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          offerDescriotionFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          currentPriceOfferPriceFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Publish",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                setState(() {
                  OverlayLoadingProgress.start(context);
                });
                print("XXXXCCCCC");
                print(title);
                Offer offer = Offer(
                    id: null,
                    title: title,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    currentPrice: currentPrice,
                    offerPrice: offerPrice);
                print("XXXX Saving");
                print(offer);
                OfferRestUtil offerutil = OfferRestUtil();
                await offerutil.saveOffer('1', offer);
                OverlayLoadingProgress.stop();
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextEditingController currentPriceController = new TextEditingController();
  TextEditingController offerPriceController = new TextEditingController();

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: offerPriceController,
      onSaved: (newValue) => offerPrice = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  FocusNode focusNode = FocusNode();

  IntlPhoneField buildPhoneNumberFormField() {
    return IntlPhoneField(
      focusNode: focusNode,
      initialCountryCode: 'IN',
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      languageCode: "en",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ' + country.name);
        print('Country changed to: ' + country.code);
      },
    );
  }

  Row currentPriceOfferPriceFormField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onSaved: (newValue) => currentPrice = newValue!,
            decoration: const InputDecoration(
                labelText: "Current Price",
                hintText: "",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        ),
        Expanded(
          child: TextFormField(
            onSaved: (newValue) => offerPrice = newValue!,
            decoration: const InputDecoration(
                labelText: "Discount Price",
                hintText: "",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        )
      ],
    );
  }

  TextEditingController startDateController = new TextEditingController();
  TextEditingController endDateController = new TextEditingController();

  Row buildEmailFormField() {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: startDateController,
                onSaved: (newValue) => startDate = newValue!,
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      //get today's date
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.

                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    setState(() {
                      print("XXXXX");
                      print(pickedDate.toString());
                      startDateController.text = DateFormat("yyyy-MM-dd")
                          .format(pickedDate)
                          .toString();
                    });
                  }
                },
                decoration: const InputDecoration(
                    labelText: "Start Date",
                    hintText: "",
                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ],
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: endDateController,
            onSaved: (newValue) => endDate = newValue!,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  //get today's date
                  firstDate: DateTime(2000),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                setState(() {
                  print("XXXXX");
                  print(pickedDate.toString());
                  endDateController.text =
                      DateFormat("yyyy-MM-dd").format(pickedDate).toString();
                });
              }
            },
            decoration: const InputDecoration(
                labelText: "End Date",
                hintText: "",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        )
      ],
    );
  }

  TextFormField offerDescriotionFormField() {
    return TextFormField(
      onSaved: (newValue) => description = newValue!,
      decoration: const InputDecoration(
        labelText: "Description",
        hintText: "Enter your offer description",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField offerTitleFormField() {
    return TextFormField(
      onSaved: (newValue) => title = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Your Offer Title",
          hintText: "Enter your Offer Title",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
