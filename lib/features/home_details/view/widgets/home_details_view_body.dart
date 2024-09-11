import 'package:flutter/material.dart';
import 'package:homewood/features/home_details/view/widgets/app_bar_home_details.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          AppBarHomeDetails()
        ],
      ),
    );
  }
}