import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  // Quick chant playing state
  int? _playingChantIndex;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _glowAnimation = Tween<double>(begin: 0.2, end: 0.6).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      body: Stack(
        children: [
          // Main scrollable content
          CustomScrollView(
            slivers: [
              // ─── Top App Bar ──────────────────────────────────────────────
              SliverAppBar(
                pinned: true,
                backgroundColor: const Color(0xFFFFF8F5),
                elevation: 0,
                shadowColor: AppTheme.primarySaffron.withValues(alpha: 0.08),
                surfaceTintColor: Colors.transparent,
                toolbarHeight: 56,
                title: Text(
                  'Shri Hanuman Mandir',
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primarySaffron,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.menu_rounded,
                      color: AppTheme.primarySaffron),
                  onPressed: () {},
                ),
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.primarySaffron.withValues(alpha: 0.4),
                          width: 2,
                        ),
                        color: const Color(0xFFFFDCC3),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: AppTheme.primarySaffron,
                      ),
                    ),
                  ),
                ],
              ),

              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─── Hero: Daily Darshan ──────────────────────────────
                    FadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                        child: _buildDarshanHero(),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ─── Daily Sankalp ────────────────────────────────────
                    FadeInUp(
                      duration: const Duration(milliseconds: 900),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildSankalpCard(context),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ─── Upcoming Events ──────────────────────────────────
                    FadeInUp(
                      duration: const Duration(milliseconds: 1100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildUpcomingEvents(context),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ─── Quick Chants ─────────────────────────────────────
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: _buildQuickChants(context),
                    ),

                    // Bottom padding for nav bar
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),

          // ─── FAB: Offer Prayer ─────────────────────────────────────────
          Positioned(
            bottom: 88,
            right: 24,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: _buildFab(context),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Daily Darshan Hero
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildDarshanHero() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primarySaffron
                    .withValues(alpha: _glowAnimation.value),
                blurRadius: 24,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Hero Image
            AspectRatio(
              aspectRatio: 4 / 5,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFF9933), Color(0xFF8B0000)],
                  ),
                ),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDkmI7raUBGir2ngJMPeZERz1BVp4RxzBjsGIXEQMqXtmIkQiwEmg34_f07cV5WYzWCStlugAynnTDV2zM0l0WRCox7jMLk3VLAoNCBt6hLpRkX5FBmHLcWY0y6Y-X2Jq_NVpE0kOAcj_TLqaq8HLBFn4kUrwn_QhX7Z1tzH5dWCyeDk26O3da5E1FhJN7_qIvWGpCbhqGUAfGTqzsmgqLXQZcZqq0kBRmWsnsSrzEU2E9DF_YlPpy4XIzMVRSGRYJ64zRAKu77vMVR',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (_, _, _) => Container(
                    color: const Color(0xFFFF9933),
                    child: const Icon(
                      Icons.temple_hindu_rounded,
                      size: 120,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            // Gradient overlay
            AspectRatio(
              aspectRatio: 4 / 5,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.4, 1.0],
                    colors: [Colors.transparent, Color(0xCC000000)],
                  ),
                ),
              ),
            ),
            // Share button (top-right)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3), width: 1),
                ),
                child: IconButton(
                  icon: const Icon(Icons.share_rounded,
                      color: Colors.white, size: 22),
                  onPressed: () {},
                ),
              ),
            ),
            // Bottom text
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8B00),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'Daily Darshan',
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF613200),
                          letterSpacing: 0.05,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mangalwar Shringar\nDarshan',
                      style: GoogleFonts.sourceSerif4(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Updated today at 6:15 AM',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.8),
                        letterSpacing: 0.05,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Daily Sankalp Card
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildSankalpCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF9933), Color(0xFFBB0022)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.vermillion.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative temple icon
          Positioned(
            right: -16,
            bottom: -16,
            child: Icon(
              Icons.temple_hindu_rounded,
              size: 120,
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Sankalp',
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '"Today, I resolve to speak truth and act with courage and humility, following the path of Hanuman ji."',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.92),
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.vermillion,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.volunteer_activism_rounded, size: 18),
                  label: Text(
                    'Take Your Sankalp',
                    style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Upcoming Events Bento Grid
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildUpcomingEvents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Upcoming Events',
              style: GoogleFonts.sourceSerif4(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppTheme.primarySaffron,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View Calendar',
                style: GoogleFonts.beVietnamPro(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primarySaffron,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Full-width featured event
        _buildGlassCard(
          child: Row(
            children: [
              // Date badge
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDCC3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '23',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primarySaffron,
                      ),
                    ),
                    Text(
                      'APR',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primarySaffron,
                        letterSpacing: 0.05,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hanuman Jayanti',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF241912),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Grand Mahaprasad & Akhand Path',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF564334),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // 2-column bento
        Row(
          children: [
            Expanded(
              child: _buildGlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.event_note_rounded,
                        color: AppTheme.vermillion, size: 28),
                    const SizedBox(height: 8),
                    Text(
                      'Shani Shanti',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF241912),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Every Sat, 5 PM',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF564334),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildGlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.music_note_rounded,
                        color: Color(0xFFBE003D), size: 28),
                    const SizedBox(height: 8),
                    Text(
                      'Sundarkand',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF241912),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Every Tue, 7 PM',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF564334),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primarySaffron.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primarySaffron.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Quick Chants horizontal list
  // ─────────────────────────────────────────────────────────────────────────
  final List<Map<String, dynamic>> _chants = [
    {'label': 'Chalisa', 'route': '/chants'},
    {'label': 'Mantra', 'route': '/chants'},
    {'label': 'Aarti', 'route': '/chants'},
    {'label': 'Ashtak', 'route': '/chants'},
  ];

  Widget _buildQuickChants(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Quick Chants',
            style: GoogleFonts.sourceSerif4(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppTheme.primarySaffron,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _chants.length + 1,
            itemBuilder: (context, index) {
              if (index == _chants.length) {
                // Explore button
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () => context.go('/chants'),
                    child: Column(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFDBC2B0),
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: const Icon(Icons.add_rounded,
                              color: Color(0xFFDBC2B0), size: 28),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Explore',
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8A7362),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final chant = _chants[index];
              final isPlaying = _playingChantIndex == index;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _playingChantIndex = isPlaying ? null : index;
                    });
                  },
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isPlaying
                              ? const Color(0xFFFFDCC3)
                              : const Color(0xFFFFF8F5),
                          border: Border.all(
                            color: isPlaying
                                ? AppTheme.primarySaffron
                                : const Color(0xFFFFDCC3),
                            width: 2,
                          ),
                          boxShadow: isPlaying
                              ? [
                                  BoxShadow(
                                    color: AppTheme.primarySaffron
                                        .withValues(alpha: 0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: AppTheme.primarySaffron,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        chant['label'] as String,
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF564334),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // FAB
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFab(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppTheme.vermillion,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.vermillion.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_active_rounded,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
