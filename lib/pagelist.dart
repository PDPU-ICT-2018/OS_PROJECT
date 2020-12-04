 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:os_project/pages.dart';
import 'package:os_project/ui pages/infopage.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  List<Widget> _pageTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    addPages();
  }

  void addPages() {
    List<Pages> _pages = [
      Pages(title: 'FIFO PRA', info: 'As the name suggests, this algorithm works on the principle of "First in First out".It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue.'),
      Pages(title: 'LIFO PRA', info: 'As the name suggests, this algorithm works on the principle of "Last in First out". It replaces the newest page that arrived at last in the main memory. It is implemented by keeping track of all the pages in a stack.'),
      Pages(title: 'LRU PRA', info: 'As the name suggests, this algorithm works on the principle of "Least Recently Used". It replaces the page that has not been referred by the CPU for the longest time.'),
      Pages(title: 'OPTIMAL PRA', info: 'This algorithm replaces the page that will not be referred by the CPU in future for the longest time. It is practically impossible to implement this algorithm. This is because the pages that will not be used in future for the longest time can not be predicted. However, it is the best known algorithm and gives the least number of page faults. Hence, it is used as a performance measure criterion for other algorithms.'),
      Pages(title: 'RANDOM PRA', info: 'As the name suggests, this algorithm randomly replaces any page. So, this algorithm may behave like any other algorithm like FIFO, LIFO, LRU, Optimal etc.'),
      Pages(title: 'AUTO SELECT PRA', info: 'This Function Automatically Chooses a page replacement algorithm which gives best output for given set of inputs')
    ];

    _pages.forEach((Pages page) {
      _pageTiles.add(_buildTile(page));
    });
  }

  Widget _buildTile(Pages page) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Info(pages: page)));
      },
      contentPadding: EdgeInsets.all(10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(page.title, style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal)),
            ),
          ),
        ],
      ),
      // leading: ClipRRect(
      //   borderRadius: BorderRadius.circular(8.0),
      //   child: Image.asset('images/${page.img}', height: 50.0, width: 50.0,),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _pageTiles.length,
        itemBuilder: (context, index) {
          return _pageTiles[index];
        }
    );
  }
}