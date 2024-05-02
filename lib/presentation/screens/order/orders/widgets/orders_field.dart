import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../logic/bloc/blocs.dart';
import 'order_card.dart';

class OrdersField extends StatelessWidget {
  const OrdersField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(18),
          vertical: getProportionateScreenHeight(10),
        ),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return buildProgressIndicator();
            }
            if (state is OrderLoaded) {
              final authBloc = context.read<AuthBloc>();
              final List<Order> orders = state.orders
                  .where(
                    (order) =>
                        order.userId == authBloc.state.user!.id &&
                        order.isCancelled == false &&
                        order.isDelivered == false,
                  )
                  .toList();
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(2),
                  horizontal: getProportionateScreenWidth(2),
                ),
                itemCount: orders.length,
                itemBuilder: ((context, index) {
                  return OrderCard(
                    order: orders[index],
                  );
                }),
              );
            } else {
              return Text('Something Went Wrong!');
            }
          },
        ),
      ),
    );
  }
}
