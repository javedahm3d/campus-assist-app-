import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController bodyController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {
        isButtonActive = titleController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              CupertinoIcons.xmark,
            )),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 3,
        actions: [
          isButtonActive?
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 25),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 61, 141, 64),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Create Post',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
          :Container()
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Divider(thickness: 1.5),

                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'title*',
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                  controller: titleController,
                ),

                Divider(thickness: 1.5),

                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 300),
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.text_append),
                          labelText: 'body',
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      controller: bodyController,
                    ),
                  ),
                ),

                Divider(thickness: 1.5),

                SizedBox(height: 20),

                //attach file
                InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      child: Row(
                        children: [
                          Icon(Icons.attach_file),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'attach file',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade700),
                          )
                        ],
                      ),
                    )),

                Divider(thickness: 1.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
