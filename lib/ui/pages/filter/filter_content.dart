import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class FilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiceTitle(context),
        buildChoiceTitle(context),
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text("1111"),
    );
  }

}
