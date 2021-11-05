import 'package:casestudy/presentation/modules/list_employees/widget/character_item_widget.dart';
import 'package:flutter/cupertino.dart';

class CharacterPickerWidget extends StatelessWidget {
  final Stream<String> charStream;

  const CharacterPickerWidget({required this.charStream, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> chars = List.generate(26, (int index) => index + 65);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: chars
            .map((int index) => CharacterItemWidget(
                  char: String.fromCharCode(index),
                  charStream: charStream,
                ))
            .toList(),
      ),
    );
  }
}
