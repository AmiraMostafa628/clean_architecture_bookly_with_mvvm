import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/features/search/presention/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cache_text.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text ='';
    return  TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(
              onPressed: ()async{
                if(text.isNotEmpty){
                  return await BlocProvider.of<SearchBooksCubit>(context)
                      .fetchSearchBooks(searchText: text);
                }


            }, icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: AppSize.s22,
            ),
          ) ),

      ),
      onFieldSubmitted: (value)async{
        text = value;
        saveSearchTextData(value);
       await BlocProvider.of<SearchBooksCubit>(context)
           .fetchSearchBooks(searchText: value);
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),

        borderSide: const BorderSide(
            color: Colors.white,

        )
    );
  }
}