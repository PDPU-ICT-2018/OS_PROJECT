import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:os_project/algorithms/fifo.dart';
import 'package:os_project/algorithms/lifo.dart';
import 'package:os_project/algorithms/lru.dart';
import 'package:os_project/algorithms/optimal.dart';
import 'package:os_project/algorithms/random.dart';
import 'package:os_project/ui pages/inputpages.dart';

class GraphPage5 extends StatefulWidget {
  final Widget child;

  GraphPage5({Key key, this.child}) : super(key: key);

  _graphpageState createState() => _graphpageState();
}

class _graphpageState extends State<GraphPage5> {
  List <charts.Series<Belady1, String>> _seriesData;

  generatedata() {

    var CompData1 = [
      new Belady1('FIFO', fifoalgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1('LIFO', lifoalgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1('LRU', lrualgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1('OPTIMAL', optimalalgo(pages_arr, pages_arr.length, frame_capacity)),
      new Belady1('RANDOM', randomalgo(pages_arr, pages_arr.length, frame_capacity)),
    ];

    _seriesData.add(
      charts.Series(
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Belady1 B, _) => charts.ColorUtil.fromDartColor(Colors.green),
        id: 'BELADYS ANOMALY',
        data:  CompData1,
        domainFn: (Belady1 B, _) => B.capacity,
        measureFn: (Belady1 B, _) => B.fault,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List <charts.Series<Belady1, String>>();
    generatedata();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.book)),
                Tab(icon: Icon(FontAwesomeIcons.chartBar)),
              ],
            ),
            title: Text('GRAPHICAL REPRESENTATION', textAlign: TextAlign.center,),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text('Comparitive Study Of Algortihms', style: GoogleFonts.montserrat(fontSize: 25.0, color: Colors.orange))
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("FAULTS FOR ALL ALGORITHMS",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Belady1{
  String capacity;
  int fault;
  Belady1(this.capacity, this.fault);
}