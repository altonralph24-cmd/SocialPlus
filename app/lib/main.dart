import 'package:flutter/material.dart';

void main() {
  runApp(const SocialPlusApp());
}

class SocialPlusApp extends StatelessWidget {
  const SocialPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00B8D4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5FAFB),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    FeedPage(),
    ExplorePage(),
    CreatePage(),
    MessagesPage(),
    ProfilePage(),
  ];

  final List<String> titles = [
    'Social+',
    'Discover',
    'Create',
    'Messages',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Your world, together.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text('Connect. Share. Discover. Belong.'),
        SizedBox(height: 20),
        PostCard(
          name: 'Social+ Community',
          username: '@socialplus',
          message: 'Welcome to Social+! More Than Social.',
        ),
        PostCard(
          name: 'Getting Started',
          username: '@welcome',
          message: 'Your social journey starts here.',
        ),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  final String name;
  final String username;
  final String message;

  const PostCard({
    super.key,
    required this.name,
    required this.username,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFE8F9FC),
                  child: Icon(Icons.person, color: Color(0xFF00B8D4)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(username,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(message),
            const SizedBox(height: 16),
            const Divider(),
            const Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 6),
                Text('Like'),
                SizedBox(width: 24),
                Icon(Icons.comment_outlined),
                SizedBox(width: 6),
                Text('Comment'),
                Spacer(),
                Icon(Icons.share_outlined),
                SizedBox(width: 6),
                Text('Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Discover people and communities on Social+'),
    );
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Create your first Social+ post'),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your messages will appear here'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your Social+ profile'),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const SocialPlusApp());
}

class SocialPlusApp extends StatelessWidget {
  const SocialPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00B8D4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5FAFB),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    FeedPage(),
    ExplorePage(),
    CreatePage(),
    MessagesPage(),
    ProfilePage(),
  ];

  final List<String> titles = [
    'Social+',
    'Discover',
    'Create',
    'Messages',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Your world, together.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text('Connect. Share. Discover. Belong.'),
        SizedBox(height: 20),
        PostCard(
          name: 'Social+ Community',
          username: '@socialplus',
          message: 'Welcome to Social+! More Than Social.',
        ),
        PostCard(
          name: 'Getting Started',
          username: '@welcome',
          message: 'Your social journey starts here.',
        ),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  final String name;
  final String username;
  final String message;

  const PostCard({
    super.key,
    required this.name,
    required this.username,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFE8F9FC),
                  child: Icon(Icons.person, color: Color(0xFF00B8D4)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(username,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(message),
            const SizedBox(height: 16),
            const Divider(),
            const Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 6),
                Text('Like'),
                SizedBox(width: 24),
                Icon(Icons.comment_outlined),
                SizedBox(width: 6),
                Text('Comment'),
                Spacer(),
                Icon(Icons.share_outlined),
                SizedBox(width: 6),
                Text('Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Discover people and communities on Social+'),
    );
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Create your first Social+ post'),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your messages will appear here'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your Social+ profile'),
    );
  }
}
