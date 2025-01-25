import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../model/card_model.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.card, required this.index});

  final CardModel card;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.cardColors[index % AppColors.cardColors.length],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: AssetImage(card.image),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    card.title,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    card.type,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ))
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: card.total > 0
              ? Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.redAccent),
                  child: Center(
                    child: Text(
                      "${card.total}",
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
