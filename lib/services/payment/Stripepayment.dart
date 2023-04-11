// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:stripe_payment/stripe_payment.dart';
//
// class StripeTransactionResponse {
//   String? message;
//   bool? success;
//   StripeTransactionResponse({
//     this.message,
//     this.success,
//   });
// }
//
// class StripeServices {
//   static String apiBase = 'https://api.stripe.com/v1';
//   static String paymentApiUrl = '${StripeServices.apiBase}/payment_intents';
//   static Uri paymentApiUri = Uri.parse(paymentApiUrl);
//   static String secret =
//       'sk_test_51JWfVJCTeq2NYD04Drr9SJJcQQfTgJodmC2SMyPxL3HxCvZfkTTqvb2TwHb1fERbYc8a8mFcnif6aJ32jfnS0lAo00lQT7Qgxh';
//   //'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';
//
//   static Map<String, String> headers = {
//     'Authorization': 'Bearer $secret',
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };
//
//   static init() {
//     StripePayment.setOptions(StripeOptions(
//         publishableKey:
//             'pk_test_51JWfVJCTeq2NYD04ikuRCYqL0d04yT1q7PmG0IR8pevfbs0WiZ8PynF1JXZblbuwyGOUXgH5Kx7xFamgcmqROpwE00xfm7H4Tn',
//         // 'pk_live_51JWfVJCTeq2NYD04d7gqQvPEOwhjC607Uk84pxQylLYJMav91mjRctKsAVtpzrWrdfp7uhywuz1uAfe4qnDlSYHY00gDv4ymc6',
//         androidPayMode: 'test',
//         merchantId: 'test'
//             ''));
//   }
//
//   static Future<Map<String, dynamic>> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': amount,
//         'currency': currency,
//       };
//
//       var response =
//           await http.post(paymentApiUri, headers: headers, body: body);
//       return jsonDecode(response.body);
//     } catch (error) {
//       throw error;
//     }
//   }
//
//   static Future<StripeTransactionResponse> payNowHandler(
//       {String? amount, String? currency}) async {
//     try {
//       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
//           CardFormPaymentRequest());
//       var paymentIntent =
//           await StripeServices.createPaymentIntent(amount!, currency!);
//       var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
//           clientSecret: paymentIntent['client_secret'],
//           paymentMethodId: paymentMethod.id));
//
//       if (response.status == 'succeeded') {
//         return StripeTransactionResponse(
//             message: 'Transaction succeful', success: true);
//       } else {
//         return StripeTransactionResponse(
//             message: 'Transaction failed', success: false);
//       }
//     } on PlatformException catch (error) {
//       return StripeServices.getErrorAndAnalyze(error);
//     } catch (error) {
//       return StripeTransactionResponse(message: 'error', success: false);
//     }
//   }
//
//   static getErrorAndAnalyze(err) {
//     String message = 'Something went wrong';
//     if (err.code == 'cancelled') {
//       message = 'Transaction canceled';
//     }
//     return StripeTransactionResponse(
//         message: 'message: $message', success: false);
//   }
// }
