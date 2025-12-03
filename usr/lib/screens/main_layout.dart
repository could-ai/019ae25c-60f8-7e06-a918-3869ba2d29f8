import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/feed/feed_screen.dart';
import 'package:couldai_user_app/screens/chat/chat_list_screen.dart';
import 'package:couldai_user_app/screens/feed/upload_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ChatListScreen(), // Chats & Calls
    const FeedScreen(),     // Video Feed
    const Center(child: Text('Profile')), // Placeholder
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _openUpload() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UploadScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onTabTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_library_outlined),
            selectedIcon: Icon(Icons.video_library),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 1 // Only show on Feed tab
          ? FloatingActionButton(
              onPressed: _openUpload,
              backgroundColor: const Color(0xFF00C300),
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
