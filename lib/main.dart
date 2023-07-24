import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(),
              ImageSlider(),
              ImageDescription(),
              BottomSheet()
            ],
          ),
        )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ProductName(),
      const ProductQuantity(),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15.0, top: 15),
        child: Row(
          children: [
            const Text(
              "\$11.99",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const ItemCounter(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("Cart")),
            )
          ],
        ),
      )
    ]);
  }
}

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int _initialValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: ItemCount(
        initialValue: _initialValue,
        minValue: 0,
        maxValue: 10,
        decimalPlaces: 0,
        color: Colors.white,
        textStyle: const TextStyle(fontSize: 16),
        buttonSizeHeight: 30,
        buttonSizeWidth: 35,
        onChanged: (value) {
          setState(() {
            _initialValue = value as int;
          });
        },
      ),
    );
  }
}

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
      child: Row(
        children: [Text("Size: 125 ml"), Spacer(), Text("(34 Reviews)")],
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
      child: Row(
        children: [
          const Text(
            "Facial Moisturizer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: RatingBar.builder(
              initialRating: 3.5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
          )
        ],
      ),
    );
  }
}

class ImageDescription extends StatelessWidget {
  const ImageDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageQuality("assets/vegan.png", "Vegan"),
          ImageQuality("assets/natural.png", "Natural"),
          ImageQuality("assets/neutral.png", "C+ Neutral"),
        ],
      ),
    );
  }
}

class ImageQuality extends StatelessWidget {
  final String imageUrl;
  final String imageText;
  const ImageQuality(
    this.imageUrl,
    this.imageText, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 50,
              height: 50,
            ),
            Text(imageText)
          ],
        ));
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Carousel(
            indicatorBarColor: Colors.white,
            autoScroll: true,
            height: MediaQuery.of(context).size.height * 0.5,
            // widgets
            items: [
              Image.asset(
                "assets/product1.png",
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Image.asset(
                "assets/product2.png",
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Image.asset(
                "assets/product3.png",
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ]));
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios_new),
          Spacer(),
          Icon(Icons.grid_view_outlined)
        ],
      ),
    );
  }
}
