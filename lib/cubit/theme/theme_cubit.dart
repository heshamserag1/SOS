import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../helper/shared.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool _isDark = CacheHelper.getData(key: 'darkMode') ?? false;
  bool get isDark => _isDark;
  void changeTheme() {
    _isDark = !_isDark;
    CacheHelper.putData(key: 'darkMode', value: _isDark);
    emit(ThemeChange());
  }
}
