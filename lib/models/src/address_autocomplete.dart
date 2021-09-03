class LocationInput {
  final double latitude;
  final double longitude;

  const LocationInput({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}

class AddressPrediction {
  final String addressId;
  final String description;
  final List<MatchedSubstring> matchedSubstrings;

  const AddressPrediction({
    required this.addressId,
    required this.description,
    required this.matchedSubstrings,
  });

  static AddressPrediction fromJson(Map<String, dynamic> json) {
    return AddressPrediction(
      addressId: json['addressId'],
      description: json['description'],
      matchedSubstrings: (json['matchedSubstrings'] as List)
          .map((e) => MatchedSubstring.fromJson(e))
          .toList(),
    );
  }
}

class MatchedSubstring {
  final int length;
  final int offset;

  const MatchedSubstring({
    required this.length,
    required this.offset,
  });

  static MatchedSubstring fromJson(Map<String, dynamic> json) {
    return MatchedSubstring(
      length: json['length'],
      offset: json['offset'],
    );
  }
}

class AddressDetails {
  final String? address1;
  final String? address2;
  final String? city;
  final String? company;
  final String? completionService;
  final String? country;
  final String? countryCode;
  final double? latitude;
  final double? longitude;
  final String? province;
  final String? provinceCode;
  final String? zip;

  const AddressDetails({
    required this.address1,
    required this.address2,
    required this.city,
    required this.company,
    required this.completionService,
    required this.country,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
    required this.province,
    required this.provinceCode,
    required this.zip,
  });

  static AddressDetails fromJson(Map<String, dynamic> json) {
    return AddressDetails(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      company: json['company'],
      completionService: json['completionService'],
      country: json['country'],
      countryCode: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      province: json['province'],
      provinceCode: json['provinceCode'],
      zip: json['zip'],
    );
  }
}
