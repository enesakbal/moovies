part of '../../view/home_view.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: Padding(
        padding: const EdgeInsets.all(.5).r,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 6, child: MoviePosterImage(posterPath: movie.posterPath)),
              Expanded(
                child: ColoredBox(
                  color: AppColors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              movie.title ?? '',
                              style: context.appTextTheme.boldDark,
                            ),
                          ),
                        ),
                        3.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Assets.icons.star.svg(color: Colors.yellow),
                            Text(movie.voteAverage?.toStringAsFixed(2) ?? '', style: context.appTextTheme.boldDark)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
