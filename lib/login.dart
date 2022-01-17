import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:get/get.dart';
import 'package:tre_app/controller/login_controller.dart';
import 'package:tre_app/home_screen.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var loginController = Get.put(LoginController());

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
            child: null,
          ),
          SafeArea(
            child: Container (
              alignment: Alignment.center,
              padding: const EdgeInsets.all(customPadding),
              child: SizedBox(
                  height: 600,
                  width: width,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(customPadding),
                      child: Image.asset("assets/images/gensan.png")
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(customPadding / 4),
                      ),
                      child: Form(
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
                                    if (value == null || value.isEmpty) {
                                      return 'Email is Required';
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
                              ),
                              SizedBox(
                                height: 50,
                                width: width,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: customPadding / 2),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: customTextColor
                                    ),
                                    child: const Text('Login'),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Get.off(() => const HomeScreen());
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
                      )
                    ),
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

/*
children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.webp"),
                  fit: BoxFit.cover
              ),
            ),
            child: null,
          ),
          Padding(
            padding: EdgeInsets.all(customPadding),
            child: ListView(
              children: <Widget> [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: const Text('TutorialKart',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(customPadding / 4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(customPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const TextField(
                            //controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: const TextField(
                            obscureText: true,
                            //controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 20
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              //print(nameController.text);
                              //print(passwordController.text);
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            //forgot password screen
                          },
                          child: const Text('Forgot Password'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
* */

