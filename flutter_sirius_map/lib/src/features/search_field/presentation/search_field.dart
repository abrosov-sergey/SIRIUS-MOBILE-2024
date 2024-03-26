import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/utils/context.dart';
import 'package:google_fonts/google_fonts.dart';

class SerchField extends ConsumerWidget{

  String? pointName;
  SerchField();

  @override
  Widget build(context, ref){
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
                onChanged: (String value){
                  pointName = value;
                },
                placeholder: "Search",
                placeholderStyle: GoogleFonts.andadaPro(
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
              ),
            ),
          ],
        )),
    );
  }
}