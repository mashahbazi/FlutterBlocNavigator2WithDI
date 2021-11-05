import 'package:casestudy/presentation/modules/list_employees/widget/character_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterPickerWidget extends StatelessWidget {
  final Stream<String> charStream;
  final Future<void> Function(String) onSelectChar;

  const CharacterPickerWidget({
    required this.charStream,
    required this.onSelectChar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> chars = List.generate(26, (int index) => index + 65);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: chars
            .map(_buildCharWidget)
            .toList(),
      ),
    );
  }

  Widget _buildCharWidget(int index) {
    String char = String.fromCharCode(index);
    return InkWell(
      onTap: () {
        onSelectChar(char);
      },
      child: CharacterItemWidget(
        char: char,
        charStream: charStream,
      ),
    );
  }
}
