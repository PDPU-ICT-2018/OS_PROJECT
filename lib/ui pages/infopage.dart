import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_project/ui pages/inputpages.dart';
import 'package:os_project/pages.dart';

int signal = 0;

class Info extends StatelessWidget {
  final Pages pages;

  Info({@required this.pages});

  void check() {
    if (pages.title == 'FIFO PRA') {
      signal = 1;
    }
    if (pages.title == 'LIFO PRA') {
      signal = 2;
    }
    if (pages.title == 'LRU PRA') {
      signal = 3;
    }
    if (pages.title == 'OPTIMAL PRA') {
      signal = 4;
    }
    if (pages.title == 'RANDOM PRA') {
      signal = 5;
    }
    if (pages.title == 'AUTO SELECT PRA') {
      signal = 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(pages.title,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal))),
        ),
        //extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // ClipRRect(
              //     child: Image.asset(
              //       'images/${pages.img}',
              //       height: 200,
              //       fit: BoxFit.fill,
              //       alignment: Alignment.topCenter,
              //     )
              // ),
              // SizedBox(height: 30),
              // // ListTile(
              // //     title: Text(pages.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.grey[800])),
              // // ),
              Center(
                child: Text(
                  'Theory',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 250,
                  child: Text(
                    pages.info,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            check();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetTextFieldValue()),
            );
          },
          backgroundColor: Colors.orange,
          label: Text('Go to Input'),
          icon: Icon(Icons.input),
        ));
  }
}
