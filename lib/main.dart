import 'package:flutter/material.dart';
import 'dart:math';

//using the math library for my love calculator logic.
void main() {
  runApp(const Lovecal());
}

class Lovecal extends StatefulWidget {
  const Lovecal({Key? key}) : super(key: key);

  @override
  State<Lovecal> createState() => _LovecalState();
}

final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _LovecalState extends State<Lovecal> {
  /*using the text editing controller so i have a direct control over
  the user input and can affect their outcome
  */
  TextEditingController hername = TextEditingController();
  TextEditingController hisname = TextEditingController();

  String hisnametext = "";
  String hernametext = "";

  String message1 = "She's your starlight";
  String message2 = "A wonderful love story";
  String message3 = "LOL...you think you deserve love";
  String message4 = "You are a programmer bro, you are married to your code";

  int lovepercentage = 0;
// the validation function
/* i sorta piggy backed on the function and took the chance to
input my love percentage logic
*/
  void validation() {
    final FormState? form = formkey.currentState;
    if (form!.validate()) {
      //this is the current string the user is editing or inputing, The .text getter helps with that
      hisnametext = hisname.text;
      hernametext = hername.text;

      /* and below is the core of my love percentage calculator, You can see
      i experimented using different names
      */

      if (hisnametext.isNotEmpty && hernametext.isNotEmpty) {
        setState(() {
          lovepercentage = Random().nextInt(50) + 30;
        });
      }
      if (hisnametext.isEmpty && hernametext.isEmpty) {
        return;
      } else if (hisnametext.contains('Yanmife') &&
          hernametext.contains('Chioma')) {
        setState(() {
          lovepercentage = Random().nextInt(1) + 100;
        });
      } else if (hisnametext.contains('Cloak') ||
          hisnametext.contains("Michael") ||
          hisnametext.contains("Olumide")) {
        setState(() {
          lovepercentage = Random().nextInt(5) + 2;
        });
      } else if (hisnametext.contains('Xypher') ||
          hisnametext.contains('Samuel') ||
          hisnametext.contains('Tope') ||
          hisnametext.contains('Temitope')) {
        setState(() {
          lovepercentage = Random().nextInt(5) + 10;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/cookie.jpg',
                height: double.infinity,
                fit: BoxFit.fitHeight,
              ),
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: hisname,
                        validator: (value) {
                          if (value == "") {
                            return "His name needed";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'His Name',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Pacifico",
                            letterSpacing: 2.5,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: hername,
                        validator: (value) {
                          if (value == "") {
                            return "Her name needed";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Her Name',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Pacifico",
                            letterSpacing: 2.5,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          validation();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                          "MATCH",
                          style: TextStyle(
                            fontFamily: 'TiroBangla',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Your Love Rating is ",
                          style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          " $lovepercentage percent",
                          style: const TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 25,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (lovepercentage == 100)
                          Text(
                            message1,
                            style: const TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 25,
                              color: Colors.pink,
                            ),
                          ),
                        if (lovepercentage > 50 && lovepercentage < 99)
                          Text(
                            message2,
                            style: const TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 25,
                              color: Colors.pink,
                            ),
                          ),
                        if (lovepercentage > 1 && lovepercentage < 10)
                          Text(
                            message3,
                            style: const TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 25,
                              color: Colors.pink,
                            ),
                          ),
                        if (lovepercentage >= 10 && lovepercentage < 15)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            // color: Colors.green,
                            child: Text(
                              message4,
                              style: const TextStyle(
                                fontFamily: "Pacifico",
                                fontSize: 25,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
