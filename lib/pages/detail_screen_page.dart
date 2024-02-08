import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/tourism_place_model.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreenPage extends StatelessWidget {
  final TourismPlace place;
  const DetailScreenPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;

  DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.place.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          const SizedBox(height: 16),
                          Scrollbar(
                            controller: _scrollController,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.place.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  widget.place.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.place.openDays,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.access_time),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.place.openTime,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.monetization_on),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.place.ticketPrice,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.place.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Oxygen',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({Key? key, required this.place}) : super(key: key);

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
                Stack(
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(25),
                        child: Image.asset(place.imageAsset),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const FavoriteButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
