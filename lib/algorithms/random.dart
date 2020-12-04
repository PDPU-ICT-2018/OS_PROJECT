import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_project/algorithms/optimal.dart';
import 'package:os_project/ui pages/homepage.dart';
import 'package:os_project/ui pages/inputpages.dart';
import 'package:os_project/ui%20pages/comparisions.dart';
import 'package:os_project/ui%20pages/optibealdys.dart';

import 'fifo.dart';
import 'lifo.dart';
import 'lru.dart';

int hit5 = 0;
int fault5 = 0;
List <List> toprint5 = new List();
List <int> fault5_arr = new List();
List <int> hit5_arr = new List();

int randomalgo(List <int> pages, int n, int capacity) {
  int fault4=0;
  List<int> s = new List();
  int fault5 = 0;
  int hit5 = 0;
  var j = new Random();
  for (int i = 0; i < n; i++) {
    List<int> s1 = new List();
    int n = j.nextInt(capacity);
    if (s.length < capacity) {
      if (!s.contains(pages[i])) {
        print(s);
        s.add(pages[i]);
        s1.addAll(s);
        for (int j = 0; j < capacity - s.length; j++) {
          s1.add(null);
        }
        toprint5.add(s1);
        fault5++;
        fault4++;
        fault5_arr.add(fault5);
        if(i==0) {
          hit5_arr.add(0);
        }
        else {
          hit5_arr.add(hit5_arr.elementAt(hit5_arr.length-1));
        }
      }
    }
    else {
      if (s.contains(pages[i])) {
        s1.addAll(s);
        for (int j = 0; j < capacity - s.length; j++) {
          s1.add(null);
        }
        toprint5.add(s1);
        hit5++;
        hit5_arr.add(hit5);
        fault5_arr.add(fault5_arr.elementAt(fault5_arr.length-1));
      }
      else {
        s.removeAt(n);
        s.insert(n, pages[i]);
        s1.addAll(s);
        for (int j = 0; j < capacity - s.length; j++) {
          s1.add(null);
        }
        toprint5.add(s1);
        fault5++;
        fault4++;
        fault5_arr.add(fault5);
        hit5_arr.add(hit5_arr.elementAt(hit5_arr.length-1));
      }
    }
  }
  return fault4;
}


class RANDOM extends StatefulWidget {
  @override
  _RANDOMState createState() => _RANDOMState();
}

class _RANDOMState extends State<RANDOM> {

  int click = 0;
  int pclick = 1;
  final int length = toprint5.length;

  Widget createTable() {
    List<TableRow> rows = [];
    rows.add(
      TableRow(
        children: <Widget> [
          Text("Pages",style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.orange), textAlign: TextAlign.center,),
        ]
      )
    );
    for (int i = 0; i < frame_capacity; i++) {
      if(click == 0)
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint5.elementAt(click).elementAt(i).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.red), textAlign: TextAlign.center,),
            ]
          )
        );
      else if(toprint5.elementAt(click-1).contains(toprint5.elementAt(click).elementAt(i)))
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint5.elementAt(click).elementAt(i).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.green), textAlign: TextAlign.center,),
            ]
          )
        );
      else{
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint5.elementAt(click).elementAt(i).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.red), textAlign: TextAlign.center,),
            ]
          )
        );
      }
    }
    return Table(children: rows);
  }


  showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("EXIT"),
      onPressed:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()),);
        frame_capacity = 0;
        pagesEntryTextBox.text = '';
        pageCapacityTextBox.text = '';
        pages_arr.clear();
        toprint1.clear();
        toprint2.clear();
        toprint3.clear();
        toprint4.clear();
        toprint5.clear();
        hit1 = 0;
        fault1 = 0;
        fault1_arr.clear();
        hit1_arr.clear();
        hit2 = 0;
        fault2 = 0;
        fault2_arr.clear();
        hit2_arr.clear();
        hit3 = 0;
        fault3 = 0;
        fault3_arr.clear();
        hit3_arr.clear();
        hit4 = 0;
        fault4 = 0;
        fault4_arr.clear();
        hit4_arr.clear();
        hit5 = 0;
        fault5 = 0;
        fault5_arr.clear();
        hit5_arr.clear();
      },
    );

    Widget continueButton = FlatButton(
      child: Text("BEALDY'S ANOMALY"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> GraphPage3()),);
      },
    );
    Widget Button1 = FlatButton(
      child: Text("COMAPRE WITH OTHERS"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> GraphPage5()),);
      },
    );

    AlertDialog alert = new AlertDialog(
      title: Text("PROCESS COMPLETED"),
      content: Text("YOU HAVE REACHED END OF THE ALGORITHM WHAT WOULD YOU LIKE TO DO?"),
      actions: [
        cancelButton,
        continueButton,
        Button1,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('RANDOM ALGORITHM', style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                child : Text('Click on arrows to see sets', style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.orange))
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
                child : Text('Current Element Is: '+ pages_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.yellow))
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 50),
                child : Text('Set: $pclick / $length', style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.orange))
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 40),
              child : createTable(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 2, 8),
                  child : Text('Page Hit : ', style: GoogleFonts.montserrat(fontSize: 23.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 60, 8),
                  child : Text(hit5_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2, 8),
                  child : Text('Page Fault : ', style: GoogleFonts.montserrat(fontSize: 23.0,color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 8, 8),
                  child : Text(fault5_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.red)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 2, 8),
                  child : Text('Hit Ratio : ', style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 40, 8),
                  child : Text((hit5_arr.elementAt(click)/hit5_arr.length).toStringAsFixed(2), style: GoogleFonts.montserrat(fontSize: 18.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2, 8),
                  child : Text('Fault Ratio : ', style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 8, 8),
                  child : Text((fault5_arr.elementAt(click)/hit5_arr.length).toStringAsFixed(2), style: GoogleFonts.montserrat(fontSize: 18.0,color: Colors.red)),
                ),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      if(click > 0) {
                        click--;
                        pclick--;
                      }
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      if(toprint5.length > click+1) {
                        click++;
                        pclick++;
                      }
                      else {
                        showAlertDialog(context);
                      }
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}