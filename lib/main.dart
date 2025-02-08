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
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> books = [
    Book(
      title: 'Always Watching',
      author: 'chevy stevens',
      price: 19.99,
      preview:
          'Always Watching" is a gripping psychological thriller novel by Chevy Stevens. The story revolves around Dr. Nadine Lavoie, a psychiatrist with a dark past, who discovers unsettling connections between her patients and her own traumatic experiences. While treating a woman who escaped a dangerous cult, Nadine uncovers the sinister influence of a charismatic cult leader named Aaron Quinn. As she digs deeper, she confronts repressed memories from her own time in the cult, putting her life and sanity at risk. The novel is a chilling exploration of memory, trauma, and the enduring effects of manipulation.',
      imageUrl:
          'https://chevystevens.com/wp-content/uploads/2020/09/AlwaysWatching-cvr-674x1024.jpg',
    ),
    Book(
      title: 'Fratal Noise',
      author: 'cris paolini',
      price: 22.99,
      preview:
          '"Fractal Noise" by Christopher Paolini is a science fiction prequel to To Sleep in a Sea of Stars. The story is set in 2234 and follows a crew exploring a distant exoplanet. When they discover a massive, mysterious hole emitting a strange signal, the team grapples with their own fears, motivations, and the enigmatic nature of their discovery. The novel delves into themes of isolation, human resilience, and the quest for meaning in an alien and vast universe. Its a thought-provoking and suspenseful journey into the unknown',
      imageUrl:
          'https://www.paolini.net/wp-content/uploads/2022/10/FractalNoise-TS1-674x1024.jpg',
    ),
    Book(
      title: 'Splinter and Ash',
      author: 'marissha meyer',
      price: 14.99,
      preview:
          '"Splinter and Ash" by Marissa Meyer is a captivating fantasy novel that explores themes of identity, loyalty, and forbidden love. The story follows two characters—one a warrior bound by duty and the other a magical being hiding from a society that fears their kind. As their worlds collide, they must navigate dangerous secrets, political intrigue, and their growing connection. With rich world-building and emotionally charged storytelling, the novel offers an enchanting blend of romance and adventure',
      imageUrl:
          'https://teenlibrariantoolbox.com/wp-content/uploads/2024/12/Splinter_Ash-HC-c-674x1024.jpg',
    ),
    Book(
      title: 'Ancient Ghosts',
      author: 'Edel Marit Gaino',
      price: 18.99,
      preview:
          'Ancient Ghosts" explores the eerie and mysterious through tales deeply rooted in cultural traditions and personal discoveries. Whether delving into the chilling folklore of Northern Norway, deciphering enigmatic carvings etched into cliffs across various states, or unearthing Viking ghost stories from ancient sagas, these narratives offer a fascinating glimpse into the supernatural beliefs and mysteries of the past. Perfect for readers who enjoy an intersection of history, folklore, and the paranormal, these stories transport you to a world where the line between the living and the otherworldly blurs',
      imageUrl:
          'https://inhabiteducationbooks.com/cdn/shop/products/AncientGhostscover_English__RGB_1_1024x1024.jpg?v=1671215504',
    ),
    Book(
      title: 'Ghost Stories',
      author: 'M. R. James',
      price: 24.99,
      preview:
          '"Ghost Stories of an Antiquary" by M.R. James is a classic collection of eerie and atmospheric tales, widely regarded as masterpieces of the ghost story genre. Published in 1904, the book features eight chilling stories, each blending scholarly settings with supernatural elements. With meticulous detail and a slow-building sense of dread, James introduces vengeful spirits, cursed objects, and unsettling encounters, creating an unforgettable sense of unease. Perfect for fans of traditional ghost stories, this collection captures the essence of gothic horror and remains a cornerstone of the genre',
      imageUrl:
          'https://www.penguinreaders.co.uk/wp-content/uploads/2021/09/PR_L3R_GHOSTStories_20703-1-663x1024.jpg',
    ),
    Book(
      title: 'Paris ',
      author: 'WIlliam Owen Roberts',
      price: 16.99,
      preview:
          '"Paris" by William Owen Roberts: This novel, originally published in 2013, follows the Alexandrov family as they navigate the tumultuous events of war and revolution across Europe, ultimately leading them to Paris. The narrative delves into themes of displacement, identity, and resilience, providing a rich tapestry of historical and personal experiences.',
      imageUrl:
          'https://www.parthianbooks.com/cdn/shop/products/Paris_draft_1_1024x1024.jpg?v=1494941375',
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
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Get.to(() => FavoritesPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Get.to(() => CartPage());
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Removed Button 1
                // Removed Button 2
              ],
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
      body: SafeArea(
        child: SingleChildScrollView(
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
              const SizedBox(height: 16.0),
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
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Implement Add to Cart functionality
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Implement Add to Favorites functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: Text('Favorites Page'),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Cart Page'),
      ),
    );
  }
}
