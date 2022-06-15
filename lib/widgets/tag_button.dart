import 'package:flutter/material.dart';
import '../models/sizes.dart';

class TagsButton extends StatelessWidget {
  final String? category;
  final Size size;
  TagsButton(this.category, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.all(sizeGuide(size.height).getXS()),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white;
                }
                return Colors.white;
              },
            ),
            elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return 3;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ))),
        child: Text(
          category!,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
