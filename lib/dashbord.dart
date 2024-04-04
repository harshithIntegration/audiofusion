import 'package:flutter/material.dart';
import 'package:audiofusion/aboutus.dart';
import 'package:audiofusion/committee.dart';
import 'package:audiofusion/contactus.dart';
import 'package:audiofusion/exhibitors.dart';
import 'package:audiofusion/speakers.dart';
import 'package:audiofusion/venue.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/banner.png',
              height: 550,
              width: 325,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Center(
                child: Text(
                  ' Welcome to AudioVisualFusion ',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                DashboardItem(
                  icon: Icons.spatial_tracking_rounded,
                  label: 'Speakers',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Speakers(),
                      ),
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.add_call,
                  label: 'ContactUs',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUs(),
                      ),
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.location_on,
                  label: 'Venue',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Venue(),
                      ),
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.person_pin_outlined,
                  label: 'Exhibitors',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Exibitors(),
                      ),
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.co_present_outlined,
                  label: 'AboutUs',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUs(),
                      ),
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.person_add_alt_1_sharp,
                  label: 'Committee',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const committee(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  DashboardItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0),
            SizedBox(height: 10.0),
            Text(
              label,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


