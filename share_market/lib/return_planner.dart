// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_this, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'dart:math';

class SIForm extends StatefulWidget {
  @override
  State<SIForm> createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController principalcont = TextEditingController();
  TextEditingController profitcont = TextEditingController();
  TextEditingController losscont = TextEditingController();
  TextEditingController timecont = TextEditingController();
  TextEditingController avgtradecont = TextEditingController();
  TextEditingController compoundcont = TextEditingController();
  TextEditingController accuracycont = TextEditingController();
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RETURNS CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont: principalcont, name: 'PRINCIPAL', hintName: 'Enter principal amount (in Rupees)',),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont:profitcont, name: 'BOOK PROFIT', hintName:  'Enter profit(in percentage)',),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont: losscont, name:'STOP LOSS', hintName: 'Enter Stop loss(in percentage)'),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont: timecont, name: 'NUMBER OF MONTHS', hintName: 'Enter number of months you want to trade',),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont:avgtradecont, name: 'AVG NUMBER OF TRADE TAKEN per DAY', hintName:'Enter number of avg trade taken per day'),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont: compoundcont, name:'COMPOUNDING PERIOD ', hintName:'Enter compounding period (in days)'),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont:accuracycont, name: 'ESTIMATED ACCURACY', hintName: 'Enter accuracy '),
            SizedBox(width: 20, height: 20),
            DisplayResult(resultName: 'CALCULATE YOUR RETURNS',
            display:(){setState(() {
              if (_formKey.currentState!.validate()) {
                this.displayResult = _calculate();
                AlertDialog alert = AlertDialog(
                  title: Text("RETURNS", style: TextStyle(color: Colors.blue,fontWeight : FontWeight.w700, fontSize: 20),),
                  content: Text(
                      this.displayResult),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              }
              return null;
            }); } ,),
           ],
        ),
      ),
    );
  }

  String _calculate() {
    double principal = double.parse(principalcont.text);
    double profit = double.parse(profitcont.text);
    double loss = double.parse(losscont.text);
    int months = int.parse(timecont.text);
    int avgtrade = int.parse(avgtradecont.text);
    int compoundperiod = int.parse(compoundcont.text);
    double accuracy = double.parse(accuracycont.text);
    int  day = months*18 ;
    int actual_trade = (day / compoundperiod).floor();
    

    var factor = pow((1 + profit / 100), accuracy * actual_trade / 100) *
        pow((1 - loss / 100), (100 - accuracy) * actual_trade / 100);
    double returns_value = factor * principal;
    String result =
        "Your  Amount will be =  $returns_value  (in Rupees).";
    return result;
  }
}

class DisplayResult extends StatelessWidget {
  const DisplayResult({ required this.resultName, required this.display});
final String resultName;
final void Function() display;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: display,
      child: Container(
        alignment: Alignment.center,
        width: 300,
        color: Colors.green,
        child: Text(
          resultName,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}

class UseableCard extends StatelessWidget {
  const UseableCard({
    Key? key,
    required this.textEditCont,
    required this.name,
    required this.hintName,
  });

  final TextEditingController textEditCont;
  final String name;
  final String hintName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        controller: textEditCont,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: name,
          hintText: hintName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
      ),
    );
  }
}





