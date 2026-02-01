import 'package:flutter/material.dart';

class BusSelectionScreen extends StatelessWidget {
  const BusSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Otobüs Seç')),
      body: Column(
        children: [
          // Line info
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).primaryColor.withAlpha(51),
            child: Row(
              children: [
                const Icon(Icons.directions_bus, size: 40),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('15BK', style: Theme.of(context).textTheme.titleLarge),
                    const Text('Kadıköy - Üsküdar'),
                  ],
                ),
              ],
            ),
          ),
          // Available buses
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Yakınındaki Otobüsler',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 5, // TODO: Replace with actual data
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(Icons.gps_fixed, size: 40),
                        Text(
                          '${index * 500}m',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    title: Text('Otobüs #${index + 1}'),
                    subtitle: Text('${index + 2} durak sonra buraya gelecek'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Navigate to stop selection
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
