import 'package:flutter/material.dart';
import 'package:tourspotter/pages/detail_screen_page.dart';
import 'package:tourspotter/model/tourism_place_model.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreenPage(place: place);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(place.imageAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ), 
      // ListView.builder(
      //   itemBuilder: (context, index) {
      //     final TourismPlace place = tourismPlaceList[index];
      //     return InkWell(
      //       onTap: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           return const DetailScreenPage();
      //         }));
      //       },
      //       child: Card(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Expanded(
      //               flex: 1,
      //               child: Image.network(
      //                   'https://grahanurdian.com/pic/2022/03/farmhouse-susu-lembang.webp'),
      //             ),
      //             const Expanded(
      //               flex: 2,
      //               child: Padding(
      //                 padding: EdgeInsets.all(8.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: <Widget>[
      //                     Text(
      //                       'Farm House Lembang',
      //                       style: TextStyle(fontSize: 16.0),
      //                     ),
      //                     SizedBox(
      //                       height: 10,
      //                     ),
      //                     Text('Lembang'),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
