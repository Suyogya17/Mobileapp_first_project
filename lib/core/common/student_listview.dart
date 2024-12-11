import 'package:first_assignment/model/student.dart';
import 'package:flutter/material.dart';

class StudenListView extends StatelessWidget {
  const StudenListView({
    super.key,
    required this.lstStudent,
  });

  final List<Student> lstStudent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: lstStudent.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title:
                Text('${lstStudent[index].fname}  ${lstStudent[index].lname}'),
            subtitle: Text(lstStudent[index].city),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
            onTap: () {
              // Naavigation
              Navigator.pushNamed(
                context,
                "/personview",
                arguments: lstStudent[index],
              );
            },
          );
        },
      ),
    );
  }
}
