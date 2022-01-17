import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:tre_app/models/user.dart';
import 'package:tre_app/screens/add_user.dart';

class ManageUserAccount extends StatelessWidget {
  final String title;
  const ManageUserAccount({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(title),
      body: SafeArea(
        child: users.isNotEmpty ?
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = users[index];
                    //return makeCard(item);
                    return Dismissible(
                        key: Key(item.id.toString()),
                        onDismissed: (direction) {
                          // Then show a snackbar.
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('$item dismissed')));
                        },
                        child: makeCard(item)
                    );
                },
          ) : const Center(
              child: Text('No Users',
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

  Card makeCard(User user){
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: makeListTile(user),
      ),
    );
  }

  ListTile makeListTile(User user){
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
            Text(user.email,
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
    pageBuilder: (context, animation, secondaryAnimation) => const AddUser(),
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
