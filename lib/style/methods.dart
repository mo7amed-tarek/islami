import 'package:islami/style/app_constants.dart';

double calculateHeight(double widgetHeight, double screenHeight) {
  // widget height
  // design height
  // screen height
  return (widgetHeight / AppConstants.designHeight) * screenHeight;
}

double calculateWidth(double widgetWidth, double screenWidth) {
  return (widgetWidth / AppConstants.designWidth) * screenWidth;
}
