import 'dart:async';

import 'package:belajar_flutter/constant/api_app_color.dart';
import 'package:belajar_flutter/tugas_14/api/get_anime.dart';
import 'package:belajar_flutter/tugas_14/models/anime_model.dart';
import 'package:belajar_flutter/tugas_14/views/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<GetAnime>> _animeFuture;
  late final PageController _featuredPageController;
  Timer? _featuredTimer;
  int _featuredCount = 0;
  int _currentFeaturedIndex = 0;

  static const double _featuredHeight = 660;

  // Anime dengan skor tertinggi
  List<GetAnime> _getTopRatedAnime(List<GetAnime> animeList) {
    final sortedList = List<GetAnime>.from(animeList)
      ..sort((a, b) => (b.score ?? 0).compareTo(a.score ?? 0));
    return sortedList;
  }

  // Anime paling populer
  List<GetAnime> _getPopularAnime(List<GetAnime> animeList) {
    final sortedList = List<GetAnime>.from(animeList)
      ..sort((a, b) => (b.popularity ?? 0).compareTo(a.popularity ?? 0));
    return sortedList;
  }

  // Filter anime berdasarkan genre
  List<GetAnime> _getAnimeByGenre(List<GetAnime> animeList, String genreName) {
    return animeList
        .where(
          (anime) =>
              anime.genres?.any(
                (genre) => genre.name?.toLowerCase() == genreName.toLowerCase(),
              ) ??
              false,
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _animeFuture = getUser();
    _featuredPageController = PageController();
  }

  void _setupFeaturedAutoScroll(int itemCount) {
    if (_featuredCount == itemCount) return;

    _featuredCount = itemCount;
    _currentFeaturedIndex = 0;
    _featuredTimer?.cancel();

    if (itemCount <= 1) return;

    _featuredTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted || !_featuredPageController.hasClients) return;
      _currentFeaturedIndex = (_currentFeaturedIndex + 1) % itemCount;
      _featuredPageController.animateToPage(
        _currentFeaturedIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _featuredTimer?.cancel();
    _featuredPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApiColor.background,
      body: FutureBuilder<List<GetAnime>>(
        future: _animeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: ApiColor.primary),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Gagal memuat data',
                style: TextStyle(color: ApiColor.textPrimary),
              ),
            );
          }

          final data = snapshot.data ?? [];
          final topRated = _getTopRatedAnime(data);
          final featuredTopFive = topRated.take(5).toList();
          _setupFeaturedAutoScroll(featuredTopFive.length);
          final popular = _getPopularAnime(data);
          final action = _getAnimeByGenre(data, 'action');
          final adventure = _getAnimeByGenre(data, 'adventure');

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: _featuredHeight,
                pinned: true,
                backgroundColor: ApiColor.appBar,
                systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Colors.transparent,
                ),
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'NimeShow',
                  style: TextStyle(
                    color: ApiColor.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: ApiColor.primary,
                      child: const Icon(
                        Icons.person,
                        color: ApiColor.textPrimary,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView.builder(
                        controller: _featuredPageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: featuredTopFive.length,
                        onPageChanged: (index) {
                          if (!mounted) return;
                          setState(() {
                            _currentFeaturedIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final featuredAnime = featuredTopFive[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(anime: featuredAnime),
                                ),
                              );
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  featuredAnime.images?['jpg']?.largeImageUrl ??
                                      featuredAnime.images?['jpg']?.imageUrl ??
                                      '',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          featuredAnime.title ?? '-',
                                          style: const TextStyle(
                                            color: ApiColor.textPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        featuredAnime.aired?.prop?.from?.year
                                                ?.toString() ??
                                            '-',
                                        style: const TextStyle(
                                          color: ApiColor.textPrimary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 6),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 36,
                                        ),
                                        child: Text(
                                          featuredAnime.synopsis ?? '-',
                                          style: const TextStyle(
                                            color: ApiColor.textSecondary,
                                            fontSize: 12,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(featuredTopFive.length, (
                            dotIndex,
                          ) {
                            final isActive = dotIndex == _currentFeaturedIndex;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: isActive ? 18 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? ApiColor.textPrimary
                                    : ApiColor.textSecondary,
                                borderRadius: BorderRadius.circular(999),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Popular Now 🔥',
                              style: TextStyle(
                                color: ApiColor.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 228,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: popular
                                    .take(10)
                                    .map(
                                      (anime) => AnimeHorizontalItem(
                                        anime: anime,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(anime: anime),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Top Rated ⭐',
                              style: TextStyle(
                                color: ApiColor.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 228,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: topRated
                                    .take(10)
                                    .map(
                                      (anime) => AnimeHorizontalItem(
                                        anime: anime,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(anime: anime),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Action 💥',
                              style: TextStyle(
                                color: ApiColor.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 228,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: action
                                    .take(10)
                                    .map(
                                      (anime) => AnimeHorizontalItem(
                                        anime: anime,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(anime: anime),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Adventure 🏃',
                              style: TextStyle(
                                color: ApiColor.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 228,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: adventure
                                    .take(10)
                                    .map(
                                      (anime) => AnimeHorizontalItem(
                                        anime: anime,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(anime: anime),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnimeHorizontalItem extends StatelessWidget {
  final GetAnime anime;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final double fontSize;

  const AnimeHorizontalItem({
    super.key,
    required this.anime,
    this.onTap,
    this.width = 120,
    this.height = 180,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Image.network(
                    anime.images?['jpg']?.imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Text(
                  anime.title ?? '-',
                  style: TextStyle(
                    color: ApiColor.textPrimary,
                    fontSize: fontSize,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
