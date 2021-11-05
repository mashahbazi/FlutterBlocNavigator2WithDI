import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CharacterItemWidget extends StatelessWidget {
  final String char;
  final Stream<String> charStream;

  const CharacterItemWidget({
    required this.char,
    required this.charStream,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: charStream
          .map<bool>((String selectedChar) =>
              selectedChar.toUpperCase() == char.toUpperCase())
          .distinct(),
      builder: (_, AsyncSnapshot<bool> snapshot) {
        bool isSelected = snapshot.data ?? false;
        return Text(
          char,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? AppColors.black : AppColors.gray,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        );
      },
    );
  }
}
