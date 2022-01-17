import 'package:flutter/material.dart';
import 'package:tre_app/controller/daytime_tourists_controller.dart';
import 'package:tre_app/custom/accordion.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import '../../constant.dart';

class DaytimeTourists extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final DaytimeTouristController daytimeTouristController = Get.put(DaytimeTouristController());

  DaytimeTourists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Daytime Tourist"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      daytimeTouristController.daytimeTouristModel.month = newValue;
                    },
                  ),
                ),
                generatePhilippineResidents(),
                generateForeignResidents(context),
                generateAge(),
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
                          //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saving Data'))),
                          daytimeTouristController.submitData()
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
              const Text("This Province"),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.provinceMale,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Male',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.provinceFemale,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Female',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
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
              const Text("Other Provinces"),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.otherProvinceMale,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Male',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: customPadding / 2),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.otherProvinceFemale,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Female',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
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

  Accordion generateForeignResidents(BuildContext context) {
    return Accordion(
      title: "Foreign Country Residences",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() =>
          daytimeTouristController.residences!.isNotEmpty ?
          ListView.builder(
              shrinkWrap: true,
              itemCount: daytimeTouristController.residences!.length,
              itemBuilder: (BuildContext context, int index){
                final item = daytimeTouristController.residences![index];
                //return makeCard(item);
                return Dismissible(
                  key: Key(item.id.toString()),
                  onDismissed: (direction) {
                    // Then show a snackbar.
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$item dismissed')));
                  },
                  child: Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
                    child: Container(
                      padding: const EdgeInsets.all(customPadding / 2),
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(item.country)
                          ),
                          const SizedBox(width: customPadding/ 2),
                          Row(
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Text(item.male.toString())
                              ),
                              const SizedBox(width: customPadding / 2),
                              SizedBox(
                                  width: 80,
                                  child: Text(item.female.toString())
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }) : const Center(child: Text("No Data"))
          ),
          const SizedBox(height: customPadding / 2),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: customTextColor,
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                onPressed: (() => {
                  showModalBottomSheet(
                      context: context, builder: (builder) => bottomSheet())
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text("Add")
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

  Accordion generateAge() {
    return Accordion(
      title: "Age",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("A. Below 18"),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.ageA,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Count',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: customPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("B. 18-39"),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.ageB,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Count',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: customPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("C. 40-64"),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.ageC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Count',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: customPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("D. 65 & Above"),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: daytimeTouristController.ageD,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Count',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(){
    TextEditingController _country = TextEditingController();
    TextEditingController _male = TextEditingController();
    TextEditingController _female = TextEditingController();

    void add(){
      daytimeTouristController.addResidence(_country.text, int.parse(_male.text), int.parse(_female.text));
      _country.clear();
      _male.clear();
      _female.clear();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: customPadding, vertical: customPadding),
      child: Column(
        children: [
          const Text("Add New",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: customPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _country,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Country',
                  ),
                ),
              ),
              const SizedBox(width: customPadding/ 2),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _male,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Male',
                      ),
                    ),
                  ),
                  const SizedBox(width: customPadding / 2),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _female,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: customTextColor,
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              onPressed: (() => {
                add()
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add),
                  Text("Add")
                ],
              )
          ),
        ],
      ),
    );
  }


}



