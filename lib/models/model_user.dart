
class UsersDataModel{
  num? limit;
  num? skip;
  num? total;
  List<UsersModel>? users;

  UsersDataModel({required this.limit, required this.skip,
      required this.total, required this.users});

  factory UsersDataModel.fromJson(Map<String,dynamic> json){
    List<UsersModel> listUserModel = [];

    for(Map<String,dynamic> eachMap in json['users']){
      listUserModel.add(UsersModel.fromJson(eachMap));
    }

    return UsersDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        users: listUserModel );
  }
}

class UsersModel {
  num? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  num? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  num? height;
  num? weight;
  String? eyeColor;
  UserHairModel? hair;
  String? domain;
  String? ip;
  UserAddressModel? address;
  String? macAddress;
  String? university;
  UserBankModel? bank;
  UserCompanyModel? company;
  String? ein;
  String? ssn;
  String? userAgent;
  UserCryptoModel? crypto;

  UsersModel({required this.address,
    required this.age,
    required this.bank,
    required this.birthDate,
    required this.bloodGroup,
    required this.company,
    required this.crypto,
    required this.domain,
    required this.ein,
    required this.email,
    required this.eyeColor,
    required this.firstName,
    required this.gender,
    required this.hair,
    required this.height,
    required this.id,
    required this.image,
    required this.ip,
    required this.lastName,
    required this.macAddress,
    required this.maidenName,
    required this.password,
    required this.phone,
    required this.ssn,
    required this.university,
    required this.userAgent,
    required this.username,
    required this.weight});

  factory UsersModel.fromJson(Map<String, dynamic> json){
    return UsersModel(
        address: json['address']!=null
            ? UserAddressModel.fromJson(json['address'])
            : null,
        age: json['age'],
        bank: UserBankModel.fromJson(json['bank'])  ,
        birthDate: json['birthDate'],
        bloodGroup: json['bloodGroup'],
        company: UserCompanyModel.fromJson(json['company']),
        crypto: UserCryptoModel.fromJson(json['crypto']),
        domain: json['domain'],
        ein: json['ein'],
        email: json['email'],
        eyeColor: json['eyeColor'],
        firstName: json['firstName'],
        gender: json['gender'],
        hair: json['hair'] !=null
            ? UserHairModel.fromJson(json['hair'])
            : null,
        height: json['height'],
        id: json['id'],
        image: json['image'],
        ip: json['ip'],
        lastName: json['lastName'],
        macAddress: json['macAddress'],
        maidenName: json['maidenName'],
        password: json['password'],
        phone: json['phone'],
        ssn: json['ssn'],
        university: json['university'],
        userAgent: json['userAgent'],
        username: json['username'],
        weight: json['weight']);
  }
}

class UserHairModel {
  String? color;
  String? type;

  UserHairModel({
    required this.color,
    required this.type});

  factory UserHairModel.fromJson(Map<String, dynamic> json){
    return UserHairModel(
        color: json['color'],
        type: json['type']
    );
  }

}

class UserAddressModel {
  String? address;
  String? city;
  UserCompanyAddressCoordinatesModel? coordinates;
  String? postalCode;
  String? state;

  UserAddressModel({required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state});

  factory UserAddressModel.fromJson(Map<String, dynamic> json){
    return UserAddressModel(
        address: json['address'],
        city: json['city'],
        coordinates: json['coordinates'] !=null
            ? UserCompanyAddressCoordinatesModel.fromJson(json['coordinates'])
            :null,
        postalCode: json['postalCode'],
        state: json['state'] );
  }
}

// class UserAddressCoodinatesModel{
//   num? lat;
//   num? lng;
//   UserAddressCoodinatesModel({required this.lat, required this.lng});
//   factory UserAddressCoodinatesModel.fromJson(Map<String,dynamic> json){
//     return UserAddressCoodinatesModel(
//         lat : json['lat'],
//         lng : json['lng']);
//   }
// }

class UserCompanyAddressCoordinatesModel {
  num? lat;
  num? lng;
  UserCompanyAddressCoordinatesModel({required this.lat, required this.lng});
  factory UserCompanyAddressCoordinatesModel.fromJson(Map<String, dynamic> json){
    return UserCompanyAddressCoordinatesModel(
        lat: json['lat'],
        lng: json['lng']);
  }
}

class UserBankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  UserBankModel({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban});

  factory UserBankModel.fromJson(Map<String, dynamic> json){
    return UserBankModel(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban']
    );
  }
}

class UserCompanyModel {
  UserCompanyAddressModel address;
  String? department;
  String? name;
  String? title;
  UserCompanyModel({
        required this.address,
        required this.department,
        required this.name,
        required this.title});
  factory UserCompanyModel.fromJson(Map<String, dynamic> json){
    return UserCompanyModel(
        address: UserCompanyAddressModel.fromJson(json['address']),
        department: json['department'],
        name: json['name'],
        title: json['title']);
  }
}

class UserCompanyAddressModel {
  String? address;
  String? city;
  UserCompanyAddressCoordinatesModel coordinates;
  String? postalCode;
  String? TN;

  UserCompanyAddressModel({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.TN});

  factory UserCompanyAddressModel.fromJson(Map<String, dynamic> json){
    return UserCompanyAddressModel(
        address: json['address'],
        city: json['city'],
        coordinates: UserCompanyAddressCoordinatesModel.fromJson(json['coordinates']),
        postalCode: json['postalCode'],
        TN: json['TN'] );
  }
}



class UserCryptoModel {
  String? coin;
  String? network;
  String? wallet;

  UserCryptoModel(
      {required this.coin, required this.network, required this.wallet});

  factory UserCryptoModel.fromJson(Map<String, dynamic> json){
    return UserCryptoModel(
        coin: json['coin'],
        network: json['network'],
        wallet: json['wallet']
    );
  }

}