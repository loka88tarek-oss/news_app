import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';

class CustomeErrorWidget extends StatelessWidget {
  const CustomeErrorWidget({super.key, required this.errorMessage, required this.onRefresh});
final String errorMessage;
final  void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.center,
     
      children: [
     Text(errorMessage,style: context.theme.textTheme.bodyMedium,),
     FilledButton.icon(onPressed: onRefresh, label: Text("On Refresh",style: context.theme.textTheme.bodySmall,
     
     ),
     icon: Icon(Icons.refresh_outlined,color: context.theme.colorScheme.secondary,),)
      
      ],
    );
  }
}