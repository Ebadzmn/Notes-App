import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notesapp/app/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logoSvg, width: 120);
  }
}