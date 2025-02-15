import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:map/pages/screens/my_vehicle.dart'; // Import MyVehiclePage

class VehiclePage extends StatefulWidget {
  static const id = 'choice';

  const VehiclePage({super.key});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  final List<String> cars = [
    'Tesla Model 3',
    'Hyundai Ioniq 5',
    'BMW i4',
    'Tesla Model Y',
    'Nissan Leaf',
    'Chevrolet Bolt EV',
    'Kia EV6',
    'Ford Mustang Mach-E',
    'Volkswagen ID.4',
    'Audi e-tron',
    'Rivian R1T',
    'Ford F-150 Lightning',
    'GMC Hummer EV',
    'Tesla Cybertruck',
    'Mercedes-Benz EQB'
  ];
  final List<String> selectedCars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'EV CARS',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () async {
              if (selectedCars.isNotEmpty) {
                // Save selectedCars to SharedPreferences
                final prefs = await SharedPreferences.getInstance();
                await prefs.setStringList('selectedCars', selectedCars);

                // Navigate to MyVehiclePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyVehiclePage(),
                  ),
                );
              } else {
                // Show a message if no cars are selected
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select at least one car.'),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          final isSelected = selectedCars.contains(car);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedCars.remove(car);
                } else {
                  selectedCars.add(car);
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    car,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Icon(
                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}