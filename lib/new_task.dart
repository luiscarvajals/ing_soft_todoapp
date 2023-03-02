import 'package:flutter/material.dart';
import 'package:ing_soft_todoapp/obj/task.dart';
import 'package:intl/intl.dart';

import 'edit_tags.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController ctrlTitle = TextEditingController();

  List _tags = ['Personal', 'Trabajo', 'Estudio'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  late String _currentTag;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentTag = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String tag in _tags) {
      items.add(DropdownMenuItem(value: tag, child: Text(tag)));
    }
    return items;
  }

  void changedDropDownItem(String? selectedTag) {
    setState(() {
      _currentTag = selectedTag!;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTRAR NUEVA TAREA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre de la tarea',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: ctrlTitle,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre de la tarea',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Fecha de cumplimiento',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd-MM-yyyy').format(_selectedDate).toString()),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Etiqueta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButton(
                      value: _currentTag,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItem),
                ),
                ElevatedButton(
                    onPressed: () async => _tags =
                            await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditTags(),
                        )),
                    child: const Icon(Icons.edit)),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Task task = Task(
                          ctrlTitle.text, _selectedDate, _currentTag, false);
                      print(task.toString());
                      Navigator.of(context).pop(task);
                    },
                    child: const Text('Guardar'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
