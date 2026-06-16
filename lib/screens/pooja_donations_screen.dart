import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../theme/app_theme.dart';

class PoojaDonationsScreen extends StatefulWidget {
  const PoojaDonationsScreen({super.key});

  @override
  State<PoojaDonationsScreen> createState() => _PoojaDonationsScreenState();
}

class _PoojaDonationsScreenState extends State<PoojaDonationsScreen> {
  int _selectedAmount = 501;
  final List<int> _donationAmounts = [101, 501, 1100, 2100];
  String _selectedPooja = 'Archana';
  final List<String> _poojaTypes = ['Archana', 'Abhishekam', 'Vahan Pooja', 'Special Darshan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Pooja & Donate'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Text(
                'Book a Pooja',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: _poojaTypes.map((type) {
                      final isSelected = _selectedPooja == type;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedPooja = type;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? AppTheme.vermillion : AppTheme.outlineVariant,
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppTheme.vermillion,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Text(type, style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                'Make a Donation',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            
            FadeInUp(
              duration: const Duration(milliseconds: 1400),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _donationAmounts.map((amount) {
                  final isSelected = _selectedAmount == amount;
                  return ChoiceChip(
                    label: Text('₹$amount'),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedAmount = amount;
                        });
                      }
                    },
                    selectedColor: AppTheme.primarySaffron.withValues(alpha: 0.2),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? AppTheme.primarySaffron : AppTheme.deepCharcoal,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                      side: BorderSide(
                        color: isSelected ? AppTheme.primarySaffron : AppTheme.outlineVariant,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),

            FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter custom amount',
                  prefixIcon: const Icon(Icons.currency_rupee, color: AppTheme.primarySaffron),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppTheme.outlineVariant),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 32),

            FadeInUp(
              duration: const Duration(milliseconds: 1800),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle payment
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing your request...')),
                    );
                  },
                  child: const Text(
                    'Proceed to Pay',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
