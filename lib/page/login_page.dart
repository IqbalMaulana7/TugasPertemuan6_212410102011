import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.username, required this.password});
  final username;
  final password;
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
                padding: EdgeInsets.fromLTRB(59, 99, 49, 96),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 34),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xfffffffff),
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset('assets/images/pngegg.png'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        // fatguymwh (1:4)
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 34),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _username,
                                  decoration: InputDecoration(
                                    labelText: "Input Your Username",
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
                                      return 'Please Input Your Password !!!';
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                ),
                                TextFormField(
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
                                      return 'Please Input Your Username !!!';
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                    height: 37,
                                    width: 120,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (_username.text.toString() !=
                                                    username[0].toString() ||
                                                _password.text.toString() !=
                                                    password[0].toString()) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        'Username Or Password Is Wrong')),
                                              );
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                          username: username),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                        ),
                                        child: const Text("Login")))
                              ],
                            ))),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(60, 0, 3, 0),
                            child: Text('Don’t have account ?',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xffffffffff),
                                ),
                                textAlign: TextAlign.center),
                          ),
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 255, 0, 0),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
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
