import 'package:flutter/material.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

import 'main.dart';

class RewardedVideoPage extends StatefulWidget {
  @override
  _RewardedVideoPageState createState() => _RewardedVideoPageState();
}

class _RewardedVideoPageState extends State<RewardedVideoPage> {
  @override
  void initState() {
    super.initState();

    Appodeal.setRewardedVideoCallbacks(
      onRewardedVideoLoaded: (isPrecache) => showToast('onRewardedVideoLoaded: isPrecache - $isPrecache'),
      onRewardedVideoFailedToLoad: () => showToast('onRewardedVideoFailedToLoad'),
      onRewardedVideoShown: () => showToast('onRewardedVideoShown'),
      onRewardedVideoShowFailed: () => showToast('onRewardedVideoShowFailed'),
      onRewardedVideoFinished: (amount, reward) => showToast('onRewardedVideoFinished: amount - $amount, reward - $reward'),
      onRewardedVideoClosed: (isFinished) => showToast('onRewardedVideoClosed isFinished - $isFinished'),
      onRewardedVideoExpired: () => showToast('onRewardedVideoExpired'),
      onRewardedVideoClicked: () => showToast('onRewardedVideoClicked'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rewarded Video'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), fixedSize: Size(300, 20)),
                  onPressed: () async {
                    var isInitialized = await Appodeal.isInitialized(Appodeal.REWARDED_VIDEO);
                    showToast('Rewarded video isInitialized - $isInitialized');
                  },
                  child: const Text('IS INITIALIZED?'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), fixedSize: Size(300, 20)),
                  onPressed: () async {
                    var isCanShow = await Appodeal.canShow(Appodeal.REWARDED_VIDEO);
                    showToast('Rewarded video canShow - $isCanShow');
                  },
                  child: const Text('CAN SHOW?'),
                ),
              ],
            ),
            //Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), fixedSize: Size(300, 20)),
                  onPressed: () {
                    Appodeal.cache(Appodeal.REWARDED_VIDEO);
                  },
                  child: const Text('CACHE REWARDED VIDEO'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), fixedSize: Size(300, 20)),
                  onPressed: () {
                    Appodeal.show(Appodeal.REWARDED_VIDEO);
                  },
                  child: const Text('SHOW REWARDED VIDEO'),
                ),
              ],
            ),
            //Interstitial
          ]),
        ),
      ),
    );
  }
}
