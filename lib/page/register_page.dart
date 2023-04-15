import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

List username = [];
List password = [];

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  RegisterPage createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 0, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(10.67, 16.17, 10.67, 206),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 0, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 312.71, 115.15),
                      width: 25.96,
                      height: 24.68,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 20),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Image.asset('assets/images/register.png',
                          width: 250, height: 250, fit: BoxFit.fill),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 4, 20),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    width: 350,
                                    child: TextFormField(
                                      controller: _username,
                                      decoration: InputDecoration(
                                        labelText: "Input Your Username",
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255)
                                                .withOpacity(1),
                                        filled: true,
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Field The Username !!!';
                                        }
                                        return null;
                                      },
                                    )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                ),
                                SizedBox(
                                    width: 350,
                                    child: TextFormField(
                                      controller: _password,
                                      decoration: InputDecoration(
                                        labelText: "Input Your Password",
                                        fillColor: Colors.white.withOpacity(1),
                                        filled: true,
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Field The Password !!!';
                                        }
                                        return null;
                                      },
                                    )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            username.add(_username.text);
                                            password.add(_password.text);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginPage(
                                                  username: username,
                                                  password: password,
                                                ),
                                              ),
                                            );
                                            Navigator.of(context)
                                                .pushNamed("/login");
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 1, 33, 41),
                                        ),
                                        child: const Text("Register")))
                              ],
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
