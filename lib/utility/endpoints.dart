class Endpoints {
  // static const baseUrl = 'https://columnhack.com/api/v1';
  static const baseUrl = 'http://localhost:7070/api/v1';

  static const initializePayment = "/payments/initialize";
  static const verifyPayment = "/payments/verify";
  static const login = "/auth/admin/login";
  static const String userInfo = "/users";
  static const forgotPassword = "/auth/password";
  static const requestToken = "/auth/otp";
  static const validate = "/auth/password";
  static const changePassword = "/auth/password";
  static const updateProfile = "/auth/password";
  static const verifyOtp = "/auth/otp";
  static const String signup = "/auth/signup";
  static const String subscribeUser = "/subscriptions/user";
  static const String getSubscriptions = "/subscriptions";
  static const String coupons = "/coupons";
}
