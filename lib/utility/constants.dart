import 'dart:io';

import 'package:intl/intl.dart';

import '../core/model/top_up_method.dart';
import '../core/presentation/styles/theme.dart';
import 'app_assets.dart';

String getInitials(String name) => name.isNotEmpty
    ? name.trim().split(' ').map((l) => l[0]).take(2).join()
    : '.';

formatCurrency(amount, currencyCode, {int decimalLength = 2}) {
  var value = double.parse(amount.toString());
  return NumberFormat.simpleCurrency(
          name: currencyCode, decimalDigits: decimalLength, locale: Platform.localeName)
      .format(value);
}

List getTopUpMethods() {
  return <TopUpMethod>[
    // TopUpMethod(
    //     title: 'Via Bank App',
    //     isRecommended: true,
    //     body: 'Deposit directly into your wallet from your bank app',
    //     image: AppAssets.viaBankAppIcon),
    TopUpMethod(
        title: 'Via Bank Transfer',
        body: 'Transfer into a bank account to credit your eNaira wallet',
        image: AppAssets.viaBankTransferIcon),
    // TopUpMethod(
    //     title: 'Via Payment Gateway',
    //     body: 'Access more top-up options via a payment gateway',
    //     image: AppAssets.viaPaymentGatewayIcon),
    // TopUpMethod(
    //     title: 'Request a Top-Up',
    //     body: 'Request Top-Up from other Digcey wallet users in your contact',
    //     image: AppAssets.requestAtopUpIcon),
  ];
}

List<Map> getSendMoneyMethod() {
  return [
    {
      'color': ACCENT_COLOR,
      'title': 'Digcey Wallet User',
      'body':
          'Easily send money to fellow Digcey wallet users  via their Digi tag',
      'image': ''
    },
    {
      'color': ACCENT_COLOR,
      'title': 'Digcey Wallet User',
      'body':
          'Easily send money to fellow Digcey wallet users  via their Digi tag',
      'image': ''
    },
  ];
}

List<Map> getBillMethods() {
  return [
    {'title': 'Airtime', 'icon': AppAssets.airtimeIcon},
    // {'title': 'Internet Subscription', 'icon': AppAssets.wifiIcon},
    // {'title': 'Electricity Bill', 'icon': AppAssets.electricBillIcon},
    // {'title': 'Cable TV Subscriptions', 'icon': AppAssets.cableTvIcon},
    // {'title': 'Betting & Lottery', 'icon': AppAssets.bettingLotteryIcon},
    // {'title': 'Event tickets', 'icon': AppAssets.eventsTicketIcon},
    // {'title': 'Examination Fees', 'icon': AppAssets.examinationFeeIcon},
  ];
}
