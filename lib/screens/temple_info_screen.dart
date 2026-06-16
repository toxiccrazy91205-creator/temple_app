import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class TempleInfoScreen extends StatefulWidget {
  const TempleInfoScreen({super.key});

  @override
  State<TempleInfoScreen> createState() => _TempleInfoScreenState();
}

class _TempleInfoScreenState extends State<TempleInfoScreen> {
  int? _tappedGalleryIndex;

  // ── Stitch image URLs ────────────────────────────────────────────────────
  static const String _heroUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAXuTC69HxHJVlaqz17oCWU8Y_TLh7Rmtlz2ZWVfFAadFMXuKJ0EckNF38nPvhjzf4_hwi0KswudnUWtlBrpEL0oqh9VurZhvNJ1oAy54Y9OEWLJOgek0U0A0bFwqD2p00I_zOib-j7brWHJY149MniWbTAdRqyucduXu-aUaRG5ACE8t4uNpF-md4m5OOlWbXmlpR3uufb4NSlGQeehgrgt4DBjfn7NNaa2KDBM0ldlxH3W0X8EWRFjHjhm8oMGvaADt7S7e6VZcUd';

  static const String _mapUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDMoYRh6k-cSM4ITryRdveicROyJcFw5JWtJYcAdqgS--H0lLJLeTaS5sEk2q54trkNK7IRiitiGSNXqKzsdXyzmNmaGPZEhR9MZ4h4Z3TnDayWPuhYEruZjpjQZYZvD5GGTNQXKl3gj5X79SxnV40iVCEVkXe26VBFfGpn94_Nz4u59fHgMnVHb5fTbDXEsARRolr5k6_3WG6-Mqjtnr5rzAe4w6ju7_DBcsJQbHAtgXSg8pxf78eJ419sTFt1_CPorNNL-rHO8UfB';

  static const List<Map<String, String>> _galleryItems = [
    {
      'url':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCOH0gXym4GRWPo2faO2dduV1fT3G00yjsElB-TUeHgOGP-a9643txSCuYSprxJwdC-Lf65ey523iPUmtVQMu03ZbQg_WCs6noWIAq4wzJrMEig8M0yPKaHJ9UezBsQqNviMEAUT9VVvnCz4KvuWMDXiZR01U2VyBOK809LMdT4-LjOKzbYknGKwkZ1To4JdYRcRoeZhDDt-f1ecTXTRMFTVR3svOEyGQpsAlB5zYywLBCtFLHzUZeqP21imtSHkgWYHqsKU3pqSiuH',
      'label': 'Hanuman Jayanti 2023',
      'span': 'full',
      'height': '192',
    },
    {
      'url':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC8ZRhCMnQhRSIVrDFBHFmqHM0DMqUwMq2skaAxZmr_07aW72UNh3ymqN8WuBe7bUy0oByjlWzeysYsdHqw37dIGJpTphamRA1PlPG2C6Kp2fb3GEpNt7cybZKU4EqZkLuVftZ9Zy1U2F3FCmUDOWJmEN8KSUTk_oMaXx5WlKMQxfNZCZ_92H46c5zaX58NfFLs5E-4cGfZYCp8FWib3c94c2VkCWrFNEEACw310XuCTkkAFvRfgWktEQ0I7kozM8WwUzdHDswqV7sf',
      'label': 'Stone Carvings',
      'span': 'half',
      'height': '160',
    },
    {
      'url':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCMkwtpHj8oA6hvQ0QLwUfcbbGzNMJ-7r9r-i1FbcnPDhqFQfFvPJCumuvm0qSVOR3cPwry030urA4fFey97b2CbdzUiU3yPlR6kJpePz3FyyraBvorjHLAhIFXTamA2FWN-knNQdM0ZHA5Jw3oIst6ZPONPB4fVgkrNHuHQsQEX9jCMv66atKaVmO9S359K6rqDOIkxzbXLUQ55zPe4GvSeqwtzVlrtf-3IA02yrUjj6Jakay54nitxCD0JaY5KsmsgGrjLdcQioL-',
      'label': 'Inner Sanctum',
      'span': 'half',
      'height': '160',
    },
    {
      'url':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAmBJBzZPZuEn1e8gjtzwvOJKKKEbTYRbtTs045vtKf4C7OT7xzUcEhqgKl_yRyxfIHpIuHMDOHHRJuGgLxkGzCQogz-H6Xi0LQKpq8ihkJQVvd1ieYOyiEciqro7nlWh8JgZouFbYvL11cS06m5zjx0NBO3dZm9-rwXjHHFaFkrtJvRYxIhQ7lk1j5E_j8vLVGeJls-IEQOXbJFwNM3b3MimcrUXpy3S7RZfBFSjQdBqeCajwNqrCLZrtMIouTc5XAZCQvsa7iPcXO',
      'label': 'Marigold Offerings',
      'span': 'half',
      'height': '128',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      body: CustomScrollView(
        slivers: [
          // ── SliverAppBar with Hero ────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: const Color(0xFFFFF8F5),
            elevation: 0,
            shadowColor: AppTheme.primarySaffron.withValues(alpha: 0.1),
            surfaceTintColor: Colors.transparent,
            iconTheme: const IconThemeData(color: AppTheme.primarySaffron),
            title: Text(
              'Shri Hanuman Mandir',
              style: GoogleFonts.sourceSerif4(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.primarySaffron,
              ),
            ),
            actions: [
              Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFFB77E),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuByxAuyGPhuuD4HS4_sKV1G2XtH1kGC9XN2laaQqdVklIrcqu6JJ3vrAMXlqlgOmPoy-Z_VgAZNy4Rx3JSjTDkxPQAG_yEgdO7aWeygxE1YQCCtxuk3X0-54X2XD0wiAAvYqPB013RaNy04BRnCiESA3Jg-hLRFEp2pDbpg8eY3T-28LtQ3sFvh9FZriLqF3SPm2MMKofsHcj-cgkCKdKhdUNA58etL18BvEyTdwbtjAacPAz--59lpgkUuh4NQI71P0nEbOhN82yu-',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.person_rounded,
                      color: AppTheme.primarySaffron,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Hero image
                  Image.network(
                    _heroUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF9933), Color(0xFF8B0000)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Icon(Icons.temple_hindu_rounded,
                          size: 80, color: Colors.white54),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.45, 1.0],
                        colors: [Colors.transparent, Color(0xFFFFF8F5)],
                      ),
                    ),
                  ),
                  // Badge
                  Positioned(
                    bottom: 16,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDCC3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'HISTORICAL SANCTUARY',
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF784619),
                          letterSpacing: 0.08,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Body content ─────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Our Sacred History ─────────────────────────────────────
                FadeInUp(
                  duration: const Duration(milliseconds: 600),
                  child: _buildSection(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Our Sacred History'),
                        const SizedBox(height: 14),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 15,
                              color: const Color(0xFF564334),
                              height: 1.7,
                            ),
                            children: const [
                              TextSpan(
                                  text:
                                      'Established in the early 18th century, Shri Hanuman Mandir has stood as a beacon of '),
                              TextSpan(
                                text: 'Shakti',
                                style: TextStyle(
                                    color: AppTheme.vermillion,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Bhakti',
                                style: TextStyle(
                                    color: AppTheme.primarySaffron,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                  text:
                                      ' for generations. Legend says the murti was discovered by a wandering sage who envisioned the Lord\'s presence in this very grove.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'The architecture seamlessly blends traditional North Indian styles with modern touches added during the restoration of 1998, ensuring the temple remains a peaceful sanctuary for modern devotees while preserving its ancient Vedic soul.',
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 15,
                            color: const Color(0xFF564334),
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Temple Timings ─────────────────────────────────────────
                FadeInUp(
                  duration: const Duration(milliseconds: 750),
                  child: _buildSection(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Temple Timings'),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTimingCard(
                                icon: Icons.wb_sunny_rounded,
                                label: 'Morning Session',
                                color: AppTheme.primarySaffron,
                                timings: const [
                                  ('Temple Opens', '5:00 AM'),
                                  ('Mangala Aarti', '5:30 AM'),
                                  ('Madhyana Pooja', '12:00 PM'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildTimingCard(
                                icon: Icons.nights_stay_rounded,
                                label: 'Evening Session',
                                color: AppTheme.vermillion,
                                timings: const [
                                  ('Evening Aarti', '6:30 PM'),
                                  ('Hanuman Chalisa', '7:30 PM'),
                                  ('Shayan Aarti', '9:00 PM'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Location ───────────────────────────────────────────────
                FadeInUp(
                  duration: const Duration(milliseconds: 900),
                  child: _buildSection(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _sectionTitle('Location'),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.directions_rounded,
                                  size: 16, color: AppTheme.vermillion),
                              label: Text(
                                'GET DIRECTIONS',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.vermillion,
                                  letterSpacing: 0.05,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              // Map image
                              SizedBox(
                                height: 180,
                                width: double.infinity,
                                child: Image.network(
                                  _mapUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    height: 180,
                                    color: const Color(0xFFFFF1E9),
                                    child: const Center(
                                      child: Icon(
                                        Icons.map_rounded,
                                        size: 60,
                                        color: AppTheme.primarySaffron,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Saffron overlay tint
                              Positioned.fill(
                                child: Container(
                                  color: AppTheme.primarySaffron
                                      .withValues(alpha: 0.08),
                                ),
                              ),
                              // Address tag
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.12),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.location_on_rounded,
                                          color: AppTheme.vermillion, size: 18),
                                      const SizedBox(width: 6),
                                      Text(
                                        '108 Bhakti Marg, Spiritual City',
                                        style: GoogleFonts.beVietnamPro(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF241912),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Darshan Gallery ────────────────────────────────────────
                FadeInUp(
                  duration: const Duration(milliseconds: 1050),
                  child: _buildSection(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Darshan Gallery'),
                        const SizedBox(height: 16),
                        _buildBentoGallery(),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Bento Gallery ─────────────────────────────────────────────────────────
  Widget _buildBentoGallery() {
    return Column(
      children: [
        // Full-width featured image
        _buildGalleryTile(
          url: _galleryItems[0]['url']!,
          label: _galleryItems[0]['label']!,
          index: 0,
          height: 192,
          fullWidth: true,
        ),
        const SizedBox(height: 10),
        // Row: two half-width
        Row(
          children: [
            Expanded(
              child: _buildGalleryTile(
                url: _galleryItems[1]['url']!,
                label: _galleryItems[1]['label']!,
                index: 1,
                height: 150,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildGalleryTile(
                url: _galleryItems[2]['url']!,
                label: _galleryItems[2]['label']!,
                index: 2,
                height: 150,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Row: one image + "view all" tile
        Row(
          children: [
            Expanded(
              child: _buildGalleryTile(
                url: _galleryItems[3]['url']!,
                label: _galleryItems[3]['label']!,
                index: 3,
                height: 120,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.primarySaffron.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.primarySaffron.withValues(alpha: 0.25),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.grid_view_rounded,
                          color: AppTheme.primarySaffron, size: 36),
                      const SizedBox(height: 6),
                      Text(
                        'View All (42)',
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primarySaffron,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGalleryTile({
    required String url,
    required String label,
    required int index,
    required double height,
    bool fullWidth = false,
  }) {
    final isTapped = _tappedGalleryIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _tappedGalleryIndex = index);
        Future.delayed(const Duration(milliseconds: 300),
            () => setState(() => _tappedGalleryIndex = null));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: isTapped
              ? [
                  BoxShadow(
                    color: AppTheme.primarySaffron.withValues(alpha: 0.35),
                    blurRadius: 16,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                scale: isTapped ? 1.06 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFFFF1E9),
                    child: const Icon(Icons.image_rounded,
                        color: AppTheme.primarySaffron, size: 36),
                  ),
                ),
              ),
              // Bottom label gradient
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 24, 12, 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xCC000000), Colors.transparent],
                    ),
                  ),
                  child: Text(
                    label,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.05,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Timing Card ───────────────────────────────────────────────────────────
  Widget _buildTimingCard({
    required IconData icon,
    required String label,
    required Color color,
    required List<(String, String)> timings,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1E9),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: color, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label.toUpperCase(),
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: color,
                    letterSpacing: 0.06,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...timings.asMap().entries.map((e) {
            final isLast = e.key == timings.length - 1;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        e.value.$1,
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 13,
                          color: const Color(0xFF564334),
                        ),
                      ),
                    ),
                    Text(
                      e.value.$2,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF241912),
                      ),
                    ),
                  ],
                ),
                if (!isLast) ...[
                  const SizedBox(height: 6),
                  Divider(
                      height: 1,
                      color: const Color(0xFFDDC1AE).withValues(alpha: 0.6)),
                  const SizedBox(height: 6),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────
  Widget _buildSection({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
      child: child,
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.sourceSerif4(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppTheme.primarySaffron,
      ),
    );
  }
}
