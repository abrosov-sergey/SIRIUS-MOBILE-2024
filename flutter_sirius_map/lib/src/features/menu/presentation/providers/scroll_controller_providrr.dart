import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollControllerProvider = Provider<DraggableScrollableController>((ref) {
  return DraggableScrollableController();
});
