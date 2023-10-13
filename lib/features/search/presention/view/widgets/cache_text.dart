import 'package:clean_architecture_bookly/core/utils/constants_manager.dart';
import 'package:hive/hive.dart';


saveSearchTextData(String text) {
  var box = Hive.box<String>(kSearchTextBox);
  box.put(kSearchTextBox, text);

  getSearchTextData(box);

}

getSearchTextData(var box) {
   boxData = box.get(kSearchTextBox);
}

String boxData='';
