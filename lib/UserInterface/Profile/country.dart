import 'package:flutter/material.dart';
import 'package:device_region/device_region.dart';

class CountryEditPage extends StatefulWidget {
  const CountryEditPage({super.key});

  @override
  _CountryEditPageState createState() => _CountryEditPageState();
}

class _CountryEditPageState extends State<CountryEditPage> {
  String? _countryCode;

  @override
  void initState() {
    super.initState();
    _fetchCountryCode();
  }

  Future<void> _fetchCountryCode() async {
    String? countryCode;
    try {
      countryCode = await DeviceRegion.getSIMCountryCode();
    } catch (e) {
      print('Error fetching country code: $e');
    }
    if (!mounted) return;
    setState(() {
      _countryCode = countryCode ?? 'Unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit Country',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3B0086), Color(0xFF8F00FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
       decoration: BoxDecoration(
          gradient: RadialGradient(
          colors: const [
            Color(0xff5123C0), 
           Color(0xff27105B), 
           ],
          stops: const [0.0, 1.0],
          radius: 2.0,
          center: Alignment.center,
           ),
          ),

        child: Center(
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.flag,
                    color: Color(0xFF3B0086),
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your Country Code',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _countryCode ?? 'Loading...',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B0086),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      _fetchCountryCode(); 
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B0086),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
       bottomNavigationBar: _buildCustomBottomNavigationBar(),
    );
  }
}

 Widget _buildCustomBottomNavigationBar() {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(0.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavItem(Icons.home, () {
              // Action for home
            }),
            _buildBottomNavItem(Icons.search, () {
              // Action for search
            }),
            _buildBottomNavItem(Icons.add_circle_outline, () {
              // Action for add
            }),
            _buildBottomNavItem(Icons.manage_accounts, () {
              // Action for manage accounts
            }),
            _buildBottomNavItem(Icons.person, () {
              // Action for profile
            }),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBottomNavItem(IconData icon, VoidCallback onTap) {
  return IconButton(
    icon: Icon(icon, color: Colors.white, size: 28.0),
    onPressed: onTap,
  );
}