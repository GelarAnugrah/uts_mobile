import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Daftar halaman untuk masing-masing tab
  final List<Widget> _pages = [
    Center(child: Text('Tidak ada vouher yang tersedia')),
    ProfilePage(),
    ShopListPage(), // Mengubah halaman ini untuk menampilkan daftar toko
  ];

  // Fungsi untuk mengubah tab saat dipilih
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getvocher'),
      ),
      body: _pages[_currentIndex], // Menampilkan halaman berdasarkan tab yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String phoneNumber;

  ProfilePage({
    this.username = 'gelar anugrah',
    this.email = 'gelaranugrah@gmai.com',
    this.phoneNumber = '12345',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'), // Gambar background
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Username: $username',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            'Email: $email',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            'Phone Number: $phoneNumber',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Implement edit functionality here if needed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit Profile feature is under development')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}

// Halaman untuk menampilkan daftar toko
class ShopListPage extends StatelessWidget {
  final List<Map<String, String>> shops = [
    {
      'name': 'Indomaret',
      'address': 'Jalan Inhoftank, Bandung',
    },
    {
      'name': 'Alfamaret',
      'address': 'Jalan Soekarno Hatta, Bandung',
    },
    {
      'name': 'Yomart',
      'address': 'Mekarwangi, Bandung',
    },
    {
      'name': 'Shell',
      'address': 'Jalan Soekarno Hatta, Bandung',
    },
    {
      'name': 'Cinepolis',
      'address': 'Istana Plaza, Bandung',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpeg'), // Gambar background
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(shops[index]['name']!),
            subtitle: Text(shops[index]['address']!),
            leading: Icon(Icons.store),
            onTap: () {
              // Fungsi saat toko dipilih
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda memilih ${shops[index]['name']}')),
              );
            },
          );
        },
      ),
    );
  }
}
