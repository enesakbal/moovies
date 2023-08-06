import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/gen/assets.gen.dart';
import '../../config/gen/colors.gen.dart';
import '../../core/components/image/movie_poster_image.dart';
import '../../core/components/loading/base_loading.dart';
import '../../core/components/search_bar/custom_search_bar.dart';
import '../../core/extension/text_theme_extension.dart';
import '../../core/extension/text_validation_extension.dart';
import '../../domain/entities/movie/movie.dart';
import '../bloc/search_movie/search_movie_bloc.dart';

part '../_widgets/home/movie_card.dart';

@RoutePage()
class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBarController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    final scrollController = useScrollController();
    useEffect(
      () {
        void scrollListener() {
          if (scrollController.position.maxScrollExtent - scrollController.offset == 0) {
            context.read<SearchMovieBloc>().add(OnFetchAgainSearchMovieEvent(searchBarController.text));
          }
        }

        scrollController.addListener(scrollListener);
        return () {
          scrollController.removeListener(scrollListener);
        };
      },
      [scrollController],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moovies'),
        actions: [
          IconButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://github.com/enesakbal');
              await launchUrl(url);
            },
            icon: Assets.icons.code.svg(
              color: Colors.white,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.r),
          child: Padding(
            padding: const EdgeInsets.all(12).r,
            child: Form(
              key: formKey,
              child: CustomSearchBar(
                controller: searchBarController,
                validator: (value) => value?.isValidSearchText,
                onChanged: (data) {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<SearchMovieBloc>().add(OnSearchMovieEvent(data));
                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchMovieBloc, SearchMovieState>(
        builder: (context, searchState) {
          return switch (searchState) {
            SearchMovieInitial() => Center(
                child: Text(
                  'Start searching',
                  style: context.appTextTheme.boldWhite.copyWith(fontSize: 16.sp),
                ),
              ),
            SearchMovieLoading() => const Center(child: BaseLoading()),
            SearchMovieSuccess() => _SuccessBody(scrollController: scrollController, successState: searchState),
            SearchMovieEmpty() => Center(child: Text(searchState.message, style: context.appTextTheme.boldWhite)),
            SearchMovieError() => Center(child: Text(searchState.message, style: context.appTextTheme.boldWhite)),
          };
        },
      ),
    );
  }
}

class _SuccessBody extends StatelessWidget {
  const _SuccessBody({
    required this.scrollController,
    required this.successState,
  });

  final ScrollController scrollController;
  final SearchMovieSuccess successState;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8).r,
          itemCount: successState.movieList.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 18,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return MovieCard(movie: successState.movieList[index]);
          },
        ),
        if (!context.watch<SearchMovieBloc>().isCompleted) ...[
          30.verticalSpace,
          const Center(child: BaseLoading()),
          30.verticalSpace,
        ]
      ],
    );
  }
}
