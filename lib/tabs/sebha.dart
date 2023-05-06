import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index = 0;
  int counter = 0;
  double angel =0;
  List<String> calls = [
    "sob7an allah",
    "al7m llah",
    "allah akbr",
    "la elah ela allah"
  ];

  void checker() {
    if (counter > 33) {
      counter = 1;
      index++;
    }
    if (index == calls.length) {
      index = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_bg.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Image.asset("assets/images/Group 8.png",),
              Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * .145,
                      ),
                      child: Image.asset(
                        "assets/images/head of seb7a.png",
                      )),

                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .11
                  ),
                      child: Transform.rotate(
                          angle: angel,
                          child: Image.asset("assets/images/body of seb7a.png",))),
                ],
              ),

              SizedBox(
                height: 50,
              ),
              Text("tasbe7aat number"),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0x88B7935F),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    "$counter",
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    counter++;
                    checker();
                    angel+=75/360;
                    setState(() {});
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFB7935F),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Text(
                        calls[index],
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
