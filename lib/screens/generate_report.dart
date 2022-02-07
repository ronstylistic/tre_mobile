import 'package:flutter/material.dart';
import 'package:tre_app/custom/app_bar.dart';

import '../constant.dart';

class GenerateReport extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  GenerateReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Generate Report"),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: customTextColor,
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saving Data'))),
                    /*if(await userController.submitData()){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Successfully Added')));
                    }*/
                  }
                },
                child: const Text('Download')
            ),
          ),
        ),
      ),
    );
  }
}
