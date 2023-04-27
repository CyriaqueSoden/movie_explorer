import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/repositories/user_repository.dart';
import '../repositories/preferences_repository.dart';

class UserCubit extends Cubit<bool> {
  UserCubit(this.userRepository) : super(false);
  UserRepository userRepository =
      UserRepository(preferencesRepository: PreferencesRepository());

  bool connected = false;

  Future<void> init() async {
    emit(await userRepository.init());
  }

  void disconnect() {
    connected = false;
    userRepository.deleteToken();
    emit(connected);
  }

  Future<void> login(String username, String password) async {
    connected = await userRepository.login(username, password);
    emit(connected);
  }
}
