import 'package:clean_architecture_bookly/core/utils/app_router.dart';
import 'package:clean_architecture_bookly/core/utils/assets_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssetsManager.logoImage,
          height: 18,
        ),
        IconButton(onPressed: (){
          GoRouter.of(context).push(AppRouter.kSearch);
        },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: AppSize.s22,
            ))

      ],
    );
  }
}
