
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import 'constants_manager.dart';

abstract class Styles{

  static const testStyle30= TextStyle(
      fontSize: AppSize.s30,
      fontWeight: FontWeight.normal,
      fontFamily: gtSectraFine
  );

  static const testStyle20= TextStyle(
    fontSize: AppSize.s20,
    fontWeight: FontWeight.normal,
  );

  static const testStyle18= TextStyle(
    fontSize: AppSize.s18,
    fontWeight: FontWeight.w600,
  );

  static const testStyle16= TextStyle(
    fontSize: AppSize.s16,
    fontWeight: FontWeight.w600,
  );

  static const testStyle14= TextStyle(
      fontSize: AppSize.s14,
      fontWeight: FontWeight.w500,
  );


}