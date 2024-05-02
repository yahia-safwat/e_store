import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class ExpandableText extends StatefulWidget {
  final String? text;
  const ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool isHiddenText = true;

  double textHeight = getProportionateScreenHeight(70);

  @override
  void initState() {
    super.initState();
    if (widget.text!.length > textHeight) {
      firstHalf = widget.text!.substring(0, textHeight.toInt());
      secondHalf =
          widget.text!.substring(textHeight.toInt() + 1, widget.text!.length);
    } else {
      firstHalf = widget.text!;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
      ),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isHiddenText ? (firstHalf + '...') : (firstHalf + secondHalf),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                InkWell(
                  onTap: () {
                    setState(() {
                      isHiddenText = !isHiddenText;
                    });
                  },
                  child: isHiddenText
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "See More Detail",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: kPrimaryColor,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                              "See Less",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                            ),
                            Icon(Icons.arrow_drop_up, color: Colors.amber),
                          ],
                        ),
                ),
              ],
            ),
    );
  }
}
