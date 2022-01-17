import 'package:flutter/material.dart';
import '../constant.dart';

Widget bottomSheet(){
  TextEditingController _country = TextEditingController();
  TextEditingController _male = TextEditingController();
  TextEditingController _female = TextEditingController();


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