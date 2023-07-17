import 'package:flutter/material.dart';

import '../../../constants/images_string.dart';

class DashboardCategoriesModel {
  late final String title;
  late final String heading;
  late final String subHeading;
  late final Image image;
  late final VoidCallback onPress;
  DashboardCategoriesModel(
      this.title, this.heading, this.subHeading, this.image, this.onPress);
  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel("JS", "Java Script", "10 Lessons",
        Image.asset(tTopCourseImage1), () {}),
    DashboardCategoriesModel(
        "F", "Flutter", "11 Lessons", Image.asset(tTopCourseImage2), () {}),
    DashboardCategoriesModel(
        "H", "HTML", "200 Lessons", Image.asset(tTopCourseImage1), () {}),
    DashboardCategoriesModel(
        "K", "Kotlin", "5 Lessons", Image.asset(tTopCourseImage2), () {}),
    DashboardCategoriesModel(
        "P", "Python", "56 Lessons", Image.asset(tTopCourseImage1), () {}),
  ];
}
