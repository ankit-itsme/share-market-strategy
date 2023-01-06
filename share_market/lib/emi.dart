// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'dart:math';
import 'return_planner.dart';

class Emi extends StatefulWidget {
  @override
  State<Emi> createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController loanAmountcont = TextEditingController();
  TextEditingController ratecont = TextEditingController();
  TextEditingController timecont = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EMI CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont: loanAmountcont, name: 'LOAN AMOUNT', hintName: 'Enter Loan amount (in Rupees)'),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont:  ratecont, name: 'INTEREST RATE', hintName:'Enter Interest Rate(Yearly)'),
            SizedBox(width: 20, height: 20),
            UseableCard(textEditCont: timecont, name: 'TENURE PERIOD', hintName:'Enter Tenure Period(in years)'),
            SizedBox(width: 20, height: 20),
           DisplayResult(resultName:'CALCULATE YOUR EMI',
               display:() {
                 setState(() {
                   if (_formKey.currentState!.validate()) {
                     this.displayResult = _calculate();

                     AlertDialog alert = AlertDialog(
                       title: Text(
                         "EMI",
                         style: TextStyle(
                             color: Colors.blue,
                             fontWeight: FontWeight.w700,
                             fontSize: 20),
                       ),
                       content: Text(this.displayResult),
                     );

                     showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return alert;
                       },
                     );
                   }
                   return null;
                 });
               },
           )
          ],
        ),
      ),
    );
  }

  String _calculate() {
    double loanAmount = double.parse(loanAmountcont.text);
    double rate = double.parse(ratecont.text);
    int year = int.parse(timecont.text);

    var r = rate / (100 * 12);
    var n = year * 12;

    var factor = pow((1 + r), n);

    double returns_value = loanAmount * r * (factor / (factor - 1));
    var net = returns_value * n;
    var interest1 = net - loanAmount;

    String inString = returns_value.toStringAsFixed(2);
    double inDouble = double.parse(inString);
    String interest2= interest1.toStringAsFixed(2);
    double interest = double.parse(interest2);
    String result =
        "Your  EmI will be = \n $inDouble   (in Rupees). \n \nYour Net Interest payable  will be = \n $interest (in Rupees)";
    return result;
  }
}

