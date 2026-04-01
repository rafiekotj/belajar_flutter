import 'package:belajar_flutter/constant/api_app_color.dart';
import 'package:belajar_flutter/tugas_14/api/get_anime.dart';
import 'package:belajar_flutter/tugas_14/models/anime_model.dart';
import 'package:belajar_flutter/tugas_14/views/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<GetAnime>> _animeFuture;
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _animeFuture = getUser();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<GetAnime> _filterAnime(List<GetAnime> data) {
    final keyword = _query.trim().toLowerCase();
    if (keyword.isEmpty) return data;

    return data.where((anime) {
      final titles = [anime.title, anime.titleEnglish, anime.titleJapanese];
      return titles.any(
        (title) => (title ?? '').toLowerCase().contains(keyword),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApiColor.background,
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            color: ApiColor.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: ApiColor.textPrimary,
        forceMaterialTransparency: true,
        elevation: 0,
        centerTitle: true,
      ),
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
          final results = _filterAnime(data);
          final isQueryEmpty = _query.trim().isEmpty;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 6, 14, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: ApiColor.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                    style: const TextStyle(
                      color: ApiColor.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: ApiColor.primary,
                    decoration: InputDecoration(
                      hintText: 'Cari judul anime favoritmu...',
                      hintStyle: const TextStyle(color: ApiColor.textSecondary),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: ApiColor.primary,
                      ),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _query = '';
                                });
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                                color: ApiColor.textSecondary,
                              ),
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                    ),
                  ),
                ),
              ),
              if (!isQueryEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                  child: Row(
                    children: [
                      Text(
                        '${results.length} hasil ditemukan',
                        style: const TextStyle(
                          color: ApiColor.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: isQueryEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 92,
                              height: 92,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ApiColor.surface,
                                border: Border.all(
                                  color: ApiColor.primary,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.search_rounded,
                                color: ApiColor.primary,
                                size: 44,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Cari judul anime',
                              style: TextStyle(
                                color: ApiColor.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    : results.isEmpty
                    ? const Center(
                        child: Text(
                          'Anime tidak ditemukan',
                          style: TextStyle(color: ApiColor.textSecondary),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.fromLTRB(12, 6, 12, 16),
                        itemCount: results.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 14,
                              childAspectRatio: 0.64,
                            ),
                        itemBuilder: (context, index) {
                          final anime = results[index];
                          final imageUrl =
                              anime.images?['jpg']?.largeImageUrl ??
                              anime.images?['jpg']?.imageUrl;
                          final title =
                              anime.title ??
                              anime.titleEnglish ??
                              anime.titleJapanese ??
                              '-';
                          final score = anime.score == null
                              ? '-'
                              : anime.score!.toStringAsFixed(1);
                          final year = anime.year?.toString() ?? '-';

                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(anime: anime),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(14),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: ApiColor.surface,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.06),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                  top: Radius.circular(14),
                                                ),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child:
                                                  imageUrl == null ||
                                                      imageUrl.isEmpty
                                                  ? Container(
                                                      color:
                                                          ApiColor.background,
                                                    )
                                                  : Image.network(
                                                      imageUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withValues(
                                                  alpha: 0.55,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Text(
                                                '⭐ $score',
                                                style: const TextStyle(
                                                  color: ApiColor.textPrimary,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        10,
                                        8,
                                        10,
                                        4,
                                      ),
                                      child: Text(
                                        title,
                                        style: const TextStyle(
                                          color: ApiColor.textPrimary,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        10,
                                        0,
                                        10,
                                        10,
                                      ),
                                      child: Text(
                                        year,
                                        style: const TextStyle(
                                          color: ApiColor.textSecondary,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
