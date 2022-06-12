import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String grade = "";

  String calculate(int grade) {
    if (grade >= 90) {
      return "A";
    } else if (grade >= 80) {
      return "B";
    }
    if (grade >= 70) {
      return "C";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    var inputController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    // percentage text
                    Text(
                      "  %",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    // text field
                    Container(
                        width: 300,
                        child: TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                              hintText: "                Type your score",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 202, 122, 216),
                                    width: 5,
                                  ))),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        grade = calculate(int.parse(inputController.text));
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Calculate",
                          style: TextStyle(fontSize: 20),
                        )),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.pinkAccent),
                  )),
              Text(
                grade,
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
            ]),
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Grade Calculator",
          style: TextStyle(fontSize: 25),
        )),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
