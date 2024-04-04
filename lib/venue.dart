import 'package:flutter/material.dart';

class Venue extends StatefulWidget {
  const Venue({super.key});

  @override
  State<Venue> createState() => _VenueState();
}

class _VenueState extends State<Venue> {
void _openMaps() async {
    // Address to open in Google Maps
    String address =
        '49/A, 1st Floor Ravish Gardenia, Ravish Mangroves Vaderahalli, Post, Vidyaranyapura, Bengaluru, Karnataka 560097';
    String encodedAddress = Uri.encodeFull(address);
    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Venue'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Container(
              height: 250, // Adjust the height of the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/wall.jpg'), // Replace this with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '49/A, 1st Floor Ravish Gardenia, Ravish Mangroves Vaderahalli, Post, Vidyaranyapura, Bengaluru, Karnataka 560097 Phone: 070192 49965',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

    
  

