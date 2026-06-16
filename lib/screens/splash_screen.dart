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
    return Scaffold(
      backgroundColor: AppTheme.warmWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: 1200),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDkmI7raUBGir2ngJMPeZERz1BVp4RxzBjsGIXEQMqXtmIkQiwEmg34_f07cV5WYzWCStlugAynnTDV2zM0l0WRCox7jMLk3VLAoNCBt6hLpRkX5FBmHLcWY0y6Y-X2Jq_NVpE0kOAcj_TLqaq8HLBFn4kUrwn_QhX7Z1tzH5dWCyeDk26O3da5E1FhJN7_qIvWGpCbhqGUAfGTqzsmgqLXQZcZqq0kBRmWsnsSrzEU2E9DF_YlPpy4XIzMVRSGRYJ64zRAKu77vMVR',
                height: 280,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.temple_hindu_rounded,
                  size: 120,
                  color: AppTheme.primarySaffron,
                ),
              ),
            ),
            const SizedBox(height: 24),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Text(
                'Shri Hanuman Mandir',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primarySaffron,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                'Devotion & Peace',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.deepCharcoal.withValues(alpha: 0.6),
                    ),
              ),
            ),
            const SizedBox(height: 64),
            FadeIn(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 1000),
              child: const SpinKitFadingCircle(
                color: AppTheme.primarySaffron,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
