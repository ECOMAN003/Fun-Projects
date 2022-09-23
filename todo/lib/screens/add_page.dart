import 'package:flutter/material.dart';
import '../colors.dart';
import '../items.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
          showModalBottomSheet(context: context, builder: (context) =>
          
             Center(
              child: ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          );
          setState(() {
            //itemsList.add(Items('house is here', false));
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
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: thirdColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: secondColor.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
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
