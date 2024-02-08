import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourspotter/main.dart';

class DetailScreenPage extends StatefulWidget {
  const DetailScreenPage({super.key});

  @override
  State<DetailScreenPage> createState() => _DetailScreenPageState();
}

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class _DetailScreenPageState extends State<DetailScreenPage> {
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
                Image.network(
                    'https://grahanurdian.com/pic/2022/03/farmhouse-susu-lembang.webp'),
                // Title Text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Farm House Lembang',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                // Detail Content 3 Icons
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Widget 1
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.calendar_month, size: 30),
                            Text(
                              'Open Everyday',
                              style: TextStyle(
                                height: 2,
                              ),
                            )
                          ],
                        ),
                        // Widget 2
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(CupertinoIcons.clock, size: 30),
                            Text(
                              '09.00 = 20.00',
                              style: TextStyle(
                                height: 2,
                              ),
                            )
                          ],
                        ),
                        // Widget 3
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.monetization_on, size: 30),
                            Text(
                              'Rp. 25.000',
                              style: TextStyle(
                                height: 2,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Detail Explain Place
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Center(
                    child: Text(
                      'Berada di jalur utama Bandung - Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk swafoto instagramale.',
                      textAlign: TextAlign.justify,
                      // style: TextStyle(),
                    ),
                  ),
                ),
                // More Photos Place
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Image 1
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          child: Image.network(
                            'https://www.hotelmurah.com/ceritawisata/wp-content/uploads/2019/01/rumah-hobbit.jpg',
                            width: 205,
                            height: 80,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Image 2
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ClipRRect(
                          child: Image.network(
                            'https://asset-2.tstatic.net/tribunnewswiki/foto/bank/images/Farmhouse-Lembang.jpg',
                            width: 200,
                            height: 80,
                          ),
                        ),
                      ),
                      // Image 3
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ClipRRect(
                          child: Image.network(
                            'https://dirgantaracarrental.com/wp-content/uploads/2016/12/farmhouse.jpg',
                            width: 180,
                            height: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
