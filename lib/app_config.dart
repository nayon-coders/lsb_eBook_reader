import 'package:flutter/material.dart';


class AppConfig {

  static const String appName = 'LSB e BooK';
  static const String DOMAIN = 'https://e-book-node-server.onrender.com';
  static const String API = 'api/v1';
  static const String BASE_URL = '$DOMAIN/$API';

  //USER AUTH API
  static const String LOGIN = '$BASE_URL/user/login';
  static const String REGISTER = '$BASE_URL/user/signup';
  static const String FORGOT_PASSWORD = '$BASE_URL/user/forgot-password';
  static const String RESET_PASSWORD = '$BASE_URL/user/reset-password';
  static const String VERIFY_OTP = '$BASE_URL/user/verify-otp';
  static const String USER_GET = '$BASE_URL/user/me';
  static const String USER_PASS_UPDATE = '$BASE_URL/user/update-password';
  static const String USER_UPDATE = '$BASE_URL/user/update';
  static const String USER_DELETE = '$BASE_URL/user/delete/';

  //BOOK API
  static const String BOOK_GET = '$BASE_URL/book/all';
  static const String BOOK_GET_BY_ID = '$BASE_URL/book/';
  static const String PERAGRAPH_GET_BY_ID = '$BASE_URL/paragraph/';


  //FAVORITE API
  static const String FAVORITE_CREATE = '$BASE_URL/favorite/create';
  static const String FAVORITE_GET = '$BASE_URL/favorite/all';
  static const String FAVORITE_DELETE = '$BASE_URL/favorite/delete/';
  static const String FAVORITE_CHECK = '$BASE_URL/favorite/check/';


  //TOPIC API
  static const String TOPI_GET_BY_BOOK_ID = '$BASE_URL/main-toc/w-sub/';
  static const String TOPIC_GET = '$BASE_URL/topic/all';
  static const String TOPIC_GET_BY_ID = '$BASE_URL/main-toc/';
  static const String TOPIC_CREATE = '$BASE_URL/topic/create';
  static const String TOPIC_UPDATE = '$BASE_URL/topic/update/';
  static const String TOPIC_DELETE = '$BASE_URL/topic/delete/';

  //SUBTOPIC API
  static const String SUBTOPIC_GET_BY_ID = '$BASE_URL/sub-toc/';


  //Shipping Address
  static const String ADD_SHIPPING_ADDRESS ="$BASE_URL/delivery-address/create"; //POST
  static const String GET_SHIPPING_ADDRESS ="$BASE_URL/delivery-address"; //GET
  static const String DELETE_SHIPPING_ADDRESS ="$BASE_URL/delivery-address/delete/"; //DELETE ID
  static const String UPDATE_SHIPPING_ADDRESS ="$BASE_URL/delivery-address/update/"; //DELETE ID


  //My Order
  static const String GET_MY_ORDER ="$BASE_URL/order/my"; //GET USER
  static const String PLACE_ORDER ="$BASE_URL/order/create"; //GET USER


  //banner
  static const String GET_ALL_BANNER = "$BASE_URL/banner/all";

  //mark text
  static const String MARK_TEXT = "$BASE_URL/mark-text/create";
  static const String GET_MARK_TEXT = "$BASE_URL/mark-text/all";
  static const String DELETE_MARK_TEXT = "$BASE_URL/mark-text/delete/";
  static const String CHECK_MARK_TEXT_IS_ADDED = "$BASE_URL/mark-text/check/";


  //payemt
  static const String PAYMENT_GET = "$BASE_URL/payment-method/all";



}