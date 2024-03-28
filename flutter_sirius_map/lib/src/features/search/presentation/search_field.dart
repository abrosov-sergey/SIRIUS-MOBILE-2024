import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/providers/scroll_controller_providrr.dart';
import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';
import 'package:flutter_sirius_map/src/features/search/domain/providers/serach_provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';




class SearchField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final searchNotifier = ref.watch(searchStateNotifierProvider.notifier);
    return TypeAheadField<PointSearched>(
        suggestionsCallback: (search) {
          searchNotifier.updateName(search);
          ref.watch(scrollControllerProvider).jumpTo(1);
          return searchNotifier.searchPoint();
        },
       
        itemBuilder: (context, point) {
          return ListTile(
            title: Text(point.name),
          );
        },
        onSelected:(value) {} ,
        builder: (context, controller, focusNode) {
         return CupertinoTextField(
          focusNode:focusNode,
            controller: controller,
           decoration: BoxDecoration(
                  color: context.themeExtendColors.searchFieldColor,
                  borderRadius: BorderRadius.circular((10)),
                ),
                onChanged: (String value){
                 searchNotifier.updateName(value);
                },
                
                placeholder: context.localization.search,

                placeholderStyle: GoogleFonts.playfair(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                    color: context.themeExtendColors.searchFieldFillerColor,
                  )
                ),
                style: GoogleFonts.playfair(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                    color: context.themeExtendColors.searchFieldFillerColor,
                  )
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Icon(
                    Icons.search_outlined,
                    size: 20.sp,
                    color: context.themeExtendColors.searchFieldFillerColor,),
                ), 
          );
        },
    );
  }
}









/*
class SearchField extends ConsumerWidget{
  SearchField();
  final TextEditingController _controller1 = TextEditingController();




  @override
  Widget build(context, ref){
    final searchNotifier = ref.watch(searchStateNotifierProvider.notifier);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18.w),
      child: SizedBox(
        height: 36.h,
        child: Row(
          children: [
            Expanded(
              child: CupertinoTextField(
                decoration: BoxDecoration(
                  color: context.themeExtendColors.searchFieldColor,
                  borderRadius: BorderRadius.circular((10)),
                ),
                controller: _controller1,
                onChanged: (String value){
                 searchNotifier.updateName(value);
                },
               
                placeholder: context.localization.search,
                placeholderStyle: GoogleFonts.playfair(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                    color: context.themeExtendColors.searchFieldFillerColor,
                  )
                ),
                style: TextStyle(
                  color: context.themeExtendColors.searchFieldFillerColor,
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Icon(
                    Icons.search_outlined,
                    size: 20.sp,
                    color: context.themeExtendColors.searchFieldFillerColor,),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            BuildRouteButton(),
          ],
        )),
    );
  }
}*/