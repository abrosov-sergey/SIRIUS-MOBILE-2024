import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/presentation/widgets/favorite_bloc_widget.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/build_route_button.dart';
import 'package:flutter_sirius_map/src/features/search/presentation/search_field.dart';

class BaseAppStateWidget extends ConsumerWidget {
  const BaseAppStateWidget({super.key});

  @override
  Widget build(context, ref) {
    final notifier = ref.watch(appStateNotifierProvider.notifier);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              const Expanded(
                child: SearchField(),
              ),
              SizedBox(width: 10.w),
              BuildRouteButton(
                callBack: () => notifier.onSetChoiceAppState(),
              ),
            ],
          ),
        ),
        FavoriteBlocWidget(
          onFavoriteChoice: (id) => notifier.onFinishPointChoice(id),
        ),
      ],
    );
  }
}
