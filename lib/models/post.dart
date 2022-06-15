import 'dart:convert';
import 'package:flutter/material.dart';

List<Post> dataFromMap(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post with ChangeNotifier {
  Post({
    this.id,
    this.caption,
    this.media,
    this.createdAt,
    this.author,
    this.spot,
    this.relevantComments,
    this.numberOfComments,
    this.likedBy,
    this.numberOfLikes,
    this.tags,
  });

  String? id;
  Caption? caption;
  List<Media>? media;
  DateTime? createdAt;
  Author? author;
  Spot? spot;
  dynamic relevantComments;
  int? numberOfComments;
  List<Author>? likedBy;
  int? numberOfLikes;
  List<DatumTag>? tags;
  bool isLiked = false;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        caption: Caption.fromMap(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromMap(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromMap(json["author"]),
        spot: Spot.fromMap(json["spot"]),
        relevantComments: json["relevant_comments"],
        numberOfComments: json["number_of_comments"],
        likedBy:
            List<Author>.from(json["liked_by"].map((x) => Author.fromMap(x))),
        numberOfLikes: json["number_of_likes"],
        tags: json["tags"] == null
            ? null
            : List<DatumTag>.from(json["tags"].map((x) => DatumTag.fromMap(x))),
      );

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
  }

  void toggleSave() {
    spot!.isSaved = !spot!.isSaved!;
    notifyListeners();
  }
}

class Author {
  Author({
    this.id,
    this.username,
    this.photoUrl,
    this.fullName,
    this.isPrivate,
    this.isVerified,
  });

  String? id;
  String? username;
  String? photoUrl;
  String? fullName;
  bool? isPrivate;
  bool? isVerified;

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
      );
}

class Caption {
  Caption({
    this.text,
    this.tags,
  });

  String? text;
  List<CaptionTag>? tags;

  factory Caption.fromMap(Map<String, dynamic> json) => Caption(
        text: json["text"],
        tags: json["tags"] == null
            ? null
            : List<CaptionTag>.from(
                json["tags"].map((x) => CaptionTag.fromMap(x))),
      );
}

class CaptionTag {
  CaptionTag({
    this.id,
    this.tagText,
    this.displayText,
    this.url,
    this.type,
  });

  String? id;
  String? tagText;
  String? displayText;
  String? url;
  TagType? type;

  factory CaptionTag.fromMap(Map<String, dynamic> json) => CaptionTag(
        id: json["id"],
        tagText: json["tag_text"],
        displayText: json["display_text"],
        url: json["url"],
        type: tagTypeValues.map[json["type"]]!,
      );
}

enum TagType { USER }

final tagTypeValues = EnumValues({"user": TagType.USER});

class Media {
  Media({
    this.url,
    this.type,
    this.blurHash,
  });

  String? url;
  MediaType? type;
  String? blurHash;

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        url: json["url"],
        type: mediaTypeValues.map[json["type"]]!,
        blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
      );
}

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({"image": MediaType.IMAGE});

class Spot with ChangeNotifier {
  Spot({
    this.id,
    this.name,
    this.types,
    this.logo,
    this.location,
    this.isSaved,
  });

  String? id;
  String? name;
  List<TypeElement>? types;
  Media? logo;
  Location? location;
  bool? isSaved;

  factory Spot.fromMap(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: List<TypeElement>.from(
            json["types"].map((x) => TypeElement.fromMap(x))),
        logo: Media.fromMap(json["logo"]),
        location: Location.fromMap(json["location"]),
        isSaved: json["is_saved"],
      );
}

class Location {
  Location({
    this.latitude,
    this.longitude,
    this.display,
  });

  double? latitude;
  double? longitude;
  String? display;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        display: json["display"],
      );
}

class TypeElement {
  TypeElement({
    this.id,
    this.name,
    this.url,
  });

  int? id;
  String? name;
  String? url;

  factory TypeElement.fromMap(Map<String, dynamic> json) => TypeElement(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );
}

class DatumTag {
  DatumTag({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory DatumTag.fromMap(Map<String, dynamic> json) => DatumTag(
        id: json["id"],
        name: json["name"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
