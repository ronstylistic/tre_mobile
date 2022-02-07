import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tre_app/controller/user_controller.dart';

class AddUser extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());
  AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customPrimaryColor,
        elevation: 0,
        title : const Text("Add User",
            style: TextStyle(color: Colors.white)
        ),
        automaticallyImplyLeading: false,
        actions: <Widget> [
          IconButton(
              color: Colors.white,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(IconData(0xe16a, fontFamily: 'MaterialIcons'))
          ),
          const SizedBox(width: customPadding / 2)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form (
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(customPadding / 2),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: userController.firstname,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Firstname',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: userController.lastname,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Lastname',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: userController.email,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return 'Email is not valid';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: userController.company,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:DropdownButtonFormField2(
                        decoration: InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'User Level',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        items: roles
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select User level.';
                          }
                        },
                        onChanged: (String? newValue) {
                          userController.userModel.role = newValue;
                        }
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: width,
                      height: 50,
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
                              if(await userController.submitData()){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Successfully Added')));
                              }
                            }
                          },
                          child: const Text('Save')
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

