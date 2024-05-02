import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/services/services.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());

  Future<dynamic> submit() {
    return CacheHelper.setBool('isFreshInstalled', false);
  }

  // Future<bool?> isFreshInstalled() async {
  //   bool? showBoarding = await CacheHelper.getBool(key: 'isFreshInstalled');
  //   return showBoarding;
  // }
}
