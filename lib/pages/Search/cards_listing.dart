import 'package:flutter/material.dart';
import 'package:spotify/components/browse_all_cards.dart';
import 'package:spotify/constants.dart';

class cards_listing extends StatelessWidget {
  const cards_listing({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (context, index) {
            browseCard card = cards[index];

            return Container(
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.only(left: 7, top: 7),
              decoration: BoxDecoration(
                color: card.colour,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    card.type.toString(),
                    textAlign: TextAlign.left,
                    style: cardTextStyle,
                  ),
                  Container(
                    //padding: EdgeInsets.only(top: 30, right: 30),
                    width: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        Image(
                          image: AssetImage(card.image.toString()),
                          width: 70,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
