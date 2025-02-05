import 'package:flutter/material.dart';
import 'vehicle.dart';
import 'square.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});
 
  @override
  State<CarPage> createState() => _CarPageState();
} 

class _CarPageState extends State<CarPage> {
  List<String> selectedCars = []; // To store multiple selected cars

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle'),
      ),
      body: selectedCars.isEmpty
          ? const Center(child: Text('No Cars Selected'))
          : ListView.builder(
              itemCount: selectedCars.length,
              itemBuilder: (context, index) {
                return MySquare(child: selectedCars[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to VehiclePage and wait for the selected cars
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VehiclePage()),
          );
          // Update the selected cars when returning
          if (result != null && result is List<String>) {
            setState(() {
              selectedCars.addAll(result); // Add selected cars to the list
            });
          }
        },
        child: const Icon(Icons.add), // Add Icon
      ),
    );
  }
}
