import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Linelink'),
          bottom: const TabBar(
            indicatorColor: Color(0xFF00C300),
            labelColor: Color(0xFF00C300),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Calls'),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person_add_alt)),
          ],
        ),
        body: TabBarView(
          children: [
            // Chats Tab
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600]),
                  ),
                  title: Text('Friend ${index + 1}'),
                  subtitle: const Text('Hey, did you see that video?'),
                  trailing: Text('10:${index}0 AM', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  onTap: () {
                    // Navigate to chat detail
                  },
                );
              },
            ),
            // Calls Tab
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600]),
                  ),
                  title: Text('Friend ${index + 1}'),
                  subtitle: Row(
                    children: [
                      Icon(
                        index % 2 == 0 ? Icons.call_received : Icons.call_made,
                        size: 16,
                        color: index % 2 == 0 ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      const Text('Today, 10:00 AM'),
                    ],
                  ),
                  trailing: const Icon(Icons.call, color: Color(0xFF00C300)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
