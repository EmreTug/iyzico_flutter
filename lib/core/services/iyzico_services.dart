import 'package:flutter/material.dart';
import 'package:iyzico/iyzico.dart';

class Payment {
  final iyzico = Iyzico.fromConfig(
    configuration: const IyziConfig(
        'sandbox-n8I0WrL2MHnwXadZGvUbTHPGtzk1JCn4',
        'sandbox-fZJ5t1IDLE6IrzRtg4lxwkCHvO0cSwTd',
        'https://sandbox-api.iyzipay.com'),
  );
  final double price = 1;
  final double paidPrice = 1.1;

 
  final paymentCard = PaymentCard(
    cardHolderName: 'John fdfdDoe',
    cardNumber: '5526080000000006',
    expireYear: '2030',
    expireMonth: '12',
    cvc: '123',
  );

  final shippingAddress = Address(
      address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      contactName: 'Jane Doe',
      city: 'Istanbul',
      country: 'Turkey');
  final billingAddress = Address(
      address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      contactName: 'Jane Doe',
      city: 'Istanbul',
      country: 'Turkey');

  final buyer = Buyer(
      id: 'BY789',
      name: 'John',
      surname: 'Doe',
      identityNumber: '74300864791',
      email: 'email@email.com',
      registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      city: 'Istanbul',
      country: 'Turkey',
      ip: '85.34.78.112');

  final basketItems = <BasketItem>[
    BasketItem(
        id: 'BI101',
        price: '0.3',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: BasketItemType.PHYSICAL),
    BasketItem(
        id: 'BI102',
        price: '0.5',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: BasketItemType.VIRTUAL),
    BasketItem(
        id: 'BI103',
        price: '0.2',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: BasketItemType.PHYSICAL),
  ];

  void pay()async {
    final paymentResult = await iyzico.CreatePaymentRequest(
      price: 1.0,
      paidPrice: 1.1,
      paymentCard: paymentCard,
      buyer: buyer,
      shippingAddress: shippingAddress,
      billingAddress: billingAddress,
      basketItems: basketItems);

  print(paymentResult.errorMessage);
  }

  /*
  
  Kart numarası(PAN) luhn algoritmasına tabi tutulmalıdır.
Kartın hamilinin adı ve soyadı alınmalıdır.
Son kullanma tarihi geçmiş kartlar ile API'ye sorgu yapılmamalıdır.
AMEX kartları ile işlem alabilir şekilde tasarlanmalıdır.
   */
}
