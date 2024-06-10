import '../cloud_functions/cloud_functions.dart';

export 'package:flutter/foundation.dart';
export 'package:flutter_braintree/flutter_braintree.dart';

const isProdPayments = false;

// Test Braintree Credentials
const kTestBraintreeTokenizationKey = 'caja de arena_zj6p9r8d_t5zvzkmg3ntg9c66';
const kTestGoogleMerchantId = '';
const kTestAppleMerchantId = '';

// Production Braintree Credentials
const kProdBraintreeTokenizationKey = 'caja de arena_zj6p9r8d_t5zvzkmg3ntg9c66';
const kProdGoogleMerchantId = '';
const kProdAppleMerchantId = '';

String braintreeClientToken() => isProdPayments
    ? kProdBraintreeTokenizationKey
    : kTestBraintreeTokenizationKey;
String googleMerchantId() =>
    isProdPayments ? kProdGoogleMerchantId : kTestGoogleMerchantId;
String appleMerchantId() =>
    isProdPayments ? kProdAppleMerchantId : kTestAppleMerchantId;

class PaymentResponse {
  const PaymentResponse({this.transactionId, this.errorMessage});
  final String? transactionId;
  final String? errorMessage;
}

Future<PaymentResponse> processBraintreePayment(
  double amount,
  String paymentNonce, [
  String? deviceData,
]) async {
  const callName = isProdPayments
      ? 'processBraintreePayment'
      : 'processBraintreeTestPayment';
  final response = await makeCloudCall(
    callName,
    {
      'amount': amount,
      'paymentNonce': paymentNonce,
      if (deviceData != null) 'deviceData': deviceData,
    },
  );
  if (response.containsKey('transactionId')) {
    return PaymentResponse(transactionId: response['transactionId']);
  }
  if (response.containsKey('error')) {
    return PaymentResponse(errorMessage: response['error']);
  }
  return const PaymentResponse(errorMessage: 'Unknown error occured');
}

double computeTotal(double baseTotal,
    {double taxRate = 0.0, double shippingCost = 0.0}) {
  final total = baseTotal * (1 + taxRate / 100) + shippingCost;
  return (total * 100).roundToDouble() / 100;
}
