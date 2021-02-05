import 'dart:collection';

import 'package:lpinyin/src/dict_data.dart';

/// Pinyin Resource.
class PinyinResource {
  /// get Pinyin Resource.
  static Map<String, String> getPinyinResource() {
    return getResource(pinyinDict);
  }

  // get zh-hans Resource.
  static Map<String, String> getZhHansResource() {
    return getResource(chineseDict, reverseKeyValue: true);
  }

  /// get zh-hant Resource.
  static Map<String, String> getZhHantResource() {
    return getResource(chineseDict);
  }

  /// get Multi Pinyin Resource.
  static Map<String, String> getMultiPinyinResource() {
    return getResource(multiPinyinDict);
  }

  /// get Resource.
  static Map<String, String> getResource(List<String> list,
      {bool reverseKeyValue = false}) {
    Map<String, String> map = HashMap();
    List<MapEntry<String, String>> mapEntryList = List();
    for (int i = 0, length = list.length; i < length; i++) {
      List<String> tokens = list[i].trim().split('=');
      MapEntry<String, String> mapEntry = reverseKeyValue
          ? MapEntry(tokens[1], tokens[0])
          : MapEntry(tokens[0], tokens[1]);
      mapEntryList.add(mapEntry);
    }
    map.addEntries(mapEntryList);
    return map;
  }
}
