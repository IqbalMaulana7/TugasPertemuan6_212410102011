import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username});
  final username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  double yourHeight = 0;
  double yourWeight = 0;
  String condition = "";
  int Result = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 0, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome Back, ' + username[0],
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              child: Text(
                'Your BMI :',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              height: size.height * 0.30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$Result",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 242, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$condition",
                        style: TextStyle(
                            color: Color.fromARGB(255, 229, 255, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "Your Height : ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$yourHeight Cm",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: yourHeight,
                    max: 250,
                    min: 0,
                    onChanged: (height) {
                      setState(() {
                        yourHeight = height;
                      });
                    },
                    divisions: 250,
                    label: "$yourHeight",
                    activeColor: Color.fromARGB(255, 229, 255, 0),
                    inactiveColor: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Your Weight : ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${yourWeight.toStringAsFixed(1)} Kg",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: yourWeight,
                    max: 200,
                    min: 0,
                    onChanged: (weight) {
                      setState(() {
                        yourWeight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$yourWeight",
                    activeColor: Color.fromARGB(255, 229, 255, 0),
                    inactiveColor: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    color: Color.fromARGB(255, 229, 255, 0),
                    width: 120,
                    height: 37,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            Result = (yourWeight /
                                    ((yourHeight / 100) * (yourHeight / 100)))
                                .round()
                                .toInt();
                            if (Result >= 18.5 && Result <= 25) {
                              condition = "You Are Healthy !!!";
                            } else if (Result > 25 && Result <= 30) {
                              condition = "You Are Overweight !!!";
                            } else if (Result > 30) {
                              condition = "Obesitas";
                            } else {
                              condition = "You Are Underweight !!!";
                            }
                          });
                        },
                        child: Text(
                          "Cek BMI",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 255, 0, 0),
                            decorationColor: Color(0xff000000),
                          ),
                        )),
                  ),

                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
