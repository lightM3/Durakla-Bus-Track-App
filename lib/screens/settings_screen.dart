import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  bool _nightModeEnabled = false;
  double _alertDistance = 300; // meters

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: [
          // Notification settings
          ListTile(
            title: Text(
              'Bildirim Ayarları',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SwitchListTile(
            title: const Text('Ses'),
            subtitle: const Text('Alarm sesi çal'),
            value: _soundEnabled,
            onChanged: (value) {
              setState(() {
                _soundEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Titreşim'),
            subtitle: const Text('Cihaz titresin'),
            value: _vibrationEnabled,
            onChanged: (value) {
              setState(() {
                _vibrationEnabled = value;
              });
            },
          ),
          const Divider(),
          // Alert distance
          ListTile(
            title: Text(
              'Uyarı Ayarları',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Uyarı Mesafesi: ${_alertDistance.toInt()} metre'),
                Slider(
                  value: _alertDistance,
                  min: 100,
                  max: 1000,
                  divisions: 18,
                  label: '${_alertDistance.toInt()}m',
                  onChanged: (value) {
                    setState(() {
                      _alertDistance = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          // Appearance
          ListTile(
            title: Text(
              'Görünüm',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SwitchListTile(
            title: const Text('Gece Modu'),
            subtitle: const Text('Karanlık tema'),
            value: _nightModeEnabled,
            onChanged: (value) {
              setState(() {
                _nightModeEnabled = value;
              });
            },
          ),
          const Divider(),
          // About
          ListTile(
            title: const Text('Hakkında'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
          ListTile(
            title: const Text('Gizlilik Politikası'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show privacy policy
            },
          ),
        ],
      ),
    );
  }
}
