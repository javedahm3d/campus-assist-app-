import 'dart:ffi';

import 'package:campus/screens/classroom/class_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ClassroomCard extends StatefulWidget {
  final snap;
  const ClassroomCard({super.key, required this.snap});

  @override
  State<ClassroomCard> createState() => _ClassroomCardState();
}

class _ClassroomCardState extends State<ClassroomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ClassScreen(
            snap: widget.snap,
          ),
        )),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    image: const DecorationImage(
                        image: AssetImage('lib/images/class_bg1.png')),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //classame
                      Row(
                        children: [
                          Text(
                            widget.snap['class'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              itemBuilder: (context) => [
                                    PopupMenuItem(child: Text('edit class')),
                                    PopupMenuItem(
                                       onTap: () async {
                                        await FirebaseFirestore.instance
                                            .collection('classes')
                                            .doc(widget.snap['class id'])
                                            .delete();
                                       },
                                       child: Text('delete class')),
                                  ])
                        ],
                      ),

                      //div
                      Text(
                        widget.snap['div'],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),

                      //room
                      Text(
                        widget.snap['room'],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //owner name
                      Text(
                        widget.snap['owner'],
                        style: const TextStyle(color: Colors.black),
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
