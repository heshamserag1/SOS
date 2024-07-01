// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';

class d_request extends StatelessWidget {
  const d_request({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    List<String> friendRequests = ['Friend 1', 'Friend 2', 'Friend 3'];

    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: logo,
              ))
        ],
        backgroundColor: Colors.white54,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: friendRequests.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(friendRequests[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      // Accept friend request
                      // Add your logic here
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      // Reject friend request
                      // Add your logic here
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
