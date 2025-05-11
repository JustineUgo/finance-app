
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Netflix Premium',
                  style: TextStyle(
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'Today 08:24 pm',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Text(
            '-\$17.99',
            style: TextStyle(
              color: Color(0xFFff976b),
            ),
          )
        ],
      ),
    );
  }
}