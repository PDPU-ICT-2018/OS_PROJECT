import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_project/algorithms/random.dart';
import 'package:os_project/ui pages/homepage.dart';
import 'package:os_project/ui pages/inputpages.dart';
import 'package:os_project/ui%20pages/comparisions.dart';
import 'package:os_project/ui%20pages/randombealdys.dart';

import 'fifo.dart';
import 'lifo.dart';
import 'lru.dart';

List<List> toprint4 = new List();
int hit4 = 0;
int fault4 = 0;
List <int> fault4_arr = new List();
List <int> hit4_arr = new List();

bool search(int key, List<int> fr) {
  for (int i = 0; i < fr.length; i++) {
    if (fr.elementAt(i) == key) return true;
  }
  return false;
}

int predict(List<int> pages, List<int> fr, int n, int index) {
  int res = -1, farthest = index;
  for (int i = 0; i < fr.length; i++) {
    int j;
    for (j = index; j < n; j++) {
      if (fr.elementAt(i) == pages.elementAt(j)) {
        if (j > farthest) {
          farthest = j;
          res = i;
        }
        break;
      }
    }
    if (j == n) return i;
  }
  return (res == -1) ? 0 : res;
}

int optimalalgo(List<int> pages, int n, int capacity) {
  int fault3=0;
  List <int> fr = new List();
  for (int i = 0; i < n; i++) {
    List <int> s1 = new List();
    if (search(pages.elementAt(i), fr)) {
      s1.addAll(fr);
      for (int j = 0; j < capacity - fr.length; j++) {
        s1.add(null);
      }
      toprint4.add(s1);
      hit4++;
      hit4_arr.add(hit4);
      fault4_arr.add(fault4_arr.elementAt(fault4_arr.length-1));
      continue;
    }
    if (fr.length < capacity) {
      fr.add(pages.elementAt(i));
      s1.addAll(fr);
      for (int j = 0; j < capacity - fr.length; j++) {
        s1.add(null);
      }
      fault4++;
      fault3++;
      fault4_arr.add(fault4);
      if(i==0) {
        hit4_arr.add(0);
      }
      else {
        hit4_arr.add(hit4_arr.elementAt(hit4_arr.length-1));
      }
      toprint4.add(s1);
    } else {
      int j = predict(pages, fr, n, i + 1);
      fr.removeAt(j);
      fr.insert(j, pages.elementAt(i));
      s1.addAll(fr);
      for (int j = 0; j < capacity - fr.length; j++) {
        s1.add(null);
      }
      toprint4.add(s1);
      fault4++;
      fault3++;
      fault4_arr.add(fault4);
      if(i==0) {
        hit4_arr.add(0);
      }
      else {
        hit4_arr.add(hit4_arr.elementAt(hit4_arr.length-1));
      }
    }
  }
  fault4 = n - hit4;
  return fault3;
}


class OPTIMAL extends StatefulWidget {
  @override
  _OPTIMALState createState() => _OPTIMALState();
}

class _OPTIMALState extends State<OPTIMAL> {

  int click = 0;
  int pclick = 1;
  final int length = toprint4.length;

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
              Text(toprint4.elementAt(click).elementAt(i).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.red), textAlign: TextAlign.center,),
            ]
          )
        );
      else if(toprint4.elementAt(click-1).contains(toprint4.elementAt(click).elementAt(i)))
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint4.elementAt(click).elementAt(i).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.green), textAlign: TextAlign.center,),
            ]
          )
        );
      else{
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint4.elementAt(click).elementAt(i).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.red), textAlign: TextAlign.center,),
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> GraphPage4()),);
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
        title: Text('OPTIMAL ALGORITHM', style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal))),
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
                  child : Text(hit4_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2, 8),
                  child : Text('Page Fault : ', style: GoogleFonts.montserrat(fontSize: 23.0,color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 8, 8),
                  child : Text(fault4_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 25.0,color: Colors.red)),
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
                  child : Text((hit4_arr.elementAt(click)/hit4_arr.length).toStringAsFixed(2), style: GoogleFonts.montserrat(fontSize: 18.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2, 8),
                  child : Text('Fault Ratio : ', style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 8, 8),
                  child : Text((fault4_arr.elementAt(click)/hit4_arr.length).toStringAsFixed(2), style: GoogleFonts.montserrat(fontSize: 18.0,color: Colors.red)),
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
                      if(toprint4.length > click+1) {
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