import 'package:flutter/material.dart';
import 'package:homework3/screens/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eMart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const Center(child: Text('Search')),
    const Center(child: Text('Profile')),
    const Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            // Image.asset(
            //   'assets/images/logo.png', // Replace with your logo
            //   height: 40.0,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(width: 8.0),
            Text('eMart'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          const SizedBox(height: 10.0),
          
          // Banner
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          
          // Categories Title
          const SizedBox(height: 10.0),
          
          // Category Grid
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.5,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildCategoryButton(context, 'assets/images/cosmetics.png', 'Cosmetic'),
              _buildCategoryButton(context, 'assets/images/fashion.png', 'Fashion'),
              _buildCategoryButton(context, 'assets/images/delivery.png', 'Restaurants'),
              _buildCategoryButton(context, 'assets/images/taxi.png', 'Cab Service'),
              _buildCategoryButton(context, 'assets/images/grocery.png', 'Food Grocery'),
              _buildCategoryButton(context, 'assets/images/box.png', 'Parcel'),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build category button and navigate on click
  Widget _buildCategoryButton(BuildContext context, String imagePath, String label) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Navigate to the Category page when tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Category(categoryName: label, categoryImage: imagePath),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 50.0,
              ),
              const SizedBox(height: 10.0),
              Text(
                label,
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
