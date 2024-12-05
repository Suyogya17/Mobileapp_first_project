import 'package:first_assignment/core/common/student_listview.dart';
import 'package:first_assignment/model/student.dart';
import 'package:flutter/material.dart';

class ListviewHomework extends StatefulWidget {
  const ListviewHomework({super.key});

  @override
  State<ListviewHomework> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListviewHomework> {
  final _gap = const SizedBox(height: 10);
  final items = [
    const DropdownMenuItem(value: "Kathmandu", child: Text("Kathmandu")),
    const DropdownMenuItem(value: "Pokhara", child: Text("Pokhara")),
    const DropdownMenuItem(value: "Chitwan", child: Text("Chitwan")),
  ];

  List<Student> lstStudent = [];

  String? selectedCity;
  // Controller Banako
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _fnameController.dispose();
    _lnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(
                labelText: "Enter First Name",
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(
                labelText: "Enter Last Name",
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            DropdownButtonFormField(
              // icon: Icon(Icons.arrow_downward),
              items: items,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Select city",
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                        fname: _fnameController.text.trim(),
                        lname: _lnameController.text.trim(),
                        city: selectedCity!);
                    setState(() {
                      lstStudent.add(student);
                    });
                    // debug print gareko
                    debugPrint(lstStudent.length.toString());
                  },
                  child: const Text("Add Students")),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/output',
                        arguments: lstStudent);
                  },
                  child: const Text("View Students")),
            ),
            _gap,

            // display student details list  view gareko
            lstStudent.isEmpty
                ? const Text("No Data")
                : StudenListView(lstStudent: lstStudent)
          ],
        ),
      ),
    );
  }
}
