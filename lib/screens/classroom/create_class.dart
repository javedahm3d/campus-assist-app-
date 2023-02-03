import 'package:campus/components/my_button.dart';
import 'package:campus/components/my_textfield.dart';
import 'package:campus/components/show_message.dart';
import 'package:campus/screens/classroom/class_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({super.key});

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final TextEditingController classNamecontroller = TextEditingController();
  final TextEditingController semestercontroller = TextEditingController();
  final TextEditingController divcontroller = TextEditingController();
  final TextEditingController roomNamecontroller = TextEditingController();
  final TextEditingController departmentNameController =
      TextEditingController();

  bool isButtonActive = false;
  bool islogoShow = true;

  @override
  void initState() {
    super.initState();
    classNamecontroller.addListener(() {
      final isActive = classNamecontroller.text.isNotEmpty;

      setState(() {
       isButtonActive = isActive;
      });
    });

  }

  @override
  void dispose() {
    super.dispose();
    classNamecontroller.dispose();
  }

  Future createClass() async {
    // String res = 'some error occured';
    var uuid = Uuid();
    String id = uuid.v1();

    //loading indictor
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //getting snapshot of user data
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    try {
      // storig class details
      await FirebaseFirestore.instance.collection('classes').doc(id).set({
        'class': classNamecontroller.text,
        'div': divcontroller.text,
        'department': departmentNameController.text,
        'semester': semestercontroller.text,
        'room': roomNamecontroller.text,
        'owner': snapshot.data()!['name'],
        'owner uid': FirebaseAuth.instance.currentUser!.uid,
        'members': [],
        'admins': []
      });

      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ClassScreen()));
    } catch (e) {
      ShowMessage().showMessage(e.toString().replaceAll('-', ''), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Image (
              image: AssetImage('lib/images/app_logo.png'),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30))
                            .copyWith(topRight: Radius.circular(30))),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'lets create a new class',
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        //classname
                        MyTextField(
                            controller: classNamecontroller,
                            hintText: 'class name  (required)',
                            obscureText: false),

                        SizedBox(
                          height: 10,
                        ),

                        //departmentname
                        MyTextField(
                            controller: departmentNameController,
                            hintText: 'department name',
                            obscureText: false),

                        SizedBox(
                          height: 10,
                        ),

                        //div
                        MyTextField(
                            controller: divcontroller,
                            hintText: 'div',
                            obscureText: false),

                        SizedBox(
                          height: 10,
                        ),

                        //semester
                        MyTextField(
                            controller: semestercontroller,
                            hintText: 'semester',
                            obscureText: false),

                        SizedBox(
                          height: 10,
                        ),

                        //room name
                        MyTextField(
                            controller: roomNamecontroller,
                            hintText: 'room',
                            obscureText: false),

                        SizedBox(height: 20),

                        MyButton(
                          onTap: isButtonActive ? createClass : null,
                          text: 'create class',
                          color: isButtonActive ? Colors.blue : Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
