import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'constants.dart';

/// Provides paths for ACC folders when installed locally
class AccPathProvider {

  /// Get the path to the ACC directory within the users Documents directory
  static Future<String> getDocumentsDirectory() async {
    var appDocumentsDirectory = await getApplicationDocumentsDirectory();
    return join(appDocumentsDirectory.path, Constants.accDocumentsDirectoryName);
  }
  
  /// Get the path to the config directory within the ACC documents directory
  static Future<String> getConfigDirectory() async {    
    var documentsDirectory = await getDocumentsDirectory();
    return join(documentsDirectory, Constants.accConfigDirectoryName);
  }

  /// Get the path to the ACC broadcast settings file
  static Future<String> getBroadcastFilePath() async {
    var configDirectory = await getConfigDirectory();
    return join(configDirectory, Constants.accBroadcastFileName);
  }
}