import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchAppBarView extends StatelessWidget {
  const CustomSearchAppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        GoRouter.of(context).pop();
      },
      icon: const Icon(
          Icons.arrow_back_ios
      ),
    );
  }
}