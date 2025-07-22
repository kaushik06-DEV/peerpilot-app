import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/user_service.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void loadProfile() async {
    final data = await UserService.fetchUserById(1); // Static user
    setState(() => user = data);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void _editProfile() {
    final nameController = TextEditingController(text: user!.name);
    final bioController = TextEditingController(text: 'Your bio here');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                user = user!.copyWith(name: nameController.text);
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/images/avatar.png') as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, size: 18, color: Colors.indigo),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  user!.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Level ${user!.level} • ${user!.points} pts • 🔥 ${user!.streak}d',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _editProfile,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          if (user!.badges.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8,
                children: user!.badges.map((badge) => Chip(label: Text(badge))).toList(),
              ),
            ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About the App'),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'PeerPilot',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2025 PeerPilot Inc.',
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text('Contact Support'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logged out! (Not implemented)')),
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
