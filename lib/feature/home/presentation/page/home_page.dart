import 'package:coding_challenge/feature/home/presentation/page/empty_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: EmptyView(), color: Colors.white,);
  }
}
