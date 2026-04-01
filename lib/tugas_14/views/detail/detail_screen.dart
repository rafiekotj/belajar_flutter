import 'dart:ui';

import 'package:belajar_flutter/constant/api_app_color.dart';
import 'package:belajar_flutter/tugas_14/models/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final GetAnime anime;

  const DetailScreen({super.key, required this.anime});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? _convertEmbedToWatchUrl(String? rawUrl) {
    if (rawUrl == null) return null;
    final raw = rawUrl.trim();
    if (raw.isEmpty || raw.toLowerCase() == 'null') return null;

    final parsed = Uri.tryParse(raw);
    if (parsed == null) return null;

    final host = parsed.host.toLowerCase();
    if (!host.contains('youtube.com') &&
        !host.contains('youtube-nocookie.com')) {
      return null;
    }

    final segments = parsed.pathSegments;
    final embedIndex = segments.indexOf('embed');
    if (embedIndex != -1 && embedIndex + 1 < segments.length) {
      final id = segments[embedIndex + 1].trim();
      if (id.isNotEmpty) {
        return _youtubeWatchUri(id).toString();
      }
    }

    if (segments.length >= 2 && segments.first == 'v') {
      final id = segments[1].trim();
      if (id.isNotEmpty) {
        return _youtubeWatchUri(id).toString();
      }
    }

    return null;
  }

  Uri _youtubeWatchUri(String id) {
    return Uri.https('www.youtube.com', '/watch', {'v': id});
  }

  Uri? _trailerUri() {
    final embedUrl = widget.anime.trailer?.embedUrl;
    final trailerUrl = widget.anime.trailer?.url?.toString();

    final normalizedEmbed = _convertEmbedToWatchUrl(embedUrl);
    if (normalizedEmbed != null) {
      return Uri.tryParse(normalizedEmbed);
    }

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

  String _cleanText(dynamic value) {
    if (value == null) return '';
    final text = value.toString().trim();
    if (text.isEmpty || text.toLowerCase() == 'null') return '';
    return text;
  }

  String _scoreSummary() {
    final score = _valueOrDash(widget.anime.score);
    final scoredBy = _valueOrDash(widget.anime.scoredBy);

    if (score == '-') return '-';
    if (scoredBy == '-') return score;
    return '$score ($scoredBy)';
  }

  String _joinedNames(List<Demographic>? items) {
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

    return Scaffold(
      backgroundColor: ApiColor.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 430,
            pinned: true,
            backgroundColor: ApiColor.background,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            leadingWidth: 56,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: Colors.white,
                  splashRadius: 20,
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
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
                            '⭐ ${_scoreSummary()}',
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
                  const SectionTitle(
                    title: 'Trailer',
                    icon: Icons.ondemand_video_rounded,
                  ),
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
                        icon: const Icon(Icons.open_in_new_rounded),
                        label: const Text('Buka di YouTube'),
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
                  const SectionTitle(
                    title: 'Overview',
                    icon: Icons.auto_awesome_rounded,
                  ),
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

                  const SectionTitle(
                    title: 'Details',
                    icon: Icons.bolt_rounded,
                  ),
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
                  InfoRow(label: 'Score', value: _scoreSummary()),
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

                  const SectionTitle(
                    title: 'Production',
                    icon: Icons.apartment_rounded,
                  ),
                  InfoRow(
                    label: 'Producers',
                    value: _joinedNames(anime.producers),
                  ),
                  InfoRow(
                    label: 'Licensors',
                    value: _joinedNames(anime.licensors),
                  ),
                  InfoRow(label: 'Studios', value: _joinedNames(anime.studios)),

                  const SectionTitle(
                    title: 'Genres & Themes',
                    icon: Icons.style_rounded,
                  ),
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
  final IconData icon;

  const SectionTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ApiColor.primary.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: ApiColor.primary, size: 18),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: ApiColor.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
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
      spacing: 4,
      runSpacing: 8,
      children: data
          .map(
            (text) => ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.22),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: ApiColor.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
