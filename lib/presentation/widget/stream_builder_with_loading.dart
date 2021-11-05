import 'package:casestudy/presentation/widget/app_loading_widget.dart';
import 'package:flutter/widgets.dart';

class StreamBuilderWithLoading<T extends Object> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(T) builder;

  const StreamBuilderWithLoading(
      {required this.stream, required this.builder, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (_, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data!);
        }
        return const AppLoadingWidget();
      },
    );
  }
}
