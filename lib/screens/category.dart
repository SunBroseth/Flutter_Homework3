import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key, required String categoryName, required String categoryImage});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 7, 7, 5),
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/personal-care.png',
                  fit: BoxFit.cover, // Ensures the image covers the container
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Care',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_sharp, color: Colors.black),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200, // Set the background color here
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your existing widgets...
              // Search Bar
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Category Tabs
              SizedBox(
                height: 50.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard('Baby & Kids', true),
                    _buildCategoryCard('Body', false),
                    _buildCategoryCard('Teeth & Mouth', false),
                    _buildCategoryCard('Face', false),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Products Grid
              GridView.count(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 4 / 6,
                children: <Widget>[
                  _buildProductCard(
                    'assets/images/product1.jpg',
                    'New Foods',
                    'Omega-3',
                    '30 softgels',
                    '\$30',
                    Icons.favorite_border,
                    const Color.fromARGB(255, 65, 51, 51),
                  ),
                  _buildProductCard(
                    'assets/images/product2.jpg',
                    'New Foods',
                    'Omega-3',
                    '30 softgels',
                    '\$30',
                    Icons.favorite,
                   const Color.fromARGB(255, 223, 25, 25),
                  ),
                  _buildProductCard(
                    'assets/images/baby_diaper.jpg',
                    'Baby Diapers',
                    'best quality',
                    '30 softgels',
                    '\$30',
                    Icons.favorite_border,
                    const Color.fromARGB(255, 65, 51, 51),
                  ),
                  _buildProductCard(
                    'assets/images/milk.jpg',
                    'Milk',
                    'Best for kid',
                    '30 softgels',
                    '\$30',
                    Icons.favorite,
                    const Color.fromARGB(255, 223, 27, 27),
                  ),
                  _buildProductCard(
                    'assets/images/product3.jpg',
                    'New Foods',
                    'Omega-3',
                    '30 softgels',
                    '\$30',
                    Icons.favorite,
                    const Color.fromARGB(255, 65, 51, 51),
                  ),
                  _buildProductCard(
                    'assets/images/product4.jpg',
                    'New Foods',
                    'Omega-3',
                    '30 softgels',
                    '\$30',
                    Icons.favorite_border,
                    const Color.fromARGB(255, 65, 51, 51),
                  ),

                  // Repeat your product cards...
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        color: isSelected ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: isSelected ? 4.0 : 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String imagePath,
    String title,
    String subtitle1,
    String subtitle2,
    String subtitle3,
    IconData icon1,
    Color color1,
    // IconData firstIcon,
    // Color firstIconColor,
  ) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(2.0),
      child: Card(
        color: Colors.white,
        // margin: const EdgeInsets.fromLTRB(1, 0, 5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Stack to overlay icons at the top-right of the card
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(9.0),
                child: Icon(
                  icon1,
                  color: color1,
                  size: 24.0, // Adjust size as needed
                ),
              ),
            ),
            // Image section
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 220, 35, 35), // Transparent background
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 100,
                height: 40,
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle1,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle2,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 8, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Adjust alignment
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Text(
                        subtitle3, // Add subtitle or any text here
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35, // Set a fixed width for the button

                    height: 35, // Set a fixed height for the button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        padding:
                            EdgeInsets.zero, // Remove padding to center icon
                        // minimumSize: const Size(30, 30),
                      ),
                      onPressed: () {
                        // Action on button press
                        // print('Cart button pressed');
                      },
                      child: const Icon(
                        Icons.shopping_cart, // Shopping cart icon
                        color: Colors.white, // Icon color
                        size: 20.0, // Smaller icon size
                      ),
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
}
