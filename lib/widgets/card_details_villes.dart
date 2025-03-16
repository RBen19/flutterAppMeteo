import 'package:flutter/material.dart';

Widget buildInfoCard(IconData icon, String title, String value) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.blueAccent, size: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        value,
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
