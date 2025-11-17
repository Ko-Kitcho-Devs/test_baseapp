import 'package:flutter/material.dart';
import '../../../domain/user/entities/user.dart';


class UserCard extends StatelessWidget {
  final User user; 
  final VoidCallback? onTap; 
  final VoidCallback? onDelete; 

  const UserCard({
    super.key,
    required this.user,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap, 
        leading: CircleAvatar(
          
          child: Text(
            ((user.firstName ?? '').isNotEmpty ? user.firstName![0] : '?'),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text('${user.firstName ?? ''} ${user.lastName ?? ''}'),
        subtitle: Text(user.email ?? ''),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete, 
        ),
      ),
    );
  }
}
