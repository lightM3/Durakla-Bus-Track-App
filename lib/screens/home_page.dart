import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:durakla_app/core/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MapController _mapController;
  final TextEditingController _searchController = TextEditingController();

  static const LatLng _initialPosition = LatLng(41.0082, 28.9784);

  final List<BusStop> _nearbyStops = [
    BusStop(
      name: 'Atatürk 3. Etap',
      routeNumber: 'MR40',
      routeColor: AppColors.primaryBlue,
      estimatedTime: 4,
      address: 'Atatürk Cd.',
      location: const LatLng(41.0122, 28.9764),
    ),
    BusStop(
      name: 'Kuşlar Tepesi',
      routeNumber: 'B9T',
      routeColor: AppColors.orange,
      estimatedTime: 23,
      address: 'Kuşlar Tepesi',
      location: const LatLng(41.0062, 28.9854),
    ),
  ];

  final List<FavoriteLocation> _favorites = [
    FavoriteLocation(
      name: 'Home',
      icon: Icons.home,
      address: 'Kadıköy, İstanbul',
    ),
    FavoriteLocation(
      name: 'Work',
      icon: Icons.work,
      address: 'Levent, İstanbul',
    ),
    FavoriteLocation(
      name: 'Favorites',
      icon: Icons.favorite,
      address: 'Saved locations',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: _initialPosition,
              initialZoom: 13.0,
              minZoom: 3.0,
              maxZoom: 18.0,
              backgroundColor: AppColors.background,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.durakla.durakla_app',
                retinaMode: true,
              ),

              MarkerLayer(
                markers: _nearbyStops.map((stop) {
                  return Marker(
                    point: stop.location,
                    width: 40,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: stop.routeColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x4D000000),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.directions_bus,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    textStyle: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),

          IgnorePointer(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color.fromARGB(255, 0, 0, 0), Colors.transparent],
                  stops: [0.0, 0.45],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.menu,
                              color: AppColors.textPrimary,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Konum Giriniz...',
                              hintStyle: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 15,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.textSecondary,
                                size: 22,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.my_location,
                            color: AppColors.textPrimary,
                            size: 22,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            right: 16,
            bottom: 220,
            child: Column(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: AppColors.textPrimary),
                    onPressed: () {
                      final camera = _mapController.camera;
                      _mapController.move(camera.center, camera.zoom + 1);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {
                      final camera = _mapController.camera;
                      _mapController.move(camera.center, camera.zoom - 1);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.navigation,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {
                      _mapController.move(_initialPosition, 13.0);
                    },
                  ),
                ),
              ],
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.15,
            maxChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.cardBackgroundDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0x4D94A3B8),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Favorites',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: _favorites.map((fav) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _buildFavoriteChip(fav),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Nearby Stops',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    ..._nearbyStops.map((stop) => _buildBusStopCard(stop)),

                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteChip(FavoriteLocation favorite) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(favorite.icon, color: AppColors.textPrimary, size: 18),
          const SizedBox(width: 8),
          Text(
            favorite.name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusStopCard(BusStop stop) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: stop.routeColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              stop.routeNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stop.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stop.address,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Estimated Time',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
              ),
              const SizedBox(height: 4),
              Text(
                '${stop.estimatedTime} MIN',
                style: TextStyle(
                  color: stop.estimatedTime < 10
                      ? AppColors.liveGreen
                      : AppColors.errorRed,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.cardBackground,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.cardBackgroundDark,
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hoş Geldiniz',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Profilinizi düzenleyin',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(
                    icon: Icons.home,
                    title: 'Ana Sayfa',
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    icon: Icons.route,
                    title: 'Hatlar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.location_on,
                    title: 'Duraklar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.star,
                    title: 'Favorilerim',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.history,
                    title: 'Geçmiş',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: AppColors.divider,
                    height: 24,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings,
                    title: 'Ayarlar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.help_outline,
                    title: 'Yardım',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.info_outline,
                    title: 'Hakkında',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconSecondary, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 12,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}

class BusStop {
  final String name;
  final String routeNumber;
  final Color routeColor;
  final int estimatedTime;
  final String address;
  final LatLng location;

  BusStop({
    required this.name,
    required this.routeNumber,
    required this.routeColor,
    required this.estimatedTime,
    required this.address,
    required this.location,
  });
}

class FavoriteLocation {
  final String name;
  final IconData icon;
  final String address;

  FavoriteLocation({
    required this.name,
    required this.icon,
    required this.address,
  });
}
