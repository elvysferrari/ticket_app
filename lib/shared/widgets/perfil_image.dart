import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/color_pallet.dart';

class PerfilImage extends StatelessWidget {

  final String urlImage;
  final bool bVisualized;

  const PerfilImage({
    Key? key,
    required this.urlImage,
    this.bVisualized = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: PalletColor.blueFacebook,
      child: CircleAvatar(
        radius: bVisualized ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
