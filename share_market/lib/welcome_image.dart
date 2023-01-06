// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:share_market/option.dart';
import 'constants.dart';

final List<String> imgList = [
  'https://st.depositphotos.com/1419495/2284/i/450/depositphotos_22846920-stock-photo-dices-cubes-with-the-words.jpg',
  'https://images.pexels.com/photos/6802049/pexels-photo-6802049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'http://www.topsharebrokers.com/images/logo/1x1/zerodha/zerodha-brokerage-plan.jpg',
  'http://www.topsharebrokers.com/images/logo/display/groww/groww-brokerage-plan.jpg',
  'https://lh3.googleusercontent.com/bXsJnF2AQA-xAG7GdoS6X5icWJvEZkRwRqc_RkUJG4c-CHbFF--y1xKbY1nEDuuvRkqP=w300-rw',
];

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Text("WELCOME",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(
          height: 20,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: imgList
              .map((item) => Container(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black54, width: 2)),
                                child: Image.network(item,
                                    fit: BoxFit.cover, width: 1000)),
                          )),
                    )),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 60,
        ),
        TextWelcomePge(text1: 'PLAN YOUR'),
        SizedBox(height: 20),
        TextWelcomePge(text1: 'SHARE MARKET'),
        SizedBox(height: 20),
        TextWelcomePge(text1:  'TRADING'),
        SizedBox(height: 40),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyOption()));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "NEXT",
                style: kSmallButtonStyle,
              ),
            )),
      ],
    ));
  }
}
class TextWelcomePge extends StatelessWidget {
   TextWelcomePge({ required String this.text1 }) ;
     String text1;
     @override
  Widget build(BuildContext context) {
    return Text(
      '$text1',
      style: TextStyle(
          color: const Color.fromARGB(255, 95, 6, 119),
          fontWeight: FontWeight.w900,
          fontSize: 30),
    );
  }
}
