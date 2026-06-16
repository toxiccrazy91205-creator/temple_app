import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Wait for 3 seconds, then go to home
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String imageUrl =
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDkmI7raUBGir2ngJMPeZERz1BVp4RxzBjsGIXEQMqXtmIkQiwEmg34_f07cV5WYzWCStlugAynnTDV2zM0l0WRCox7jMLk3VLAoNCBt6hLpRkX5FBmHLcWY0y6Y-X2Jq_NVpE0kOAcj_TLqaq8HLBFn4kUrwn_QhX7Z1tzH5dWCyeDk26O3da5E1FhJN7_qIvWGpCbhqGUAfGTqzsmgqLXQZcZqq0kBRmWsnsSrzEU2E9DF_YlPpy4XIzMVRSGRYJ64zRAKu77vMVR';

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full screen background image
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: AppTheme.warmWhite,
              child: const Center(
                child: Icon(
                  Icons.temple_hindu_rounded,
                  size: 120,
                  color: AppTheme.primarySaffron,
                ),
              ),
            ),
          ),
          // Gradient overlay for visual aesthetics and text readability
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.45, 1.0],
                colors: [
                  Colors.black45,
                  Colors.black26,
                  Colors.black87,
                ],
              ),
            ),
          ),
          // Center content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 32),
                // Main branding
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZoomIn(
                      duration: const Duration(milliseconds: 1200),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.primarySaffron.withValues(alpha: 0.6),
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            imageUrl,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        'Shri Hanuman Mandir',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              shadows: [
                                const Shadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        'Devotion & Peace',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                              fontSize: 16,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                const Shadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 1.5),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                      ),
                    ),
                  ],
                ),
                // Loading spinner at the bottom
                Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: FadeIn(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 1000),
                    child: const SpinKitFadingCircle(
                      color: AppTheme.primarySaffron,
                      size: 50.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
