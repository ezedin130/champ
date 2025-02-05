import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({super.key});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  final List<String> cars = ['Tesla', 'BMW', 'Audi', 'Nissan'];
  final List<String> selectedCars = []; // To track selected cars

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Cars'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              // Return selected cars to CarPage
              Navigator.pop(context, selectedCars);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          final isSelected = selectedCars.contains(car);

          return ListTile(
            title: Text(car),
            trailing: Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedCars.add(car);
                  } else {
                    selectedCars.remove(car);
                  }
                });
              },
            ),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedCars.remove(car);
                } else {
                  selectedCars.add(car);
                }
              });
            },
          );
        },
      ),
    );
  }
}
