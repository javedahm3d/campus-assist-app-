import 'package:campus/screens/classroom/upload_post_screen.dart';
import 'package:campus/widgets/my_appbar.dart';
import 'package:campus/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: Text("classroom"),
        ),
        drawer: NavigationDrawer(),

        //floating button
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SizedBox(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (() {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                      .copyWith(topRight: Radius.circular(20)),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10).copyWith(top: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UploadPostScreen(),
                              ));
                            },
                            child: Text(
                              'upload post',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'take attendance',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ));
  }
}
