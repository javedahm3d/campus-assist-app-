import 'package:campus/screens/classroom/class_screen.dart';
import 'package:flutter/material.dart';

class ClassroomCard extends StatefulWidget {
  final snap;
  const ClassroomCard({super.key , required this.snap});

  @override
  State<ClassroomCard> createState() => _ClassroomCardState();
}

class _ClassroomCardState extends State<ClassroomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassScreen(), )),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    image: DecorationImage(
                      image: AssetImage('lib/images/class_bg1.png')
                      
                    ),
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.grey)
                     ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //classame
                      Text(
                        widget.snap['class'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                  
                      //div
                      Text(
                        widget.snap['div'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                  
                      //room
                      Text(
                        widget.snap['room'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                  
                      SizedBox(
                        height: 30,
                      ),
                  
                      //owner name
                      Text(
                        widget.snap['owner'],
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
