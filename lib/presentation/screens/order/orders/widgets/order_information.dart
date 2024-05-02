import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/size_config.dart';
import '../../../../../data/models/models.dart';

class OrderInformation extends StatelessWidget {
  final Order order;
  const OrderInformation({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: getProportionateScreenWidth(170),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.customerName!,
                maxLines: 1,
                style: TextStyle(
                  // color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
              Text(
                // DateFormat('dd-MMM-yyyy').format(order.createdAt!),
                order.customerPhone!,
                style: TextStyle(
                  // color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
              Text(
                '\$${order.total}',
                style: TextStyle(
                  // color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: SvgPicture.asset('assets/icons/arrow_right.svg')),
      ],
    );
  }
}
