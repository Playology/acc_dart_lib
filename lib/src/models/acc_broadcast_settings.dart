/// Provides access to the contents of broadcasting.json from the ACC Config directory.
class AccBroadcastSettings {
  /// The password for sending commands to ACC
  String commandPassword = '';

  /// The password for connecting to ACC for receiving data messages
  String connectionPassword = '';

  /// The UDP port that ACC will broadcast data on
  int udpListenerPort = 0;

  AccBroadcastSettings();

  AccBroadcastSettings.fromJson(Map<String, dynamic> json)
      : commandPassword = json['commandPassword'],
        connectionPassword = json['connectionPassword'],
        udpListenerPort = json[
            'updListenerPort']; // not a typo, this is how it is spelled in the json file
}
