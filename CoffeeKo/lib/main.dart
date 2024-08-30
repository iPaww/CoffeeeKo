import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartPage(),  // Start with the StartPage
    );
  }
}

// StartPage with a title, subtitle, and a button to navigate to CoffeePage
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              'CoffeeKo',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black color for title
              ),
            ),
            const SizedBox(height: 10),  // Space between title and subtitle
            // Subtitle
            const Text(
              'Your Coffee Idea of the Day',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold, // Bold subtitle
                color: Colors.black, // Black color for subtitle
              ),
            ),
            const SizedBox(height: 40), // Space between subtitle and button
            // Start Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the main coffee page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoffeePage()),
                );
              },
              child: const Text(
                'Start Coffee Ideas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold, // Bold button text
                  color: Colors.white, // Black button text
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.purple[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Coffee Page with random coffee ideas, return button, and additional details
class CoffeePage extends StatefulWidget {
  const CoffeePage({super.key});

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  // List of image paths
  final List<String> images = [
    "assets/americano.jpg",
    "assets/mocha.jpg",
    "assets/cappuccino.jpg",
    "assets/latte.jpg",
    "assets/flat_white.jpg",
    "assets/espresso.jpg",
    "assets/macchiato.jpg",
    "assets/affogato.jpg"
  ];

  // List of random descriptions
  final List<String> descriptions = [
    "A strong cup of Americano to start your day!",
    "Smooth and bold, try this Mocha!",
    "A frothy Cappuccino to keep you energized!",
    "Indulge in a creamy Latte for a relaxing afternoon.",
    "A perfectly balanced Flat White for a smooth experience.",
    "An intense shot of Espresso for a quick pick-me-up!",
    "Savor the rich flavors of a Macchiato!",
    "Delight in a scoop of ice cream drowned in Espresso: the Affogato!"
  ];

  // List of fan facts
  final List<String> fanFacts = [
    "The Americano was created by American soldiers during WWII who diluted espresso with water to mimic the drip coffee they had at home.",
    "Mocha coffee is named after the Yemeni port city of Mocha, a major coffee trading center in the 15th century.",
    "Cappuccino gets its name from the Capuchin friars, whose brown robes resemble the coffee's color.",
    "The Latte art we see today was popularized in the 1980s in Seattle, inspired by Italian coffee culture.",
    "Flat White originated in Australia and New Zealand in the 1980s as a variation of the cappuccino with less froth.",
    "Espresso is a concentrated coffee brewed by forcing hot water through finely-ground coffee beans, and it’s the base for many other coffee drinks.",
    "Macchiato means 'stained' or 'spotted' in Italian, and traditionally it refers to a shot of espresso with a small amount of milk.",
    "Affogato means 'drowned' in Italian, and it's a delicious treat where a shot of espresso is poured over a scoop of vanilla ice cream."
  ];

  // List of ingredients for each coffee
  final List<String> ingredients = [
    "Espresso, Hot water",
    "Espresso, Steamed milk, Chocolate syrup",
    "Espresso, Steamed milk, Milk foam",
    "Espresso, Steamed milk",
    "Espresso, Steamed milk, Microfoam",
    "Espresso",
    "Espresso, Steamed milk",
    "Espresso, Vanilla ice cream"
  ];

  // Variables to hold random image, description, fan fact, and ingredients
  String selectedImage = "assets/coffee.jpg";
  String selectedDescription = "Pick your coffee idea!";
  String selectedFanFact = "Did you know?";
  String selectedIngredients = "Coffee is great all the time!";

  // Function to generate a random coffee idea with details
  void randomize() {
    setState(() {
      int randomIndex = Random().nextInt(images.length);  // Random index for image and description
      selectedImage = images[randomIndex];
      selectedDescription = descriptions[randomIndex];
      selectedFanFact = fanFacts[randomIndex];
      selectedIngredients = ingredients[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16), // Space at the top
            // Container for image with border
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  selectedImage, // Display the selected random image
                  width: 200,  // Increased width
                  height: 200,  // Increased height
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16), // Space between image and description
            // Container for description
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Display random description
                  Text(
                    selectedDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Bold description
                      color: Colors.black, // Black description text
                      fontFamily: 'Arial', // Different font style
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Space between description and fan fact
            // Container for fan fact
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Display coffee fan fact
                  Text(
                    selectedFanFact,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold, // Bold fan fact
                      color: Colors.black, // Black fan fact text
                      fontFamily: 'Georgia', // Different font style
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10), // Space between fan fact and ingredients
                  // Display coffee ingredients
                  Text(
                    "Ingredients: $selectedIngredients",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800, // Bolder ingredients text
                      color: Colors.black, // Black ingredients text
                      fontFamily: 'Courier New', // Different font style
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Space between containers and buttons
            // Button to trigger randomization
            ElevatedButton(
              onPressed: randomize,
              child: const Text(
                "Random Idea",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Bold button text
                  color: Colors.black, // Black button text
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons
            // Return Button to go back to StartPage
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  // Navigate back to StartPage
              },
              child: const Text(
                "Return to Start",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Bold button text
                  color: Colors.white, // White button text
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.brown[600],  // Brown color for the return button
              ),
            ),
          ],
        ),
      ),
    );
  }
}