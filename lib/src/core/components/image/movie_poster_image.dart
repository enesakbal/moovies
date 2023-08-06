import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/gen/assets.gen.dart';
import '../../constants/imdb_image_constants.dart';
import '../../extension/text_theme_extension.dart';
import '../loading/base_loading.dart';

class MoviePosterImage extends StatelessWidget {
  const MoviePosterImage({super.key, required this.posterPath});

  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    if (posterPath == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.error.svg(height: 30.r, color: Colors.white),
          10.verticalSpace,
          Text(
            'There is no poster for this movie',
            textAlign: TextAlign.center,
            style: context.appTextTheme.boldWhite,
          ),
        ],
      );
    } else {
      return ExtendedImage.network(
        TMDBImageConstants.poster.replaceAll('{poster_path}', posterPath!),
        loadStateChanged: (state) {
          return switch (state.extendedImageLoadState) {
            LoadState.loading => const Center(child: BaseLoading()),
            LoadState.completed => ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                fit: BoxFit.fitHeight,
              ),
            LoadState.failed => InkWell(
                child: const Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Center(
                      child: Text('Fotoğraf yüklenemedi, yeniden yüklemek için\ntıklayın.'),
                    )
                  ],
                ),
                onTap: () => state.reLoadImage(),
              ),
          };
        },
      );
    }
  }
}
