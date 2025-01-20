import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Online Bookstore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class Book {
  final String title;
  final String author;
  final double price;
  final String preview;
  final String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.price,
    required this.preview,
    required this.imageUrl,
  });
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> books = [
    Book(
      title: 'LiLAK',
      author: 'yesha fernando',
      price: 19.99,
      preview:
          'Lilak" refers to two distinct books for different audiences. One is a Sinhala poetry collection by Yesha Fernando, published by Rasa Katha Publishers, exploring love, emotions, and personal experiences. The other is Lilak: Cookbook for Bachelors & Bachelorettes by Edes Co., offering simple, step-by-step recipes using common ingredients. Both books provide unique experiences, one through poetry and the other through practical cooking',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbZsFt99CvZ-DUMJekktAYZ7X3keMxruiyJQ&s',
    ),
    Book(
      title: 'Madol Doova',
      author: 'Martin Wickramasinghe',
      price: 22.99,
      preview:
          'Madol Doova is a beloved Sinhala childrens novel by Martin Wickramasinghe. Set in Sri Lanka, it follows the adventures of two mischievous boys, Upali and Jinna, as they escape societal constraints and explore life on a secluded island. The story highlights themes of friendship, independence, and resilience, making it a timeless classic in Sri Lankan literature',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgGWmmYZ6fem7WEVbgXPrNfkT1NTbOKYUfgQ&s',
    ),
    Book(
      title: 'Kammali Mole',
      author: 'Chandhana sooriyabandara',
      price: 14.99,
      preview:
          'Kammalimole by Chandhna Sooriyabandara is a poignant and evocative novel that explores themes of identity, personal growth, and resilience. The story revolves around the central character, Kammalimole, a young woman who confronts various challenges in her life. Through her journey, the novel delves into complex human emotions, societal expectations, and the pursuit of dreams. With a strong cultural backdrop, the book paints a vivid picture of rural life and the struggles faced by its characters, making it a thought-provoking read about self-discovery and the power of perseverance',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXk2IPqEGakK2ayQO3BqSNLJ0uL7lDpb-0qw&s',
    ),
    Book(
      title: 'Educated',
      author: 'Tara Westover',
      price: 18.99,
      preview:
          'A memoir about a woman who grows up in a strict and abusive household...',
      imageUrl: 'https://example.com/educated.jpg',
    ),
    Book(
      title: 'Becoming',
      author: 'Michelle Obama',
      price: 24.99,
      preview:
          'A deeply personal and inspiring memoir by the former First Lady...',
      imageUrl: 'https://example.com/becoming.jpg',
    ),
    Book(
      title: 'Dune',
      author: 'Frank Herbert',
      price: 16.99,
      preview: 'A science fiction epic about politics, religion, and power...',
      imageUrl: 'https://example.com/becoming.jpg',
    ),
  ];

  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void _filterBooks(String query) {
    final filtered = books.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredBooks = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Bookstore'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.to(() => HomeScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Get.to(() => ProfileScreen());
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterBooks,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return BookWidget(book: book);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Book> books = [
    Book(
      title: 'The Silent Patient',
      author: 'Alex Michaelides',
      price: 19.99,
      preview:
          'A psychological thriller about a woman who shoots her husband...',
      imageUrl: 'https://example.com/silent_patient.jpg',
    ),
    Book(
      title: 'Atomic Habits',
      author: 'James Clear',
      price: 22.99,
      preview: 'A guide to building good habits and breaking bad ones...',
      imageUrl: 'https://example.com/atomic_habits.jpg',
    ),
    Book(
      title: 'Where the Crawdads Sing',
      author: 'Delia Owens',
      price: 14.99,
      preview:
          'A story of survival and mystery in the marshlands of North Carolina...',
      imageUrl: 'https://example.com/crawdads_sing.jpg',
    ),
    Book(
      title: 'Educated',
      author: 'Tara Westover',
      price: 18.99,
      preview:
          'A memoir about a woman who grows up in a strict and abusive household...',
      imageUrl: 'https://example.com/educated.jpg',
    ),
    Book(
      title: 'Becoming',
      author: 'Michelle Obama',
      price: 24.99,
      preview:
          'A deeply personal and inspiring memoir by the former First Lady...',
      imageUrl: 'https://example.com/becoming.jpg',
    ),
    Book(
      title: 'Dune',
      author: 'Frank Herbert',
      price: 16.99,
      preview: 'A science fiction epic about politics, religion, and power...',
      imageUrl: 'https://example.com/dune.jpg',
    ),
  ];

  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void _filterBooks(String query) {
    final filtered = books.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredBooks = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterBooks,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return BookWidget(book: book, useOriginalSize: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  final Book book;
  final bool useOriginalSize;

  const BookWidget(
      {super.key, required this.book, this.useOriginalSize = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            book.imageUrl,
            fit: BoxFit.cover,
            height: 500,
            width: useOriginalSize ? null : double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              book.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'by ${book.author}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${book.price}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Implement Buy Now functionality
                },
                child: const Text('Buy Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BookDetailsScreen(book: book));
                },
                child: const Text('Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(book.imageUrl),
            const SizedBox(height: 16.0),
            Text(
              book.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'by ${book.author}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${book.price}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Text(book.preview),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Implement Buy Now functionality
                  },
                  child: const Text('Buy Now'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
