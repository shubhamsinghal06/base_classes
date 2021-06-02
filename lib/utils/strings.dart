class Strings {
  // route fields
  static String appName = 'AppName';
  static String countryCode = '';
  static String countryCodeIndia = '+91';
  static String countryCodeUS = '+1';

  // general fields
  static String upload = 'Upload';
  static String cancel = 'Cancel';
  static String save = 'Save';
  static String update = 'Update';
  static String enterHere = 'Enter here';
  static String searchHere = 'Enter here';

  static String pleaseEnter(text) => 'Please enter $text';

  static String pleaseSelect(text) => 'Please select $text';

  static String please(text) => 'Please $text';

  static String invalid(text) => 'Invalid $text';

  static String noMode(data) => 'No more $data';

  static String ok = 'Ok';
  static String yes = 'Yes';
  static String no = 'No';
  static String submit = 'Submit';

  static String add = 'Add';
  static String dateFormat = 'MMMM dd, yyyy';
  static String continueText = 'Continue';

  static String dummy = 'dummy';
  static String dummyImageURL =
      'https://img2.pngio.com/index-of-areaedu-wp-content-uploads-2016-02-default-png-600_600.png';

  static String somethingWrong =
      'Something went wrong. Please try again later.';
  static String internetError = 'Please check your internet connection';

  static String noMoreData = 'No more data';

  // fcm keys
  static String androidFcmKey = 'notification';
  static String iosFcmKey = 'aps';
  static String titleFcmKey = 'title';
  static String bodyFcmKey = 'body';
  static String dataFcmKey = 'data';
  static String alertFcmKey = 'alert';
  static String actionType = 'action_type';
  static String actionId = 'action_id';
  static String actionText = 'action_text';
  static String messageKey = 'message';

  // fcm
  static String channelId = '1';
  static String channelName = 'base';
  static String channelDescription = 'base';
  static int notifyId = 0;
  static String iconFcmPath = '@mipmap/ic_launcher';

  // {notification: {body: Test App Notification for user, title: BaseApp }, data: {click_action: FLUTTER_NOTIFICATION_CLICK, action_id: 1, action_text: Hi User !! This is test notification with custom data, action_type: trialScreen}}

  //tabs
  static String home = 'Home';
  static String tabTwo = 'Tab 2';
  static String tabThree = 'Tab 3';
  static String tabFour = 'Tab 4';

  //drawer
  static String menu = 'Menu';
  static String darkTheme = 'Dark Theme';
  static String logout = 'Logout';

  //image picker
  static String gallery = 'Gallery';
  static String camera = 'Camera';
  static String image = 'Image';
  static String video = 'Video';
  static String typeHere = 'Type Here';
  static String noImageSelected = 'No Image selected?';

  static String logoutSubHeader = 'Are you sure you want to logout ?';

  static String errorConnectionOpenTimeout =
      'Oops!! Your network request was open for so long';
  static String errorConnectionSentTimeout =
      'Sorry!! Your data is not sent within time';
  static String errorConnectionReceiveTimeout =
      'Oops!! Your data is not received within time';
  static String errorIncorrectStatus = 'Oops!! Something went wrong!!';
  static String errorRequestCancelled = 'Oops!! Your cancelled it';

  static String trial = 'Trial';
  static String arguments = 'arguments';
}
