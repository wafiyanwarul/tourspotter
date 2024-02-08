import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/tourism_place_model.dart';

class DetailScreenPage extends StatelessWidget {
  final TourismPlace place;
  const DetailScreenPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Image of Place
                Image.asset(place.imageAsset),
                // Image.network(
                //     'https://grahanurdian.com/pic/2022/03/farmhouse-susu-lembang.webp'),

                // Title Text
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    place.name,
                    // 'Farm House Lembang',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // Detail Content 3 Icons
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Widget 1
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.calendar_today, size: 30),
                          Text(
                            // 'Access time',
                            place.openDays,
                            style: informationTextStyle,
                          )
                        ],
                      ),
                      // Widget 2
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(CupertinoIcons.clock, size: 30),
                          Text(
                            place.openTime,
                            style: informationTextStyle,
                          )
                        ],
                      ),
                      // Widget 3
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.monetization_on, size: 30),
                          Text(
                            place.ticketPrice,
                            style: informationTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // Detail Explain Place
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Text(
                    place.description,
                    textAlign: TextAlign.justify,
                    // 'Berada di jalur utama Bandung - Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk swafoto instagramale.',
                    // style: TextStyle(),
                  ),
                ),
                // More Photos Place
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: place.imageUrls.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url),
                        ),
                      );
                    }).toList(),
                  ),
                  // ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //     // Image 1
                  //     Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(20),
                  //         child: Image.network(
                  //           'https://www.hotelmurah.com/ceritawisata/wp-content/uploads/2019/01/rumah-hobbit.jpg',
                  //           width: 205,
                  //           height: 80,
                  //         ),
                  //       ),
                  //     ),
                  //     // Image 2
                  //     Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: ClipRRect(
                  //         child: Image.network(
                  //           'https://asset-2.tstatic.net/tribunnewswiki/foto/bank/images/Farmhouse-Lembang.jpg',
                  //           width: 200,
                  //           height: 80,
                  //         ),
                  //       ),
                  //     ),
                  //     // Image 3
                  //     Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: ClipRRect(
                  //         child: Image.network(
                  //           'https://dirgantaracarrental.com/wp-content/uploads/2016/12/farmhouse.jpg',
                  //           width: 180,
                  //           height: 80,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
