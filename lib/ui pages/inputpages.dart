import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_project/ui pages/infopage.dart';
import 'package:os_project/algorithms/fifo.dart';
import 'package:os_project/algorithms/lifo.dart';
import 'package:os_project/algorithms/lru.dart';
import 'package:os_project/algorithms/optimal.dart';
import 'package:os_project/algorithms/random.dart';

final pagesEntryTextBox = TextEditingController();
final pageCapacityTextBox = TextEditingController();
int frame_capacity = 0;
List<int> pages_arr = new List();

class GetTextFieldValue extends StatefulWidget {
  _GetTextFieldValueState createState() => _GetTextFieldValueState();
}

class _GetTextFieldValueState extends State<GetTextFieldValue> {
  int a;
  int b;
  int c;
  int d;
  int e;
  void getCapacity() {
    setState(() {
      frame_capacity = int.parse(pageCapacityTextBox.text);
    });
  }

  void getTextInputData() {
    setState(() {
      pages_arr.add(int.parse(pagesEntryTextBox.text));
      pagesEntryTextBox.text = '';
    });
  }

  void clear_all() {
    setState(() {
      pagesEntryTextBox.text = '';
      pageCapacityTextBox.text = '';
      pages_arr.clear();
      if (signal == 1) {
        toprint1.clear();
        hit1 = 0;
        fault1 = 0;
        fault1_arr.clear();
        hit1_arr.clear();
      }
      if (signal == 2) {
        toprint2.clear();
        hit2 = 0;
        fault2 = 0;
        fault2_arr.clear();
        hit2_arr.clear();
      }
      if (signal == 3) {
        toprint3.clear();
        hit3 = 0;
        fault3 = 0;
        fault3_arr.clear();
        hit3_arr.clear();
      }
      if (signal == 4) {
        toprint4.clear();
        hit4 = 0;
        fault4 = 0;
        fault4_arr.clear();
        hit4_arr.clear();
      }
      if (signal == 5) {
        toprint5.clear();
        hit5 = 0;
        fault5 = 0;
        fault5_arr.clear();
        hit5_arr.clear();
      }
      if(signal == 6){
        toprint1.clear();
        hit1 = 0;
        fault1 = 0;
        fault1_arr.clear();
        hit1_arr.clear();
        toprint2.clear();
        hit2 = 0;
        fault2 = 0;
        fault2_arr.clear();
        hit2_arr.clear();
        toprint3.clear();
        hit3 = 0;
        fault3 = 0;
        fault3_arr.clear();
        hit3_arr.clear();
        toprint4.clear();
        hit4 = 0;
        fault4 = 0;
        fault4_arr.clear();
        hit4_arr.clear();
        toprint5.clear();
        hit5 = 0;
        fault5 = 0;
        fault5_arr.clear();
        hit5_arr.clear();
      }
      frame_capacity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('INPUT', style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 190,
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: pageCapacityTextBox,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'Enter the frame size'),
                    )
                  ),
                  RaisedButton(
                    onPressed: getCapacity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.orange)),
                    color: Colors.orange,
                    //textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.transit_enterexit,
                          color: Colors.white,
                        ),
                        Text('Enter', style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal))),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 58),
                  child: Text("Frame capacity = $frame_capacity", style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal)))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 190,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: pagesEntryTextBox,
                        autocorrect: true,
                        decoration:
                        InputDecoration(hintText: 'Enter pages one by one'),
                      )),
                  RaisedButton(
                    onPressed: getTextInputData,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.orange)),

                    color: Colors.orange,
                    //textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.transit_enterexit,
                          color: Colors.white,
                        ),
                        Text('Enter', style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal))),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 60),
                  child: Text("Entered pages are = $pages_arr", style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal)))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: clear_all,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.orange)),

                    color: Colors.orange,
                    //textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.clear_all,
                          color: Colors.white,
                        ),
                        Text(
                          'Clear All', style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal)
                        ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(50),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (pages_arr.length != 0) {
                        if (signal == 1) {
                          fifoalgo(pages_arr, pages_arr.length, frame_capacity);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FIFO()),);
                        }
                        if (signal == 2) {
                          lifoalgo(pages_arr, pages_arr.length, frame_capacity);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LIFO()),
                          );
                        }
                        if (signal == 3) {
                          lrualgo(pages_arr, pages_arr.length, frame_capacity);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LRU()),);
                        }
                        if (signal == 4) {
                          optimalalgo(
                              pages_arr, pages_arr.length, frame_capacity);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OPTIMAL()),);
                        }
                        if (signal == 5) {
                          randomalgo(pages_arr, pages_arr.length, frame_capacity);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RANDOM()),);
                        }
                        if (signal == 6){
                          a = fifoalgo(pages_arr, pages_arr.length, frame_capacity);
                          b = lifoalgo(pages_arr, pages_arr.length, frame_capacity);
                          c = lrualgo(pages_arr, pages_arr.length, frame_capacity);
                          d = randomalgo(pages_arr, pages_arr.length, frame_capacity);
                          var minvalue = [a,b,c,d];
                          minvalue.sort();
                          print(minvalue);
                          if(a == minvalue.first){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FIFO()),);
                          }
                          else if(b == minvalue.first){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LIFO()),);
                          }
                          else if(c == minvalue.first){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LRU()),);
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RANDOM()),);
                          }
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.orange)),

                    color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        Text(
                          'Calculate', style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
