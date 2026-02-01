import 'package:flutter/material.dart';

class StopSelectionScreen extends StatefulWidget {
  const StopSelectionScreen({super.key});

  @override
  State<StopSelectionScreen> createState() => _StopSelectionScreenState();
}

class _StopSelectionScreenState extends State<StopSelectionScreen> {
  int _selectedStopIndex = -1;
  int _alertStopsAhead = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Durak Seç')),
      body: Column(
        children: [
          // Current bus info
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).primaryColor.withAlpha(51),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '15BK - Otobüs #1',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text('Kadıköy yönünde'),
                  ],
                ),
                const Icon(Icons.location_on, color: Colors.red),
              ],
            ),
          ),
          // Alert settings
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Kaç durak kala uyarayım?'),
                    DropdownButton<int>(
                      value: _alertStopsAhead,
                      items: [1, 2, 3, 4, 5].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value durak'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _alertStopsAhead = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Stops list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 20, // TODO: Replace with actual data
              itemBuilder: (context, index) {
                final isSelected = _selectedStopIndex == index;
                return Card(
                  color: isSelected
                      ? Theme.of(context).primaryColor.withAlpha(102)
                      : null,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Durak ${index + 1}'),
                    subtitle: Text('Yaklaşık ${(index + 1) * 3} dakika'),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedStopIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Start tracking button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _selectedStopIndex != -1
                    ? () {
                        // TODO: Navigate to tracking screen
                      }
                    : null,
                child: const Text(
                  'Takibe Başla',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
