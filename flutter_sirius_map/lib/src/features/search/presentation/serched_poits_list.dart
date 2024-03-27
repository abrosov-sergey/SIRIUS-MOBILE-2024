import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/build_route_button.dart';
import 'package:flutter_sirius_map/src/features/search/data/providers/point_searched_repository.dart';
import 'package:flutter_sirius_map/src/features/search/domain/providers/providers.dart';
import 'package:flutter_sirius_map/src/utils/context.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchedPointList extends ConsumerWidget {
  const SearchedPointList({super.key});
  
  @override
  Widget build(BuildContext context, ref) {
    return Consumer(
      builder: (context, ref, _) {
        final points = ref.watch(serchedListProvider.notifier).state;
        return Column(
          children: points.map((point) {
            return Container(
              height: 50.h,
              child: Text(point.toString()),
            );
          }).toList(),
        );
      },
    );
  }
}