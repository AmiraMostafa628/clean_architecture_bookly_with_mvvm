import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';


class TextLoading extends StatelessWidget {
   const TextLoading({Key? key,required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: 20,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.06),
            borderRadius:
            const BorderRadius.all(Radius.circular(AppPadding.p16))),
      ),
    );

  }
}



