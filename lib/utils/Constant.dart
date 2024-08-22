import 'dart:ffi';

class Constant {
  static get maxFileSize => 5000000;


  static String get PUSHER_APP_ID=>"1764889";
  static String get PUSHER_KEY=>"ea17c84e2212c938ae34";
  static String get PUSHER_SECRET=>"1ac8175e2e873b461649";
  static String get PUSHER_CLUSTER=>"mt1";
  static bool get PUSHER_SECURE => true ;

  static get USE_BIOMETRIC_AUTH => "use_biometric_auth";
  static get ACCOUNT_NUMBER => "accountNumber";
  static get CUSTOMER_ID => "customerId";
  static get SESSION_DATA => "please log in again to proceed".toLowerCase();

  static String get STATE => "state";
  static String get getNaira => "₦";
  static String get USERNAME_EMAIL => "email";
  static String get RERESHTOKEN => "refreshToken";
  static String get EXPIRES => "expires";
  static String get TOKEN => "token";
  static String get VERIFIED_STATUS => "verified";
  static String get USER_DETAIL => "user";
  static String get VENDOR_DETAIL => "vendor_user";
  static get tokenType => "token_type";
  static get accessToken => "access_token";
  static get accessTokenPart1 => "partone";
  static get accessTokenPart2 => "parttwo";
  static get accessTokenPart3 => "partthree";

  static String get ID => "id";
  static String get FULLNAME => "fullName";
  static String get LASTNAME => "lastname";
  static String get GENDER => "gender";
  static String get DOB => "dob";
  static String get PHONE => "phone";
  static String get USERNAME => "username";

  static String get ROBOT_DETAIL => "robotDetail";

  static String get COUNTRY_ID => "countryId";
  static String get STATE_ID => "stateId";
  static String get CITY_ID => "cityId";
  static String get ADDRESS => "address";
  static String get EMAIL => "email";
  static String get EMAIL_VERIFIED => "emailVerified";
  static String get EMAIL_VERIFIED_AT => "emailVerifiedAt";
  static String get ACTIVE => "active";

  static String get LASTLOGIN => "lastlogin";
  static String get DELETE_AT => "deletedAt";
  static String get CREATE_AT => "createdAt";
  static String get UPDATE_AT => "updatedAt";

  static String get USER_DATA => "userdata";
}
