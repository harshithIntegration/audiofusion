import 'package:flutter/material.dart';

class Exibitors extends StatefulWidget {
  const Exibitors({super.key});

  @override
  State<Exibitors> createState() => _ExibitorsState();
}

class _ExibitorsState extends State<Exibitors> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMembers = [];
  List<Map<String, String>> _allMembers = [
    {
      'name': 'John Doe',
      'designation': 'Chairperson',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Jane Smith',
      'designation': 'Vice Chairperson',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Michael Johnson',
      'designation': 'Secretary',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Emily Brown',
      'designation': 'Treasurer',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Alice Johnson',
      'designation': 'Event Coordinator',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Bob Smith',
      'designation': 'Marketing Manager',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Ella Davis',
      'designation': 'Public Relations Officer',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Jack Wilson',
      'designation': 'Finance Director',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Sophia Brown',
      'designation': 'Membership Secretary',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'William Taylor',
      'designation': 'Technical Lead',
      'imagePath': 'assets/avatar.png',
    },
    {
      'name': 'Sanketh Dani',
      'designation': 'Technical Lead',
      'imagePath': 'assets/avatar.png',
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
        title: const Text('Exhibitors'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
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
              height: 50,
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
