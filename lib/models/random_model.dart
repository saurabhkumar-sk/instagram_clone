class RandomUser {
  final ID id;
  final Name name;
  final String gender;
  final Dob dateOfBirth;
  final String phone;
  final Address address;
  final Images images;

  RandomUser({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.phone,
    required this.address,
    required this.images,
  });
  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      id: ID.fromJson(json['id']),
      name: Name.fromJson(json['name']),
      dateOfBirth: Dob.fromJson(json['dob']),
      gender: json['gender'],
      phone: json['phone'],
      address: Address.fromJson(json['location']),
      images: Images.fromJson(json['picture']),
    );
  }

  
}

class ID {
  final String? value;
  final String name;

  ID({
    required this.value,
    required this.name,
  });
  factory ID.fromJson(Map<String, dynamic> json) {
    return ID(
      value: json['value'],
      name: json['name'],
    );
  }
}

class Dob {
  final String date;
  final int age;

  Dob({required this.date, required this.age});
  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: json['date'],
      age: json['age'],
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });
  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Images {
  final String large;
  final String medium;
  final String thumbnail;

  Images({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}

class Address {
  final Street street;
  final String city;
  final String state;
  final String country;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });
  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }
}
