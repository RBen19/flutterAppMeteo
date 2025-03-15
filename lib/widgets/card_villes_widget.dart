import 'package:flutter/material.dart';

class CardVillesWidget extends StatelessWidget {
  final nameTown;
  final country;
  final temp_c;
  final wind;
  const CardVillesWidget(
      {super.key, this.nameTown, this.country, this.temp_c, this.wind});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${nameTown}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "${country}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey[500],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${temp_c} °C",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.orangeAccent[700],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.air,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                    SizedBox(width: 6),
                    Text(
                      '${wind} km/h',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.blueGrey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
