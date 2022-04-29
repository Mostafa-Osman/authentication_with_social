import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_cubit_state.dart';



class ButtonCubit extends Cubit<ButtonCubitState> {
  ButtonCubit() : super(ButtonCubitInitial());


  bool isLoading = false;

  bool isLoadingDone = false;

  changeLoadingStatus() {
    isLoading = !isLoading;
    emit(RefreshUi());
  }

  setButtonStatus() {
    isLoadingDone = !isLoadingDone;
    emit(RefreshUi());
  }
}
