/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/search/domain/providers/serach_provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class SearchedPointList extends ConsumerWidget {
  const SearchedPointList({super.key});
  
  @override
  Widget build(BuildContext context, ref) {
    final searchNotifier = ref.watch(searchStateNotifierProvider.notifier);
    
    return Consumer(
      builder: (context, ref, _){
        final points =  searchNotifier.searchPoint();
        return  TypeAheadField(
          itemBuilder: (context, index){
            final point = points[index!];
             return ListTile(
              title: Text(point.name),
              );            
          } 
          );

         
        
        /* ListView.builder(
          itemCount: points.length,
          itemBuilder: (context,index){
            final point = points[index];
            return ListTile(
                title: Text(point.name),
            );
          }
          );*/
      },
    );
  }
}*/
