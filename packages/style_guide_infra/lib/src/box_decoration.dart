import 'package:flutter/material.dart';

import '../style_guide_infra.dart';

final kCardDecoration = BoxDecoration(
  color: AppColor.white,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: const Color(0xffA1A7B3).withOpacity(0.16),
      blurRadius: 16,
      offset: const Offset(0, 2),
    )
  ],
);
