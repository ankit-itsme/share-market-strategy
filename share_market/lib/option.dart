// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:share_market/emi.dart';
import 'package:share_market/get_location.dart';
import 'package:share_market/return_planner.dart';
import 'package:share_market/welcome_image.dart';
import 'constants.dart';
import 'package:share_market/get_location.dart';

class MyOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 150),
          OptionToDo(colour: Colors.indigo,
            name: 'SHARE MARKET',
          onPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SIForm()));
          },),
          SizedBox(height: 40),
          OptionToDo(colour: Colors.orange, name: 'ZERODHA BROKERAGE', onPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetLocation()));
          },),
          SizedBox(height: 40),
          OptionToDo(colour: Colors.indigo, name: 'GROWW BROKERAGE',
          onPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SIForm()));
          },),
          SizedBox(height: 40),
          OptionToDo(colour: Colors.orange, name: 'EMI CALCULATOR',
          onPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Emi()));
          },),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'BACK',
                  style: kSmallButtonStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionToDo extends StatelessWidget {
   OptionToDo({ required this.colour, required this.name, required this.onPress}) ;
  final Color colour;
  final String name;
  final void Function() onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 300,
        height: 80,
        decoration:
            BoxDecoration(color: colour, border: Border.all(color: Colors.black26)),
        child: Center(
          child: Text( name,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

