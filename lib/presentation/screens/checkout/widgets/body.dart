import 'package:e_store_app1/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../core/constants/constants.dart';
import '../../../../logic/bloc/blocs.dart';
import '../../../widgets/form_error.dart';
import '../../home/widgets/custom_text_form_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(20)),
      child: SingleChildScrollView(
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return buildProgressIndicator();
            }
            if (state is CheckoutLoaded) {
              // var user = state.user ?? User.empty;

              return Form(
                key: context.read<CheckoutBloc>().checkoutformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'USER INFORMATION',
                    //   style: TextStyle(
                    //     fontSize: getProportionateScreenHeight(14),
                    //   ),
                    // ),
                    // CustomTextFormField(
                    //   initialValue: user.email,
                    //   title: 'Email',
                    //   hintText: 'Enter Your Email',
                    //   onChanged: (value) {
                    //     context.read<CheckoutBloc>().add(UpdateCheckout(
                    //           user: state.checkout.user!.copyWith(email: value),
                    //         ));
                    //   },
                    // ),
                    CustomTextFormField(
                      // initialValue: user.fullName,
                      title: 'Name',
                      hintText: 'Enter Your Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kNameNullError);
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kNameNullError);
                        }
                        context.read<CheckoutBloc>().add(UpdateCheckout(
                              user: state.checkout.user!
                                  .copyWith(fullName: value),
                            ));
                      },
                    ),
                    CustomTextFormField(
                      // initialValue: user.phone,

                      title: 'Phone',
                      hintText: 'Enter Your Phone',
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kPhoneNumberNullError);
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kPhoneNumberNullError);
                        }
                        context.read<CheckoutBloc>().add(UpdateCheckout(
                              user: state.checkout.user!.copyWith(phone: value),
                            ));
                      },
                    ),

                    SizedBox(height: getProportionateScreenHeight(10)),
                    // Text(
                    //   'DELIVERY INFORMATION',
                    //   style: TextStyle(
                    //     fontSize: getProportionateScreenHeight(14),
                    //   ),
                    // ),
                    // CustomTextFormField(
                    //   title: 'Phone',
                    //   hintText: 'Enter Your Phone',
                    //   onChanged: (value) {
                    //     context.read<CheckoutBloc>().add(UpdateCheckout(
                    //            user:
                    //               state.checkout.user!.copyWith(fullName: value),
                    //         ));
                    //   },
                    // ),
                    CustomTextFormField(
                      // initialValue: user.address,

                      title: 'Address',
                      hintText: 'Enter Your Address',
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kAddressNullError);
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kAddressNullError);
                        }
                        context.read<CheckoutBloc>().add(UpdateCheckout(
                              user:
                                  state.checkout.user!.copyWith(address: value),
                            ));
                      },
                    ),
                    CustomTextFormField(
                      // initialValue: user.city,

                      title: 'City',
                      hintText: 'Enter Your City',
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kCityNullError);
                          return '';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kCityNullError);
                        }
                        context.read<CheckoutBloc>().add(UpdateCheckout(
                              user: state.checkout.user!.copyWith(city: value),
                            ));
                      },
                    ),
                    // CustomTextFormField(
                    //   title: 'Country',
                    //   hintText: 'Enter Country Name',
                    //   onChanged: (value) {
                    //     context.read<CheckoutBloc>().add(UpdateCheckout(
                    //           country: value,
                    //         ));
                    //   },
                    // ),
                    // CustomTextFormField(
                    //   title: 'ZIP Code',
                    //   hintText: 'Enter ZIP Code',
                    //   onChanged: (value) {
                    //     context.read<CheckoutBloc>().add(UpdateCheckout(
                    //           zipCode: value,
                    //         ));
                    //   },
                    // ),

                    SizedBox(height: getProportionateScreenHeight(30)),
                    FormError(errors: errors),
                  ],
                ),
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
