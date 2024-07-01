import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
  final List<String> locations;

  final List<String> specialties;
  final Function(String?, String?) onFilterChanged;

  const FilterDialog({
    super.key,
    required this.locations,
    required this.specialties,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedLocation;
    String? selectedprice;

    String? selectedSpecialty;
    String? searchText;

    return AlertDialog(
      title: const Text('Determine the desired doctor'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (value) {
                searchText = value;
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedLocation,
              onChanged: (String? newValue) {
                selectedLocation = newValue;
              },
              items: locations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedSpecialty,
              onChanged: (String? newValue) {
                selectedSpecialty = newValue;
              },
              items: specialties.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onFilterChanged(selectedLocation, selectedSpecialty);
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
