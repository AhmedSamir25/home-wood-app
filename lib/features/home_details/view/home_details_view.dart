import 'package:flutter/material.dart';
import 'package:homewood/features/home_details/view/widgets/home_details_view_body.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeDetailsViewBody(),
    );
  }
}