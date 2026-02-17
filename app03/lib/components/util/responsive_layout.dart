

import 'package:flutter/material.dart';

Widget buildRowColumn(BuildContext context, Widget field1, Widget field2) {

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Expanded(child: field1),
              const SizedBox(width: 16),
              Expanded(child: field2),
            ],
          );
        } else {
          return Column(
            children: [
              field1,
              const SizedBox(height: 10),
              field2,
            ],
          );
        }
      },
    );
  }