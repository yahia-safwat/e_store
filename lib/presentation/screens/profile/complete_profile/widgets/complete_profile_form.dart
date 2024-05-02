// ignore_for_file: unused_import

import 'package:e_store_app1/presentation/screens/profile/complete_profile/widgets/user_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../../core/components/snackbar/network_snackbar.dart';
import '../../../../../logic/cubit/cubits.dart';
import '../../../../../presentation/widgets/custom_surfix_icon.dart';
import '../../../../../presentation/widgets/default_button.dart';
import '../../../../../presentation/widgets/form_error.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../config/size_config.dart';
import '../../../screens.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? fullName;
  String? phone;
  String? country;
  String? address;
  String? city;
  String? zipCode;

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
    return BlocConsumer<SignupCubit, SignupState>(
      listener: ((context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.pushNamed(context, HomeScreen.routeName);
        } else {}
      }),
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildFullNameFormField(state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPhoneFormField(state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildCountryNameFormField(state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildCityNameFormField(state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildAddressFormField(state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildZipCodeFormField(state),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(40)),
              DefaultButton(
                text: "continue",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    // Navigator.pushNamed(context, OtpScreen.routeName);
                    // Navigator.pushNamed(context, HomeScreen.routeName);

                    if (await InternetConnectionChecker().hasConnection) {
                      context.read<SignupCubit>().signUpWithCredentials();
                    } else {
                      showNetworkSnackbar(context: context);
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddressFormField(state) {
    return UserInput(
      onChanged: (value) {
        context.read<SignupCubit>().userChanged(
              state.user!.copyWith(address: value),
            );
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return;
      },
      labelText: "Address Name",
      hintText: "Enter your address name",
      onSaved: (newValue) => city = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
    );
  }

  Widget buildCityNameFormField(state) {
    return UserInput(
      onChanged: (value) {
        context.read<SignupCubit>().userChanged(
              state.user!.copyWith(city: value),
            );
        if (value.isNotEmpty) {
          removeError(error: kCityNullError);
        }
        return;
      },
      labelText: "City Name",
      hintText: "Enter your city name",
      onSaved: (newValue) => city = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kCityNullError);
          return "";
        }
        return null;
      },
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
    );
  }

  Widget buildCountryNameFormField(state) {
    return UserInput(
      onChanged: (value) {
        context.read<SignupCubit>().userChanged(
              state.user!.copyWith(country: value),
            );
        if (value.isNotEmpty) {
          removeError(error: kCountryNullError);
        }
        return;
      },
      labelText: "Country Name",
      hintText: "Enter your country name",
      onSaved: (newValue) => country = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kCountryNullError);
          return "";
        }
        return null;
      },
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
    );
  }

  Widget buildFullNameFormField(state) {
    return UserInput(
      onChanged: (value) {
        context.read<SignupCubit>().userChanged(
              state.user!.copyWith(fullName: value),
            );
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return;
      },
      labelText: "Full Name",
      hintText: "Enter your first name",
      onSaved: (newValue) => fullName = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
    );
  }

  Widget buildPhoneFormField(state) {
    return UserInput(
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        context.read<SignupCubit>().userChanged(
              state.user!.copyWith(phone: value),
            );
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return;
      },
      labelText: "Phone",
      hintText: "Enter your Phone Number",
      onSaved: (newValue) => phone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
    );
  }

  Widget buildZipCodeFormField(state) {
    return UserInput(
      onChanged: (value) {
        context.read<SignupCubit>().userChanged(
              state.user!.copyWith(zipCode: value),
            );
        if (value.isNotEmpty) {
          removeError(error: kZipCodeNullError);
        }
        return;
      },
      labelText: "ZIP Code",
      hintText: "Enter your ZIP Code",
      onSaved: (newValue) => zipCode = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kZipCodeNullError);
          return "";
        }
        return null;
      },
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
    );
  }
}
