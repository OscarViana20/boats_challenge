import 'package:boats_challenge/src/models/boat_model.dart';
import 'package:flutter/material.dart';

class BoatWidget extends StatelessWidget {
  
  const BoatWidget({
    @required this.boat,
    Key key
  }) : super(key: key);

  final BoatModel boat;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 1.7,
          child: Image(
            image: AssetImage(boat.path), 
            fit: BoxFit.fill
          )
        ),        
        SizedBox(height: 25),
        Text(boat.model, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25)),
        SizedBox(height: 5),
        Text('By ${boat.author}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18)),
        SizedBox(height: 10),
        Text('SPEC >', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w500, fontSize: 15))
      ],
    );
  }
}