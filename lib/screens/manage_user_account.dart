import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/controller/user_controller.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:tre_app/models/user.dart';
import 'package:tre_app/screens/add_user.dart';
import 'package:get/get.dart';

class ManageUserAccount extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  ManageUserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar("User Account"),
      body: SafeArea(
        child: Obx(() {
          if(userController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userController.users.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = userController.users[index];
                  return Dismissible(
                      key: Key(item.id.toString()),
                      onDismissed: (direction) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('$item dismissed')));
                      },
                      child: makeCard(item)
                  );
                },
              ),
            );
          }
        })
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

  Card makeCard(UserModel user){
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: makeListTile(user),
      ),
    );
  }

  ListTile makeListTile(UserModel user){
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
        title: Text("${user.firstname} ${user.lastname}",
          style: const TextStyle(color: customTextLightColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Text(user.email ?? "",
                style: const TextStyle(color: customTextLightColor)
            ),
          ],
        ),
        trailing:
          const Icon(Icons.keyboard_arrow_right, color: customTextLightColor, size: 30.0)
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddUser(),
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
