import 'package:flutter/material.dart';

class EditTags extends StatefulWidget {
  const EditTags({super.key});

  @override
  State<EditTags> createState() => _EditTagsState();
}

class _EditTagsState extends State<EditTags> {
  final List<String> _tags = [];
  final List<TextEditingController> _ctrl = [];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GESTIONAR ETIQUETA'),
      ),
      body: Column(children: [
        Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: _tags.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                        child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TextField(
                              controller: _ctrl[index],
                            )),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                _tags.removeAt(index);
                                _ctrl.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete),
                            ))
                      ],
                    )))),
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _tags.add("");
                    _ctrl.add(TextEditingController());
                    setState(() {});
                  },
                  child: const Text("NUEVO"),
                ),
                ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < _tags.length; i++) {
                      _tags[i] = _ctrl[i].text;
                    }
                    Navigator.of(context).pop(_tags);
                  },
                  child: const Text("GUARDAR"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("CERRAR"),
                ),
              ],
            ))
      ]),
    );
  }
}
