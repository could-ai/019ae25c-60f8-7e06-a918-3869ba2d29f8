import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10, // Mock items
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Mock Video Background
              Container(
                color: Colors.grey[900],
                child: Center(
                  child: Icon(Icons.play_circle_outline, size: 64, color: Colors.white.withOpacity(0.5)),
                ),
              ),
              
              // Video Info & Interactions
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(radius: 16, backgroundColor: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                '@user_${index + 1}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00C300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Subscribe',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Check out this cool video! #linelink #shorts',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    
                    // Interaction Buttons
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _InteractionButton(icon: Icons.thumb_up, label: '1.2k'),
                        const SizedBox(height: 16),
                        _InteractionButton(icon: Icons.thumb_down, label: 'Dislike'),
                        const SizedBox(height: 16),
                        _InteractionButton(icon: Icons.comment, label: '342'),
                        const SizedBox(height: 16),
                        _InteractionButton(icon: Icons.share, label: 'Share'),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Top Bar
              Positioned(
                top: 40,
                left: 16,
                child: const Text(
                  'Linelink Shorts',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _InteractionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InteractionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.5),
          radius: 24,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
