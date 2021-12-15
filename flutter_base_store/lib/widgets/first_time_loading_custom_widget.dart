import 'package:flutter/cupertino.dart';
import 'package:flutter_base_store/headers.dart';
import 'package:gap/gap.dart';

class FirstTimeLoadingIndicatorWidget extends StatelessWidget {
  const FirstTimeLoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CupertinoActivityIndicator(),
            Gap(15),
            Text('Loading...', style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class FirstTimeLoadingErrorReloadWidget extends StatelessWidget {
  final void Function() onPressed;
  const FirstTimeLoadingErrorReloadWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.replay_circle_filled, size: 25, color: Colors.grey),
              Gap(15),
              Text('Tap to reload', style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
