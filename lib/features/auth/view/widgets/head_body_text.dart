import 'package:flutter/material.dart';
class HeadBodyText extends StatelessWidget {
  const HeadBodyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child:  Column(
          children: [
            Text("Data",style: TextStyle(fontSize: 25),),
            SizedBox(height: 10,),
            Text("Data",style: TextStyle(fontSize: 19),),
          ],
        ),
      ),
    );
  }
}
