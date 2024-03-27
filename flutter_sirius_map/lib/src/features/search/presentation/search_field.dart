import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/build_route_button.dart';
import 'package:flutter_sirius_map/src/features/search/data/providers/point_searched_repository.dart';
import 'package:flutter_sirius_map/src/features/search/domain/providers/providers.dart';
import 'package:flutter_sirius_map/src/utils/context.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends ConsumerWidget{


  SearchField();

  final TextEditingController _controller1 = TextEditingController();
  


  @override
  Widget build(context, WidgetRef ref){
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
                  ref.watch(nameProvider.notifier).state =_controller1.text;
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
}