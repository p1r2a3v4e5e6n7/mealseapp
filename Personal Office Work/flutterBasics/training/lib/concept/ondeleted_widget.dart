import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnDeleted extends StatefulWidget {
  const OnDeleted({Key? key}) : super(key: key);

  @override
  State<OnDeleted> createState() => _OnDeletedState();
}

class _OnDeletedState extends State<OnDeleted> {
  final List<Names> _cast = <Names>[
    Names('Praveen', 'R'),
    Names('Ragul', 'T'),
    Names('Nandhu', 'S'),
    Names('Vasnth', 'R'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }

  _nameWidget() {
    return _cast.map((Names memberNames) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Chip(
          avatar: CircleAvatar(
            child: Text(memberNames.initials!),
          ),
          label: Text(memberNames.name!),
          onDeleted: () {
            setState(() {
              _cast.removeWhere((Names entry) {
                return entry.name! == memberNames.name!;
              });
            });
          },
        ),
      );
    }).toList();
  }
}

class Names {
  String? name;
  String? initials;
  Names(this.name, this.initials);
}
