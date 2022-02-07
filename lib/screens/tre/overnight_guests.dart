import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/custom/accordion.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tre_app/models/non_philippines_res.dart';

import '../../constant.dart';

class OvernightGuests extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  OvernightGuests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Overnight Guests"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(customPadding),
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
                        'Select Month of Report',
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
                      items: months
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
                          return 'Select Month of Report';
                        }
                      },
                      onChanged: (String? newValue) {

                      }
                  ),
                ),
                generatePhilippineResidents(),
                generateNonPhilippineResidents(),
                generateOverseasFilipinos(),
                generateOthers(),
                generateOccupancy(),
                Padding(
                  padding: const EdgeInsets.all(customPadding),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: customTextColor,
                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                      onPressed: (() => {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saving Data')),
                          )
                        }
                      }),
                      child: const Text("Submit")
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Accordion generatePhilippineResidents() {
    return Accordion(
      title: "Philippine Residents",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Filipino Nationality"),
              Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      //controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Male',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      //controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Female',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: customPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Foreign Nationality"),
              Row(
                children: const [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      //controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Male',
                      ),
                    ),
                  ),
                  SizedBox(width: customPadding / 2),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      //controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Female',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: customPadding / 2),
          const Center(
            child: Text("Total: 0",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}




Accordion generateNonPhilippineResidents() {
  return Accordion(
    title: "Non-Philippine Residents",
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: nonPhResItem.length,
          itemBuilder: (BuildContext context, int index){
            return nonPhilippinesResidentsItem(nonPhResItem[index]);
          }
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: customTextColor,
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              onPressed: (() => {}),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add),
                  Text("Add More")
                ],
              )
          ),
        ),
      ],
    ),
  );
}

Widget nonPhilippinesResidentsItem(NonPhilippinesResident item){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 1,
            child: TextField(
              //controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Country',
              ),
            ),
          ),
          const SizedBox(width: customPadding/ 2),
          Row(
            children: const [
              SizedBox(
                width: 80,
                child: TextField(
                  //controller: nameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Count',
                  ),
                ),
              )
            ],
          )
        ],
      ),
      const SizedBox(height: customPadding / 2)
    ],
  );
}

Accordion generateOverseasFilipinos() {
  return Accordion(
    title: "Overseas Filipinos",
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Specification/Remarks"),
            Row(
              children: const [
                SizedBox(
                  width: 80,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Accordion generateOthers() {
  return Accordion(
    title: "Others and Unspecified Residences",
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Specification/Remarks"),
            Row(
              children: const [
                SizedBox(
                  width: 80,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Accordion generateOccupancy() {
  return Accordion(
    title: "Occupancy Rate and Length of Stay",
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("No. of Occupied Rooms"),
            Row(
              children: const [
                SizedBox(
                  width: 100,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: customPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("No. of Available Rooms"),
            Row(
              children: const [
                SizedBox(
                  width: 100,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: customPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Guest Night"),
            Row(
              children: const [
                SizedBox(
                  width: 100,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: customPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Female"),
            Row(
              children: const [
                SizedBox(
                  width: 100,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: customPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Male"),
            Row(
              children: const [
                SizedBox(
                  width: 100,
                  child: TextField(
                    //controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Count',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: customPadding / 2),
        const SizedBox(
          width: double.infinity,
          child: TextField(
            //controller: nameController,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Summary"
            ),
          ),
        ),

      ],
    ),
  );
}