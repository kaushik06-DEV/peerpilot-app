import 'package:flutter/material.dart';
import '../models/user.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;
  final Function(User) onSave;

  const EditProfileScreen({super.key, required this.user, required this.onSave});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
  }

  void _saveProfile() {
    final updatedUser = widget.user.copyWith(name: _nameController.text);
    widget.onSave(updatedUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
