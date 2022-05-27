class Channel {
  final int id;
  final String name;
  final String address;
  final String? logoImageUrl;
  final String email;
  final bool verified;
  final String description;
  bool pinned;

  Channel(
      {required this.id,
      required this.name,
      required this.address,
      required this.email,
      required this.verified,
      required this.description,
      this.logoImageUrl,
      this.pinned = false});

  Channel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        verified = json['verified'],
        description = json['description'] ?? "",
        email = json['email'],
        logoImageUrl = json['logo'],
        pinned = json['pinned'] ?? false;
}

typedef Channels = List<Channel>;
