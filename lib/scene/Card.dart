import 'package:ant_new/card/card_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  static const List<Map<String, String>> cardData = [
    {'title': 'heading  1', 'description': 'Description  1'},
    {'title': 'heding  2', 'description': 'Description  2'},
    {'title': 'heding  3', 'description': 'Description  3'},
    {'title': 'heding  4', 'description': 'Description  4'},
    {'title': 'heading  5', 'description': 'Alember  5'},
  ];

  final CardSwiperController controller = CardSwiperController();

  final List<CardStyle> cards = cardData
      .map((candidate) => CardStyle(
            title: candidate['title']!,
            description: candidate['description']!,
          ))
      .toList();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (direction.name == "left") {
      debugPrint('to the left $previousIndex');
      return true;
    } else {
      debugPrint('to the right');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).go('/play');
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 60,
                    ))
              ],
            ),
            SizedBox(
              height: 600,
              width: 300,
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                numberOfCardsDisplayed: 1,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(24.0),
                allowedSwipeDirection:
                    const AllowedSwipeDirection.only(left: true, right: true),
                isLoop: false,
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
