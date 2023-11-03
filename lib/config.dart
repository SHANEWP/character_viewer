class Config {
  static String? propertyKey;
  static String? appName;
  static String? apiUrl;
  static String? listScreenImageUrl;
  static String placeholderImage = 'assets/placeholder.png';

//Call the method corrisponding to the desired application variation
//to set the properties appropriately
  static void setAppConfigurations() {
    simpsonsCharacterViewer();
    //theWireCharacterViewer();
  }

  //Set the properties that are specific to each app variation
  //in the corresponding methods
  static void simpsonsCharacterViewer() {
    appName = 'Simpsons Character Viewer';
    apiUrl = 'http://api.duckduckgo.com/?q=simpsons+characters&format=json';
    listScreenImageUrl = 'assets/simpsons.png';
    propertyKey = 'simpsons';
  }

  static void theWireCharacterViewer() {
    appName = 'The Wire Character Viewer';
    apiUrl = 'http://api.duckduckgo.com/?q=the+wire+characters&format=json';
    listScreenImageUrl = 'assets/wire.png';
    propertyKey = 'wire';
  }
}
