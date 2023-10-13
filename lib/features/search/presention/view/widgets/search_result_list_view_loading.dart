import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/newest_book_loading_indicator.dart';
import 'package:flutter/material.dart';

class SearchResultLoading extends StatelessWidget {
  const SearchResultLoading({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context,state) =>const Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppPadding.p10),
          child: NewestBookLoadingIndicator(),
        ));
  }
}