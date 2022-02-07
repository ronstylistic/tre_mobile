import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:get/get.dart';
import 'package:tre_app/controller/login_controller.dart';

class Login extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.webp"),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Positioned(
            top: Get.height * .15,
            left: 0,
            right: 0,
            child:Image.asset("assets/images/gensan.png")
          ),
          Positioned(
            right: 20,
            left: 20,
            top: Get.height * .30,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(customPadding / 4),
              ),
              child: loginForm(),
            )
          ),
        ],
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(customPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                'Login',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold)
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: loginController.email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: loginController.password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is Required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
                height: 20
            ),SizedBox(
              height: 50,
              width: Get.width,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: customPadding / 2),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: customTextColor
                  ),
                  child: const Text('Login'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginController.loginUser();
                    }
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                //forgot password screen
              },
              child: const Text('Forgot Password',
                  style: TextStyle(color: customTextDarkColor)
              ),
            ),
          ],
        ),
      ),
    );
  }
}