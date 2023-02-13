import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassPostCard extends StatefulWidget {
  final snap;
  const ClassPostCard({super.key , required this.snap});

  @override
  State<ClassPostCard> createState() => _ClassPostCardState();
}

class _ClassPostCardState extends State<ClassPostCard> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      child: Card(
        elevation: 3,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey.shade700)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 22,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.snap['creator'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      ),


                      SizedBox(height: 5,),

                      Text(
                        DateFormat.MMMd().format(widget.snap['published time'].toDate())
                        ,
                        style: TextStyle(color: Colors.grey.shade800),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.snap['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(widget.snap['body']),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.paperclip,
                          size: 20,
                          color: Colors.grey.shade600,
                        ),
                        Text('  2 attachments')
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  'add class comment',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
