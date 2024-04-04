import 'package:flutter/material.dart';

class Speakers extends StatefulWidget {
  const Speakers({super.key});

  @override
  State<Speakers> createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMembers = [];
  List<Map<String, String>> _allMembers = [
    {
      'name': 'Darshan sir',
      'designation': 'CEO of planotech group of company',
      'imagePath': 'assets/sir.jpg',
    },
    {
      'name': 'Santosh sir',
      'designation': 'president of audiovisualfusion',
      'imagePath': 'assets/santosh sir.jpeg',
    },
    {
      'name': 'Chethan sir',
      'designation': 'Vice-President of audiovisualfusion',
      'imagePath': 'assets/chethan.JPG',
    },
  ];

  @override
  void initState() {
    _filteredMembers.addAll(_allMembers);
    super.initState();
  }

  void _filterMembers(String query) {
    setState(() {
      _filteredMembers = _allMembers
          .where((member) =>
              member['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
        title: const Text('Speakers'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        toolbarHeight: 50,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 50, // Set the desired height here
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search members...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                onChanged: _filterMembers,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMembers.length,
              itemBuilder: (context, index) {
                return _buildMember(_filteredMembers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMember(Map<String, String> member) {
  String name = member['name']!;
  String designation = member['designation']!;
  String imagePath = member['imagePath']!;
  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      backgroundImage: AssetImage(imagePath),
    ),
    title: Text(
      name,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      designation,
      style: TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
