import 'package:flutter/material.dart';

const APP_ID = 'kawan-seh-g857ffuuw9b';//'emou-35yq8omcioqw3nc0';
//f16c5e2f64376916583bf91b5a6fdeb9

class HeroTags {
  static const accountAvatar = 'account-avatar';
  static String roomAvatar({@required int roomId}) {
    return 'room-avatar-$roomId';
  }

  static String roomName({@required String roomName}) {
    return 'room-name-$roomName';
  }
}
