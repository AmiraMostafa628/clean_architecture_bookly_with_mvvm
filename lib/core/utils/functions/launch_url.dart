
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


Future <void> launchCustomUrl(context,String? urlAccess)
async {
  if(urlAccess != null)
    {
      final Uri url = Uri.parse(urlAccess);

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
      else
      {
        customSnackBar(context, 'cannot launch $urlAccess');
      }
    }
}

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Row(
        children: [
          const Icon(Icons.error,color: Colors.red,),
          const SizedBox(width: AppSize.s10,),
          Expanded(child: Text(text)),
        ],
      )));
}

