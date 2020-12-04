import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_project/algorithms/random.dart';
import 'package:os_project/ui pages/inputpages.dart';
import 'package:os_project/ui pages/graph.dart';
import 'package:os_project/ui%20pages/comparisions.dart';
import 'package:os_project/ui%20pages/homepage.dart';
import 'lifo.dart';
import 'lru.dart';
import 'optimal.dart';

int hit1 = 0;
int fault1 = 0;
List <List> toprint1 = new List();
List <int> fault1_arr = new List();
List <int> hit1_arr = new List();


int fifoalgo(List<int> pages, int n, int capacity) {
  int frameSize = capacity;
  int position = -1;
  List <int> frame =  new List(frameSize);
  int i = 0;
  int fault=0;

  for(i=0;i<n;i++)
  {
    List <int> s1 = new List();
    if(!(frame.contains(pages[i])))
    {
      position++;
      if(position>(frameSize-1))
        position=0;
      frame[position] = pages[i];
      s1.addAll(frame);
      toprint1.add(s1);
      fault1++;
      fault++;
      fault1_arr.add(fault1);
      if(i==0) {
        hit1_arr.add(0);
      }
      else {
        hit1_arr.add(hit1_arr.elementAt(hit1_arr.length-1));
      }
    }
    else if(frame.contains(pages[i]))
    {
      s1.addAll(frame);
      toprint1.add(s1);
      hit1++;
      hit1_arr.add(hit1);
      fault1_arr.add(fault1_arr.elementAt(fault1_arr.length-1));
    }
  }
  return fault;
}


class FIFO extends StatefulWidget {
  @override
  _FIFOState createState() => _FIFOState();
}

class _FIFOState extends State<FIFO> {

  int click = 0;
  int pclick = 1;
  final int length = toprint1.length;

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
              Text(toprint1.elementAt(click).elementAt(i).toString(), style: GoogleFonts.roboto(fontSize: 20.0,color: Colors.red), textAlign: TextAlign.center,),
            ]
          )
        );
      else if(toprint1.elementAt(click-1).contains(toprint1.elementAt(click).elementAt(i)))
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint1.elementAt(click).elementAt(i).toString(), style: GoogleFonts.roboto(fontSize: 20.0,color: Colors.green), textAlign: TextAlign.center,),
            ]
          )
        );
      else{
        rows.add(
          TableRow(
            children: <Widget> [
              Text(toprint1.elementAt(click).elementAt(i).toString(), style: GoogleFonts.roboto(fontSize: 25.0,color: Colors.red), textAlign: TextAlign.center,),
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
      onPressed: () {
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


    Widget graphButton = FlatButton(
      child: Text("BEALDY'S ANOMALY"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> GraphPage()),);
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
        graphButton,
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
        title: Text('FIFO ALGORITHM', style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal))),
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
                  child : Text(hit1_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 23.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2, 8),
                  child : Text('Page Fault : ', style: GoogleFonts.montserrat(fontSize: 23.0,color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 8, 8),
                  child : Text(fault1_arr.elementAt(click).toString(), style: GoogleFonts.montserrat(fontSize: 23.0,color: Colors.red)),
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
                  child : Text((hit1_arr.elementAt(click)/hit1_arr.length).toStringAsFixed(2), style: GoogleFonts.montserrat(fontSize: 18.0,color: Colors.green)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2, 8),
                  child : Text('Fault Ratio : ', style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 20, 8, 8),
                  child : Text((fault1_arr.elementAt(click)/hit1_arr.length).toStringAsFixed(2), style: GoogleFonts.montserrat(fontSize: 18.0,color: Colors.red)),
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
                      if(toprint1.length > click+1) {
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

