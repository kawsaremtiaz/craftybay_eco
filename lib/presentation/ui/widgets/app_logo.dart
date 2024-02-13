import 'package:craftybay/presentation/ui/utility/assets_content_path.dart';
import 'package:flutter/cupertino.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsContentPath.logo, width: width ?? 120, height: height,);
  }
}
