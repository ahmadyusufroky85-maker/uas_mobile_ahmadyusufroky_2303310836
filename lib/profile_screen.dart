import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.orangeAccent,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 30),
              _buildInfoCard("Nama Lengkap", "AHMAD YUSUF ROKY"),
              _buildInfoCard("Nomor Induk Mahasiswa (NIM)", "2303310836"),
              _buildInfoCard("Program Studi", "Teknik Informatika"),
              _buildInfoCard("Universitas", "Universitas Satya Terra Bhinneka"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
