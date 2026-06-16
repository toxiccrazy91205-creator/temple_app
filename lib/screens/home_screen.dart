import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();
    _ytController = YoutubePlayerController.fromVideoId(
      videoId: 'SrDCZCWmz1U',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );
  }

  @override
  void dispose() {
    _ytController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shri Hanuman Mandir'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Daily Darshan Card (Now Live Aarti)
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: _buildLiveAartiCard(context),
              ),
              const SizedBox(height: 32),

              // Quick Actions
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickActionItem(
                      context,
                      icon: Icons.volunteer_activism_rounded,
                      label: 'Offer Pooja',
                      onTap: () => context.go('/pooja'),
                    ),
                    _buildQuickActionItem(
                      context,
                      icon: Icons.menu_book_rounded,
                      label: 'Chant Chalisa',
                      onTap: () => context.go('/chants'),
                    ),
                    _buildQuickActionItem(
                      context,
                      icon: Icons.monetization_on_rounded,
                      label: 'Donate',
                      onTap: () => context.go('/pooja'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Word of the Day
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: _buildWordOfTheDayCard(context),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLiveAartiCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.warmWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primarySaffron.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Video Player Area
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _ytController,
              ),
            ),
            // Text Content Below Video
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.vermillion,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Text(
                      'Live Darshan',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aarti',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: AppTheme.deepCharcoal,
                          fontSize: 28,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Join thousands of devotees anytime.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.deepCharcoal.withValues(alpha: 0.7),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primarySaffron.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 32,
              color: AppTheme.primarySaffron,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppTheme.deepCharcoal,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordOfTheDayCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.wb_sunny_rounded, color: AppTheme.marigoldGold),
                const SizedBox(width: 8),
                Text(
                  'Verse of the Day',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'बुद्धिहीन तनु जानिके, सुमिरौ पवन-कुमार।\nबल बुधि बिद्या देहु मोहिं, हरहु कलेस बिकार॥',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primarySaffron,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Realizing my own ignorance, I meditate on you, O Son of the Wind. Bestow upon me strength, wisdom, and knowledge, and remove all my afflictions and impurities.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
