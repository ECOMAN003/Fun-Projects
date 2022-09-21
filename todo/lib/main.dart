import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Items> itemsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'To Do List',
          style: TextStyle(color: lastColor),
        ),
        elevation: 0,
      ),
      backgroundColor: lastColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            itemsList.add(Items('house is here', false));
          });
        },
        backgroundColor: secondColor,
        child: const Icon(
          Icons.add,
          color: thirdColor,
          size: 40.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: itemsList.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding:const  EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: thirdColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Checkbox(
                      checkColor: thirdColor,
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        return secondColor;
                      }),
                      value: itemsList[index].isFinished,
                      onChanged: (value) {
                        setState(() {
                          itemsList[index].isFinished = value!;
                        });
                      },
                    ),
                    title: Text(itemsList[index].label),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          itemsList.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
