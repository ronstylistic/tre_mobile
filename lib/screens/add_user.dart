import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

const IconData close = IconData(0xe16a, fontFamily: 'MaterialIcons');
String? selectedValue;
List<String> items = ['Admin', 'User'];

class _AddUserState extends State<AddUser> {
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
              icon: const Icon(close)
          ),
          const SizedBox(width: customPadding / 2)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(customPadding / 2),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Firstname',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Lastname',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Company',
                    ),
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
                    items: items
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
                      setState(() {
                        selectedValue = newValue;
                      });
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
                        onPressed: (() => {}),
                        child: const Text('Save')
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

