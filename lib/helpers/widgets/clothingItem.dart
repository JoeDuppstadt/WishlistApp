

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import 'app_text.dart';


class ClothingItemWidget extends StatelessWidget {
  final String title;
  final String? contentRating;
  final String imageUrl;
  final String description;
  final String brand;
  final String price;

  const ClothingItemWidget({super.key, required this.title, required this.contentRating, required this.imageUrl, required this.description, required this.brand, required this.price });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Book cover image
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                imageUrl.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Opacity(
                    opacity: contentRating.toString().toLowerCase() == 'erotica' || contentRating.toString().toLowerCase() == 'pornographic'? 0.2 : 1,
                    child: Image.network(
                      imageUrl,
                      width: 80.0,
                      height: 120.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
                    : const Placeholder(
                  color: Colors.grey,
                  fallbackHeight: 120.0,
                  fallbackWidth: 80.0,
                ),
              ],
            ),
          ),

          // Book details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(text: title,fontSize: 18,color: AppColors.accentColor,),
                Row(
                  children: [
                    //AppText(text: '$contentRating★',fontSize: 12,color: AppColors.textColor.withOpacity(0.3));
                    //AppText(text: ' ($originalLanguage)',fontSize: 12,color: AppColors.textColor.withOpacity(0.3)),
                    AppText(text: '$brand',fontSize: 12,color: AppColors.textColor.withOpacity(0.3)),
                    AppText(text: ' | \$$price',fontSize: 12,color: AppColors.textColor.withOpacity(0.3)),
                  ],
                ),
                AppText(text: description,fontSize: 12,color: AppColors.textColor.withOpacity(0.8),maxLines: 4,overflow: TextOverflow.ellipsis,),
                // Add more details if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}