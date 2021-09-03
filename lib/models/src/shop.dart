class Shop {
  final String description;
  final String moneyFormat;
  final String name;
  final PaymentSettings paymentSettings;
  final PrimaryDomain primaryDomain;
  final PrivacyPolicy privacyPolicy;
  final RefundPolicy refundPolicy;
  final List<String> shipsToCountries;
  final TermsOfService termsOfService;

  Shop(
      {required this.description,
      required this.moneyFormat,
      required this.name,
      required this.paymentSettings,
      required this.primaryDomain,
      required this.privacyPolicy,
      required this.refundPolicy,
      required this.shipsToCountries,
      required this.termsOfService});

  static Shop fromJson(Map<String, dynamic> json) {
    return Shop(
      description: (json['shop'] ?? const {})['description'],
      moneyFormat: (json['shop'] ?? const {})['moneyFormat'],
      name: (json['shop'] ?? const {})['name'],
      paymentSettings: PaymentSettings.fromJson(
          (json['shop'] ?? const {})['paymentSettings'] ?? const {}),
      primaryDomain: PrimaryDomain.fromJson(
          (json['shop'] ?? const {})['primaryDomain'] ?? const {}),
      privacyPolicy: PrivacyPolicy.fromJson(
          (json['shop'] ?? const {})['privacyPolicy'] ?? const {}),
      refundPolicy: RefundPolicy.fromJson(
          (json['shop'] ?? const {})['refundPolicy'] ?? const {}),
      shipsToCountries: _getShipsToCountryList(json['shop'] ?? const {}),
      termsOfService: TermsOfService.fromJson(
          (json['shop'] ?? const {})['termsOfService'] ?? const {}),
    );
  }

  static _getShipsToCountryList(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['shipsToCountries']
        .forEach((shipString) => stringList.add(shipString));
    return stringList;
  }
}

class PaymentSettings {
  final List<String> acceptedCardBrands;
  final String cardVaultUrl;
  final String countryCode;
  final String currencyCode;
  final List<String> enabledPresentmentCurrencies;
  final String shopifyPaymentAccountId;
  final List<String> supportedDigitalWallets;

  PaymentSettings(
      {required this.acceptedCardBrands,
      required this.cardVaultUrl,
      required this.countryCode,
      required this.currencyCode,
      required this.enabledPresentmentCurrencies,
      required this.shopifyPaymentAccountId,
      required this.supportedDigitalWallets});

  static PaymentSettings fromJson(Map<String, dynamic> json) {
    return PaymentSettings(
        acceptedCardBrands: _getAcceptedCardBrands(json),
        cardVaultUrl: json['cardVaultUrl'],
        countryCode: json['countryCode'],
        currencyCode: json['currencyCode'],
        enabledPresentmentCurrencies: _getEnabledPresentmentCurrencies(json),
        shopifyPaymentAccountId: json['shopifyPaymentAccountId'],
        supportedDigitalWallets: _getSupportedDigitalWallets(json));
  }

  static _getAcceptedCardBrands(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['acceptedCardBrands'].forEach((e) => stringList.add(e));
    return stringList;
  }

  static _getEnabledPresentmentCurrencies(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['enabledPresentmentCurrencies'].forEach((e) => stringList.add(e));
    return stringList;
  }

  static _getSupportedDigitalWallets(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['supportedDigitalWallets'].forEach((e) => stringList.add(e));
    return stringList;
  }
}

class PrimaryDomain {
  final String host;
  final bool sslEnabled;
  final String url;

  PrimaryDomain(
      {required this.host, required this.sslEnabled, required this.url});

  static PrimaryDomain fromJson(Map<String, dynamic> json) {
    return PrimaryDomain(
        host: json['host'] ?? const {},
        sslEnabled: json['sslEnabled'] ?? const {},
        url: json['url'] ?? const {});
  }
}

class PrivacyPolicy {
  final String body;
  final String handle;
  final String id;
  final String title;
  final String url;

  PrivacyPolicy(
      {required this.body,
      required this.handle,
      required this.id,
      required this.title,
      required this.url});

  static PrivacyPolicy fromJson(Map<String, dynamic> json) {
    return PrivacyPolicy(
        body: json['body'],
        handle: json['handle'],
        id: json['id'],
        title: json['title'],
        url: json['url']);
  }
}

class RefundPolicy {
  final String body;
  final String handle;
  final String id;
  final String title;
  final String url;

  RefundPolicy(
      {required this.body,
      required this.handle,
      required this.id,
      required this.title,
      required this.url});

  static RefundPolicy fromJson(Map<String, dynamic> json) {
    return RefundPolicy(
        body: json['body'],
        handle: json['handle'],
        id: json['id'],
        title: json['title'],
        url: json['url']);
  }
}

class TermsOfService {
  final String body;
  final String handle;
  final String id;
  final String title;
  final String url;

  TermsOfService(
      {required this.body,
      required this.handle,
      required this.id,
      required this.title,
      required this.url});

  static TermsOfService fromJson(Map<String, dynamic> json) {
    return TermsOfService(
        body: json['body'],
        handle: json['handle'],
        id: json['id'],
        title: json['title'],
        url: json['url']);
  }
}
