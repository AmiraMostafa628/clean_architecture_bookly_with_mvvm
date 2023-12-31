import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6/4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s16),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            errorWidget: (context,url,error)=>
            const Icon(Icons.error,color: Colors.red,),

          ),
        ));
  }
}