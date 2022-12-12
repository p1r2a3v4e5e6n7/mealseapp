import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageContainers {
  pageContainer(int? page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: page == 1 ? Colors.white : Colors.grey),
          height: 9,
          width: 40,
        ),
        const SizedBox(
          width: 25,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: page == 2 ? Colors.white : Colors.grey),
          height: 9,
          width: 40,
        ),
        const SizedBox(
          width: 25,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: page == 3 ? Colors.white : Colors.grey),
          height: 9,
          width: 40,
        ),
      ],
    );
  }
}
