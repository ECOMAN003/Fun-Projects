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
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'To Do List',
          style: TextStyle(color: lastColor),
        ),
        elevation: 3.0,
      ),
      backgroundColor: lastColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheet(context);
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
                  child: listTileBody(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//listTile 
  ListTile listTileBody(int index) {
    return ListTile(
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
      title: Text(
        itemsList[index].label,
        style: TextStyle(
            decoration: itemsList[index].isFinished
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: mainColor),
      ),
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
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        context: context,
        builder: (context) {
          return Container(
              height: 100.0,
              decoration: const BoxDecoration(
                  color: thirdColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: const BoxDecoration(
                          color: mainColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: _textController,
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  hintText: 'Enter The Task',
                                  hintStyle: const TextStyle(color: mainColor),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: createTask,
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: mainColor,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }

//create new Task
  void createTask() {
    setState(() {
      itemsList.add(Items(_textController.text, false));
    });
    _textController.clear();
  }
}
