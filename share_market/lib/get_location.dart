import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'constants.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: ()async{
              LocationPermission permission = await Geolocator.requestPermission();
              Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
              print(position);
            },
            child: Text('Press to get location ', style: kSmallButtonStyle,),

          ),
          // Text(Position.),
        ],
      ),
    );
  }
}
