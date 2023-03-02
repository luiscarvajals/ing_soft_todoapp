import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'new_task.dart';
import 'obj/task.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TODO APP'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Task task = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NewTask(),
            ));
            _tasks.add(task);
            setState(() {});
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index) {
              if (_tasks[index].isDone() == false) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Checkbox(
                              value: _tasks[index].isDone(),
                              onChanged: (value) {
                                _tasks[index].setDone(true);
                                setState(() {});
                              },
                            )),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_tasks[index].getTitle(),
                                    style: const TextStyle(fontSize: 20)),
                                Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(_tasks[index].getDueDate())
                                        .toString(),
                                    style: const TextStyle(fontSize: 15)),
                                Text(_tasks[index].getTag(),
                                    style: const TextStyle(fontSize: 15)),
                              ],
                            )),
                        const Expanded(
                            flex: 2,
                            child: Text('PENDIENTE',
                                style: TextStyle(color: Colors.red))),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                _tasks.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete),
                            ))
                      ],
                    ));
              } else {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Checkbox(
                              value: _tasks[index].isDone(),
                              onChanged: (value) {
                                _tasks[index].setDone(false);
                                setState(() {});
                              },
                            )),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_tasks[index].getTitle(),
                                    style: const TextStyle(fontSize: 20)),
                                Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(_tasks[index].getDueDate())
                                        .toString(),
                                    style: const TextStyle(fontSize: 15)),
                                Text(_tasks[index].getTag(),
                                    style: const TextStyle(fontSize: 15)),
                              ],
                            )),
                        const Expanded(
                            flex: 2,
                            child: Text('COMPLETADO',
                                style: TextStyle(color: Colors.green))),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                _tasks.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete),
                            ))
                      ],
                    ));
              }
            }));
  }
}
