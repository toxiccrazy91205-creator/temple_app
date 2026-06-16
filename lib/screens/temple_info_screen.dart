import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../theme/app_theme.dart';

class TempleInfoScreen extends StatelessWidget {
  const TempleInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temple Info & Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Sankat_Mochan_Hanuman_Temple.jpg/800px-Sankat_Mochan_Hanuman_Temple.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppTheme.deepCharcoal.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Our History',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      'Established over 200 years ago, Shri Hanuman Mandir has been a beacon of faith, devotion, and spiritual energy for millions of devotees.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                          ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      'Gallery',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Gallery Grid
                  FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        _buildGalleryImage('https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Hanuman_statue_at_Bhaktha_Anjaneyar_temple_in_Kaveripakkam.jpg/400px-Hanuman_statue_at_Bhaktha_Anjaneyar_temple_in_Kaveripakkam.jpg'),
                        _buildGalleryImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Jakhoo_temple_hanuman_statue.jpg/400px-Jakhoo_temple_hanuman_statue.jpg'),
                        _buildGalleryImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Hanuman_at_the_City_Palace%2C_Jaipur.jpg/400px-Hanuman_at_the_City_Palace%2C_Jaipur.jpg'),
                        _buildGalleryImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/18th_century_painting_of_Hanuman_bringing_Sanjeevani.jpg/400px-18th_century_painting_of_Hanuman_bringing_Sanjeevani.jpg'),
                      ],
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

  Widget _buildGalleryImage(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primarySaffron.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
