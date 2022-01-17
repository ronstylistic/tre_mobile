import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:tre_app/custom/row_item.dart';
import 'package:tre_app/models/tre.dart';
import 'package:tre_app/screens/add_tre.dart';

class ManageTre extends StatelessWidget {
  final String title;
  const ManageTre({
    Key? key,
    required this.title
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title),
      body: SafeArea(
        child: tres.isNotEmpty ?
        ListView.builder(
          shrinkWrap: true,
          itemCount: tres.length,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(tres[index]);
          },
        ) : const Center(
            child: Text("No TRE's",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).push(_createRoute());
        },
        backgroundColor: customTextColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AddTre(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Card makeCard(Tre tre){
  return Card(
    elevation: 0,
    margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
    child: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: makeListTile(tre),
    ),
  );
}

ListTile makeListTile(Tre tre){
  return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24))),
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
      ),
      title: Text(tre.businessName,
        style: const TextStyle(color: customTextLightColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: <Widget>[
          rowItem(tre.contactPerson, Icons.person),
          rowItem(tre.contactNumber, Icons.phone),
          rowItem(tre.email, Icons.email),
          rowItem(tre.website, Icons.web),
        ],
      ),
      trailing:
      const Icon(Icons.keyboard_arrow_right, color: customTextLightColor, size: 30.0)
  );
}
