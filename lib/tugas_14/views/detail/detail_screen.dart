import 'package:belajar_flutter/constant/api_app_color.dart';
import 'package:belajar_flutter/tugas_14/models/anime_model.dart'
    as anime_models;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final anime_models.GetAnime anime;

  const DetailScreen({super.key, required this.anime});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Uri? _trailerUri() {
    final embedUrl = widget.anime.trailer?.embedUrl;
    final trailerUrl = widget.anime.trailer?.url?.toString();

    if (embedUrl != null && embedUrl.trim().isNotEmpty) {
      return Uri.tryParse(embedUrl);
    }

    if (trailerUrl != null &&
        trailerUrl.trim().isNotEmpty &&
        trailerUrl.toLowerCase() != 'null') {
      return Uri.tryParse(trailerUrl);
    }

    return null;
  }

  String _valueOrDash(dynamic value) {
    if (value == null) return '-';
    final text = value.toString().trim();
    if (text.isEmpty || text.toLowerCase() == 'null') return '-';
    return text;
  }

  String _formatDate(dynamic value) {
    if (value == null) return '-';
    final raw = value.toString().trim();
    if (raw.isEmpty || raw.toLowerCase() == 'null') return '-';

    final parsed = DateTime.tryParse(raw);
    if (parsed == null) {
      final dateOnly = raw.split('T').first;
      return dateOnly.isEmpty ? raw : dateOnly;
    }

    final mm = parsed.month.toString().padLeft(2, '0');
    final dd = parsed.day.toString().padLeft(2, '0');
    return '${parsed.year}-$mm-$dd';
  }

  String _cleanText(dynamic value) {
    if (value == null) return '';
    final text = value.toString().trim();
    if (text.isEmpty || text.toLowerCase() == 'null') return '';
    return text;
  }

  String _joinedNames(List<anime_models.Demographic>? items) {
    if (items == null || items.isEmpty) return '-';
    return items
        .map((e) => e.name)
        .where((e) => e != null && e.trim().isNotEmpty)
        .cast<String>()
        .join(', ');
  }

  String _joinedDynamicList(List<dynamic>? items) {
    if (items == null || items.isEmpty) return '-';
    final values = items
        .map((e) {
          if (e is Map && e['name'] != null) return e['name'].toString();
          return e.toString();
        })
        .where((e) => e.trim().isNotEmpty && e.toLowerCase() != 'null')
        .toList();
    if (values.isEmpty) return '-';
    return values.join(', ');
  }

  Future<void> _openTrailer() async {
    final uri = _trailerUri();
    if (uri == null) return;

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final anime = widget.anime;
    final heroImage =
        anime.images?['jpg']?.largeImageUrl ?? anime.images?['jpg']?.imageUrl;
    final title =
        anime.title ?? anime.titleEnglish ?? anime.titleJapanese ?? '-';
    final synopsis = _cleanText(anime.synopsis);
    final background = _cleanText(anime.background);
    final trailerUri = _trailerUri();
    final titleSynonyms =
        anime.titleSynonyms == null || anime.titleSynonyms!.isEmpty
        ? '-'
        : anime.titleSynonyms!.join(', ');

    return Scaffold(
      backgroundColor: ApiColor.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 430,
            pinned: true,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  if (heroImage != null && heroImage.isNotEmpty)
                    Image.network(heroImage, fit: BoxFit.cover)
                  else
                    Container(color: ApiColor.surface),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x22000000),
                          Color(0x99000000),
                          ApiColor.background,
                        ],
                        stops: [0.0, 0.6, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: ApiColor.textPrimary,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        ChipWrap(
                          values: [
                            _valueOrDash(anime.type),
                            _valueOrDash(anime.status),
                            _valueOrDash(anime.year),
                            'Score ${_valueOrDash(anime.score)}',
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Trailer'),
                  if (trailerUri != null)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _openTrailer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ApiColor.primary,
                          foregroundColor: ApiColor.textPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text('Play Trailer'),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: ApiColor.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Trailer tidak tersedia untuk anime ini.',
                        style: TextStyle(color: ApiColor.textSecondary),
                      ),
                    ),
                  const SectionTitle(title: 'Overview'),
                  InfoRow(
                    label: 'Synopsis',
                    value: synopsis.isEmpty ? '-' : synopsis,
                  ),
                  InfoRow(label: 'Title', value: _valueOrDash(title)),
                  InfoRow(
                    label: 'Japanese',
                    value: _valueOrDash(anime.titleJapanese),
                  ),
                  InfoRow(
                    label: 'English',
                    value: _valueOrDash(anime.titleEnglish),
                  ),
                  InfoRow(
                    label: 'Background',
                    value: background.isEmpty ? '-' : background,
                  ),

                  const SectionTitle(title: 'Quick Facts'),
                  InfoRow(label: 'Type', value: _valueOrDash(anime.type)),
                  InfoRow(label: 'Year', value: _valueOrDash(anime.year)),
                  InfoRow(label: 'Season', value: _valueOrDash(anime.season)),
                  InfoRow(
                    label: 'Aired',
                    value: _valueOrDash(anime.aired?.string),
                  ),
                  InfoRow(label: 'Source', value: _valueOrDash(anime.source)),
                  InfoRow(
                    label: 'Episodes',
                    value: _valueOrDash(anime.episodes),
                  ),
                  InfoRow(label: 'Status', value: _valueOrDash(anime.status)),
                  InfoRow(label: 'Airing', value: _valueOrDash(anime.airing)),
                  InfoRow(
                    label: 'Duration',
                    value: _valueOrDash(anime.duration),
                  ),
                  InfoRow(label: 'Rating', value: _valueOrDash(anime.rating)),
                  InfoRow(label: 'Score', value: _valueOrDash(anime.score)),
                  InfoRow(label: 'Rank', value: _valueOrDash(anime.rank)),
                  InfoRow(
                    label: 'Popularity',
                    value: _valueOrDash(anime.popularity),
                  ),
                  InfoRow(label: 'Members', value: _valueOrDash(anime.members)),
                  InfoRow(
                    label: 'Favorites',
                    value: _valueOrDash(anime.favorites),
                  ),

                  const SectionTitle(title: 'Production'),
                  InfoRow(
                    label: 'Producers',
                    value: _joinedNames(anime.producers),
                  ),
                  InfoRow(
                    label: 'Licensors',
                    value: _joinedNames(anime.licensors),
                  ),
                  InfoRow(label: 'Studios', value: _joinedNames(anime.studios)),

                  const SectionTitle(title: 'Genres & Themes'),
                  InfoRow(label: 'Genres', value: _joinedNames(anime.genres)),
                  InfoRow(
                    label: 'Explicit Genres',
                    value: _joinedDynamicList(anime.explicitGenres),
                  ),
                  InfoRow(label: 'Themes', value: _joinedNames(anime.themes)),
                  InfoRow(
                    label: 'Demographics',
                    value: _joinedNames(anime.demographics),
                  ),

                  const SectionTitle(title: 'Advanced Info'),
                  Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                      collapsedBackgroundColor: ApiColor.surface,
                      backgroundColor: ApiColor.surface,
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      iconColor: ApiColor.textPrimary,
                      collapsedIconColor: ApiColor.textPrimary,
                      title: const Text(
                        'Tap untuk lihat semua data API',
                        style: TextStyle(
                          color: ApiColor.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      children: [
                        InfoRow(
                          label: 'MAL ID',
                          value: _valueOrDash(anime.malId),
                        ),
                        InfoRow(
                          label: 'Approved',
                          value: _valueOrDash(anime.approved),
                        ),
                        InfoRow(
                          label: 'Scored By',
                          value: _valueOrDash(anime.scoredBy),
                        ),
                        InfoRow(
                          label: 'Background',
                          value: background.isEmpty ? '-' : background,
                        ),
                        InfoRow(
                          label: 'From',
                          value: _formatDate(anime.aired?.from),
                        ),
                        InfoRow(
                          label: 'To',
                          value: _formatDate(anime.aired?.to),
                        ),
                        InfoRow(
                          label: 'Day',
                          value: _valueOrDash(anime.broadcast?.day),
                        ),
                        InfoRow(
                          label: 'Time',
                          value: _valueOrDash(anime.broadcast?.time),
                        ),
                        InfoRow(
                          label: 'Timezone',
                          value: _valueOrDash(anime.broadcast?.timezone),
                        ),
                        InfoRow(
                          label: 'Broadcast String',
                          value: _valueOrDash(anime.broadcast?.string),
                        ),
                        InfoRow(label: 'URL', value: _valueOrDash(anime.url)),
                        InfoRow(
                          label: 'Trailer URL',
                          value: _valueOrDash(anime.trailer?.url),
                        ),
                        InfoRow(
                          label: 'Trailer Embed URL',
                          value: _valueOrDash(anime.trailer?.embedUrl),
                        ),
                        InfoRow(
                          label: 'Youtube ID',
                          value: _valueOrDash(anime.trailer?.youtubeId),
                        ),
                        InfoRow(
                          label: 'Image URL',
                          value: _valueOrDash(anime.images?['jpg']?.imageUrl),
                        ),
                        InfoRow(
                          label: 'Large Image URL',
                          value: _valueOrDash(
                            anime.images?['jpg']?.largeImageUrl,
                          ),
                        ),
                        InfoRow(
                          label: 'Small Image URL',
                          value: _valueOrDash(
                            anime.images?['jpg']?.smallImageUrl,
                          ),
                        ),
                        InfoRow(label: 'Title Synonyms', value: titleSynonyms),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: ApiColor.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                color: ApiColor.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: ApiColor.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}

class ChipWrap extends StatelessWidget {
  final List<String> values;

  const ChipWrap({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    final data = values.where((e) => e.trim().isNotEmpty).toList();
    if (data.isEmpty) {
      return const Text('-', style: TextStyle(color: ApiColor.textSecondary));
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: data
          .map(
            (text) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: ApiColor.surface,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                text,
                style: const TextStyle(color: ApiColor.textPrimary),
              ),
            ),
          )
          .toList(),
    );
  }
}
