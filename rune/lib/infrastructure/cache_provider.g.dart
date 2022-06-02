// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_provider.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CachedUser extends DataClass implements Insertable<CachedUser> {
  final int id;
  final String fullName;
  final DateTime updatedAt;
  final String email;
  final String? handle;
  final String? avatar;
  final String? token;
  CachedUser(
      {required this.id,
      required this.fullName,
      required this.updatedAt,
      required this.email,
      this.handle,
      this.avatar,
      this.token});
  factory CachedUser.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CachedUser(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      fullName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      handle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}handle']),
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      token: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}token']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || handle != null) {
      map['handle'] = Variable<String?>(handle);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String?>(avatar);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String?>(token);
    }
    return map;
  }

  CachedUsersCompanion toCompanion(bool nullToAbsent) {
    return CachedUsersCompanion(
      id: Value(id),
      fullName: Value(fullName),
      updatedAt: Value(updatedAt),
      email: Value(email),
      handle:
          handle == null && nullToAbsent ? const Value.absent() : Value(handle),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
    );
  }

  factory CachedUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedUser(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      email: serializer.fromJson<String>(json['email']),
      handle: serializer.fromJson<String?>(json['handle']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      token: serializer.fromJson<String?>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'email': serializer.toJson<String>(email),
      'handle': serializer.toJson<String?>(handle),
      'avatar': serializer.toJson<String?>(avatar),
      'token': serializer.toJson<String?>(token),
    };
  }

  CachedUser copyWith(
          {int? id,
          String? fullName,
          DateTime? updatedAt,
          String? email,
          String? handle,
          String? avatar,
          String? token}) =>
      CachedUser(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        updatedAt: updatedAt ?? this.updatedAt,
        email: email ?? this.email,
        handle: handle ?? this.handle,
        avatar: avatar ?? this.avatar,
        token: token ?? this.token,
      );
  @override
  String toString() {
    return (StringBuffer('CachedUser(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('email: $email, ')
          ..write('handle: $handle, ')
          ..write('avatar: $avatar, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fullName, updatedAt, email, handle, avatar, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedUser &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.updatedAt == this.updatedAt &&
          other.email == this.email &&
          other.handle == this.handle &&
          other.avatar == this.avatar &&
          other.token == this.token);
}

class CachedUsersCompanion extends UpdateCompanion<CachedUser> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<DateTime> updatedAt;
  final Value<String> email;
  final Value<String?> handle;
  final Value<String?> avatar;
  final Value<String?> token;
  const CachedUsersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.email = const Value.absent(),
    this.handle = const Value.absent(),
    this.avatar = const Value.absent(),
    this.token = const Value.absent(),
  });
  CachedUsersCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required DateTime updatedAt,
    required String email,
    this.handle = const Value.absent(),
    this.avatar = const Value.absent(),
    this.token = const Value.absent(),
  })  : fullName = Value(fullName),
        updatedAt = Value(updatedAt),
        email = Value(email);
  static Insertable<CachedUser> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<DateTime>? updatedAt,
    Expression<String>? email,
    Expression<String?>? handle,
    Expression<String?>? avatar,
    Expression<String?>? token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (email != null) 'email': email,
      if (handle != null) 'handle': handle,
      if (avatar != null) 'avatar': avatar,
      if (token != null) 'token': token,
    });
  }

  CachedUsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<DateTime>? updatedAt,
      Value<String>? email,
      Value<String?>? handle,
      Value<String?>? avatar,
      Value<String?>? token}) {
    return CachedUsersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      updatedAt: updatedAt ?? this.updatedAt,
      email: email ?? this.email,
      handle: handle ?? this.handle,
      avatar: avatar ?? this.avatar,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (handle.present) {
      map['handle'] = Variable<String?>(handle.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String?>(avatar.value);
    }
    if (token.present) {
      map['token'] = Variable<String?>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedUsersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('email: $email, ')
          ..write('handle: $handle, ')
          ..write('avatar: $avatar, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

class $CachedUsersTable extends CachedUsers
    with TableInfo<$CachedUsersTable, CachedUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String?> fullName = GeneratedColumn<String?>(
      'full_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _handleMeta = const VerificationMeta('handle');
  @override
  late final GeneratedColumn<String?> handle = GeneratedColumn<String?>(
      'handle', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String?> token = GeneratedColumn<String?>(
      'token', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, fullName, updatedAt, email, handle, avatar, token];
  @override
  String get aliasedName => _alias ?? 'cached_users';
  @override
  String get actualTableName => 'cached_users';
  @override
  VerificationContext validateIntegrity(Insertable<CachedUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('handle')) {
      context.handle(_handleMeta,
          handle.isAcceptableOrUnknown(data['handle']!, _handleMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CachedUser.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CachedUsersTable createAlias(String alias) {
    return $CachedUsersTable(attachedDatabase, alias);
  }
}

class CachedChannel extends DataClass implements Insertable<CachedChannel> {
  final int id;
  final int authorId;
  final String name;
  final String description;
  final String address;
  final DateTime? createdAt;
  final String? email;
  final String? logo;
  final bool verfied;
  final bool pinned;
  CachedChannel(
      {required this.id,
      required this.authorId,
      required this.name,
      required this.description,
      required this.address,
      this.createdAt,
      this.email,
      this.logo,
      required this.verfied,
      required this.pinned});
  factory CachedChannel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CachedChannel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      authorId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      logo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}logo']),
      verfied: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}verfied'])!,
      pinned: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pinned'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String?>(logo);
    }
    map['verfied'] = Variable<bool>(verfied);
    map['pinned'] = Variable<bool>(pinned);
    return map;
  }

  CachedChannelsCompanion toCompanion(bool nullToAbsent) {
    return CachedChannelsCompanion(
      id: Value(id),
      authorId: Value(authorId),
      name: Value(name),
      description: Value(description),
      address: Value(address),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      verfied: Value(verfied),
      pinned: Value(pinned),
    );
  }

  factory CachedChannel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedChannel(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      address: serializer.fromJson<String>(json['address']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      email: serializer.fromJson<String?>(json['email']),
      logo: serializer.fromJson<String?>(json['logo']),
      verfied: serializer.fromJson<bool>(json['verfied']),
      pinned: serializer.fromJson<bool>(json['pinned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorId': serializer.toJson<int>(authorId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'address': serializer.toJson<String>(address),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'email': serializer.toJson<String?>(email),
      'logo': serializer.toJson<String?>(logo),
      'verfied': serializer.toJson<bool>(verfied),
      'pinned': serializer.toJson<bool>(pinned),
    };
  }

  CachedChannel copyWith(
          {int? id,
          int? authorId,
          String? name,
          String? description,
          String? address,
          DateTime? createdAt,
          String? email,
          String? logo,
          bool? verfied,
          bool? pinned}) =>
      CachedChannel(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        name: name ?? this.name,
        description: description ?? this.description,
        address: address ?? this.address,
        createdAt: createdAt ?? this.createdAt,
        email: email ?? this.email,
        logo: logo ?? this.logo,
        verfied: verfied ?? this.verfied,
        pinned: pinned ?? this.pinned,
      );
  @override
  String toString() {
    return (StringBuffer('CachedChannel(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('email: $email, ')
          ..write('logo: $logo, ')
          ..write('verfied: $verfied, ')
          ..write('pinned: $pinned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, authorId, name, description, address,
      createdAt, email, logo, verfied, pinned);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedChannel &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.name == this.name &&
          other.description == this.description &&
          other.address == this.address &&
          other.createdAt == this.createdAt &&
          other.email == this.email &&
          other.logo == this.logo &&
          other.verfied == this.verfied &&
          other.pinned == this.pinned);
}

class CachedChannelsCompanion extends UpdateCompanion<CachedChannel> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<String> name;
  final Value<String> description;
  final Value<String> address;
  final Value<DateTime?> createdAt;
  final Value<String?> email;
  final Value<String?> logo;
  final Value<bool> verfied;
  final Value<bool> pinned;
  const CachedChannelsCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.email = const Value.absent(),
    this.logo = const Value.absent(),
    this.verfied = const Value.absent(),
    this.pinned = const Value.absent(),
  });
  CachedChannelsCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required String name,
    required String description,
    required String address,
    this.createdAt = const Value.absent(),
    this.email = const Value.absent(),
    this.logo = const Value.absent(),
    required bool verfied,
    required bool pinned,
  })  : authorId = Value(authorId),
        name = Value(name),
        description = Value(description),
        address = Value(address),
        verfied = Value(verfied),
        pinned = Value(pinned);
  static Insertable<CachedChannel> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? address,
    Expression<DateTime?>? createdAt,
    Expression<String?>? email,
    Expression<String?>? logo,
    Expression<bool>? verfied,
    Expression<bool>? pinned,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
      if (email != null) 'email': email,
      if (logo != null) 'logo': logo,
      if (verfied != null) 'verfied': verfied,
      if (pinned != null) 'pinned': pinned,
    });
  }

  CachedChannelsCompanion copyWith(
      {Value<int>? id,
      Value<int>? authorId,
      Value<String>? name,
      Value<String>? description,
      Value<String>? address,
      Value<DateTime?>? createdAt,
      Value<String?>? email,
      Value<String?>? logo,
      Value<bool>? verfied,
      Value<bool>? pinned}) {
    return CachedChannelsCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      logo: logo ?? this.logo,
      verfied: verfied ?? this.verfied,
      pinned: pinned ?? this.pinned,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String?>(logo.value);
    }
    if (verfied.present) {
      map['verfied'] = Variable<bool>(verfied.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool>(pinned.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedChannelsCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('email: $email, ')
          ..write('logo: $logo, ')
          ..write('verfied: $verfied, ')
          ..write('pinned: $pinned')
          ..write(')'))
        .toString();
  }
}

class $CachedChannelsTable extends CachedChannels
    with TableInfo<$CachedChannelsTable, CachedChannel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedChannelsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _authorIdMeta = const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int?> authorId = GeneratedColumn<int?>(
      'author_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String?> logo = GeneratedColumn<String?>(
      'logo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _verfiedMeta = const VerificationMeta('verfied');
  @override
  late final GeneratedColumn<bool?> verfied = GeneratedColumn<bool?>(
      'verfied', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (verfied IN (0, 1))');
  final VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedColumn<bool?> pinned = GeneratedColumn<bool?>(
      'pinned', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (pinned IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        authorId,
        name,
        description,
        address,
        createdAt,
        email,
        logo,
        verfied,
        pinned
      ];
  @override
  String get aliasedName => _alias ?? 'cached_channels';
  @override
  String get actualTableName => 'cached_channels';
  @override
  VerificationContext validateIntegrity(Insertable<CachedChannel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('verfied')) {
      context.handle(_verfiedMeta,
          verfied.isAcceptableOrUnknown(data['verfied']!, _verfiedMeta));
    } else if (isInserting) {
      context.missing(_verfiedMeta);
    }
    if (data.containsKey('pinned')) {
      context.handle(_pinnedMeta,
          pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta));
    } else if (isInserting) {
      context.missing(_pinnedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedChannel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CachedChannel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CachedChannelsTable createAlias(String alias) {
    return $CachedChannelsTable(attachedDatabase, alias);
  }
}

class CachedComment extends DataClass implements Insertable<CachedComment> {
  final int id;
  final int authorId;
  final int postId;
  final String content;
  final DateTime updatedAt;
  final int upVote;
  final int downVote;
  CachedComment(
      {required this.id,
      required this.authorId,
      required this.postId,
      required this.content,
      required this.updatedAt,
      required this.upVote,
      required this.downVote});
  factory CachedComment.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CachedComment(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      authorId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_id'])!,
      postId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      upVote: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}up_vote'])!,
      downVote: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}down_vote'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['post_id'] = Variable<int>(postId);
    map['content'] = Variable<String>(content);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['up_vote'] = Variable<int>(upVote);
    map['down_vote'] = Variable<int>(downVote);
    return map;
  }

  CachedCommentsCompanion toCompanion(bool nullToAbsent) {
    return CachedCommentsCompanion(
      id: Value(id),
      authorId: Value(authorId),
      postId: Value(postId),
      content: Value(content),
      updatedAt: Value(updatedAt),
      upVote: Value(upVote),
      downVote: Value(downVote),
    );
  }

  factory CachedComment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedComment(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      postId: serializer.fromJson<int>(json['postId']),
      content: serializer.fromJson<String>(json['content']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      upVote: serializer.fromJson<int>(json['upVote']),
      downVote: serializer.fromJson<int>(json['downVote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorId': serializer.toJson<int>(authorId),
      'postId': serializer.toJson<int>(postId),
      'content': serializer.toJson<String>(content),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'upVote': serializer.toJson<int>(upVote),
      'downVote': serializer.toJson<int>(downVote),
    };
  }

  CachedComment copyWith(
          {int? id,
          int? authorId,
          int? postId,
          String? content,
          DateTime? updatedAt,
          int? upVote,
          int? downVote}) =>
      CachedComment(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        postId: postId ?? this.postId,
        content: content ?? this.content,
        updatedAt: updatedAt ?? this.updatedAt,
        upVote: upVote ?? this.upVote,
        downVote: downVote ?? this.downVote,
      );
  @override
  String toString() {
    return (StringBuffer('CachedComment(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('postId: $postId, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('upVote: $upVote, ')
          ..write('downVote: $downVote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, authorId, postId, content, updatedAt, upVote, downVote);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedComment &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.postId == this.postId &&
          other.content == this.content &&
          other.updatedAt == this.updatedAt &&
          other.upVote == this.upVote &&
          other.downVote == this.downVote);
}

class CachedCommentsCompanion extends UpdateCompanion<CachedComment> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> postId;
  final Value<String> content;
  final Value<DateTime> updatedAt;
  final Value<int> upVote;
  final Value<int> downVote;
  const CachedCommentsCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.postId = const Value.absent(),
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.upVote = const Value.absent(),
    this.downVote = const Value.absent(),
  });
  CachedCommentsCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int postId,
    required String content,
    required DateTime updatedAt,
    required int upVote,
    required int downVote,
  })  : authorId = Value(authorId),
        postId = Value(postId),
        content = Value(content),
        updatedAt = Value(updatedAt),
        upVote = Value(upVote),
        downVote = Value(downVote);
  static Insertable<CachedComment> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<int>? postId,
    Expression<String>? content,
    Expression<DateTime>? updatedAt,
    Expression<int>? upVote,
    Expression<int>? downVote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (postId != null) 'post_id': postId,
      if (content != null) 'content': content,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (upVote != null) 'up_vote': upVote,
      if (downVote != null) 'down_vote': downVote,
    });
  }

  CachedCommentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? authorId,
      Value<int>? postId,
      Value<String>? content,
      Value<DateTime>? updatedAt,
      Value<int>? upVote,
      Value<int>? downVote}) {
    return CachedCommentsCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      postId: postId ?? this.postId,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
      upVote: upVote ?? this.upVote,
      downVote: downVote ?? this.downVote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<int>(postId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (upVote.present) {
      map['up_vote'] = Variable<int>(upVote.value);
    }
    if (downVote.present) {
      map['down_vote'] = Variable<int>(downVote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCommentsCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('postId: $postId, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('upVote: $upVote, ')
          ..write('downVote: $downVote')
          ..write(')'))
        .toString();
  }
}

class $CachedCommentsTable extends CachedComments
    with TableInfo<$CachedCommentsTable, CachedComment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCommentsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _authorIdMeta = const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int?> authorId = GeneratedColumn<int?>(
      'author_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<int?> postId = GeneratedColumn<int?>(
      'post_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _upVoteMeta = const VerificationMeta('upVote');
  @override
  late final GeneratedColumn<int?> upVote = GeneratedColumn<int?>(
      'up_vote', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _downVoteMeta = const VerificationMeta('downVote');
  @override
  late final GeneratedColumn<int?> downVote = GeneratedColumn<int?>(
      'down_vote', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, authorId, postId, content, updatedAt, upVote, downVote];
  @override
  String get aliasedName => _alias ?? 'cached_comments';
  @override
  String get actualTableName => 'cached_comments';
  @override
  VerificationContext validateIntegrity(Insertable<CachedComment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('up_vote')) {
      context.handle(_upVoteMeta,
          upVote.isAcceptableOrUnknown(data['up_vote']!, _upVoteMeta));
    } else if (isInserting) {
      context.missing(_upVoteMeta);
    }
    if (data.containsKey('down_vote')) {
      context.handle(_downVoteMeta,
          downVote.isAcceptableOrUnknown(data['down_vote']!, _downVoteMeta));
    } else if (isInserting) {
      context.missing(_downVoteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedComment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CachedComment.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CachedCommentsTable createAlias(String alias) {
    return $CachedCommentsTable(attachedDatabase, alias);
  }
}

class CachedPost extends DataClass implements Insertable<CachedPost> {
  final int id;
  final int authorId;
  final int channelId;
  final String title;
  final String content;
  final String? image;
  final DateTime updatedAt;
  final int upVote;
  final int downVote;
  final String vote;
  CachedPost(
      {required this.id,
      required this.authorId,
      required this.channelId,
      required this.title,
      required this.content,
      this.image,
      required this.updatedAt,
      required this.upVote,
      required this.downVote,
      required this.vote});
  factory CachedPost.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CachedPost(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      authorId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_id'])!,
      channelId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      upVote: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}up_vote'])!,
      downVote: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}down_vote'])!,
      vote: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['channel_id'] = Variable<int>(channelId);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['up_vote'] = Variable<int>(upVote);
    map['down_vote'] = Variable<int>(downVote);
    map['vote'] = Variable<String>(vote);
    return map;
  }

  CachedPostsCompanion toCompanion(bool nullToAbsent) {
    return CachedPostsCompanion(
      id: Value(id),
      authorId: Value(authorId),
      channelId: Value(channelId),
      title: Value(title),
      content: Value(content),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      updatedAt: Value(updatedAt),
      upVote: Value(upVote),
      downVote: Value(downVote),
      vote: Value(vote),
    );
  }

  factory CachedPost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPost(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      channelId: serializer.fromJson<int>(json['channelId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      image: serializer.fromJson<String?>(json['image']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      upVote: serializer.fromJson<int>(json['upVote']),
      downVote: serializer.fromJson<int>(json['downVote']),
      vote: serializer.fromJson<String>(json['vote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorId': serializer.toJson<int>(authorId),
      'channelId': serializer.toJson<int>(channelId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'image': serializer.toJson<String?>(image),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'upVote': serializer.toJson<int>(upVote),
      'downVote': serializer.toJson<int>(downVote),
      'vote': serializer.toJson<String>(vote),
    };
  }

  CachedPost copyWith(
          {int? id,
          int? authorId,
          int? channelId,
          String? title,
          String? content,
          String? image,
          DateTime? updatedAt,
          int? upVote,
          int? downVote,
          String? vote}) =>
      CachedPost(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        content: content ?? this.content,
        image: image ?? this.image,
        updatedAt: updatedAt ?? this.updatedAt,
        upVote: upVote ?? this.upVote,
        downVote: downVote ?? this.downVote,
        vote: vote ?? this.vote,
      );
  @override
  String toString() {
    return (StringBuffer('CachedPost(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('channelId: $channelId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('image: $image, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('upVote: $upVote, ')
          ..write('downVote: $downVote, ')
          ..write('vote: $vote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, authorId, channelId, title, content,
      image, updatedAt, upVote, downVote, vote);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPost &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.channelId == this.channelId &&
          other.title == this.title &&
          other.content == this.content &&
          other.image == this.image &&
          other.updatedAt == this.updatedAt &&
          other.upVote == this.upVote &&
          other.downVote == this.downVote &&
          other.vote == this.vote);
}

class CachedPostsCompanion extends UpdateCompanion<CachedPost> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> channelId;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> image;
  final Value<DateTime> updatedAt;
  final Value<int> upVote;
  final Value<int> downVote;
  final Value<String> vote;
  const CachedPostsCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.channelId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.image = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.upVote = const Value.absent(),
    this.downVote = const Value.absent(),
    this.vote = const Value.absent(),
  });
  CachedPostsCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int channelId,
    required String title,
    required String content,
    this.image = const Value.absent(),
    required DateTime updatedAt,
    required int upVote,
    required int downVote,
    required String vote,
  })  : authorId = Value(authorId),
        channelId = Value(channelId),
        title = Value(title),
        content = Value(content),
        updatedAt = Value(updatedAt),
        upVote = Value(upVote),
        downVote = Value(downVote),
        vote = Value(vote);
  static Insertable<CachedPost> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<int>? channelId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String?>? image,
    Expression<DateTime>? updatedAt,
    Expression<int>? upVote,
    Expression<int>? downVote,
    Expression<String>? vote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (channelId != null) 'channel_id': channelId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (image != null) 'image': image,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (upVote != null) 'up_vote': upVote,
      if (downVote != null) 'down_vote': downVote,
      if (vote != null) 'vote': vote,
    });
  }

  CachedPostsCompanion copyWith(
      {Value<int>? id,
      Value<int>? authorId,
      Value<int>? channelId,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? image,
      Value<DateTime>? updatedAt,
      Value<int>? upVote,
      Value<int>? downVote,
      Value<String>? vote}) {
    return CachedPostsCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      channelId: channelId ?? this.channelId,
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      updatedAt: updatedAt ?? this.updatedAt,
      upVote: upVote ?? this.upVote,
      downVote: downVote ?? this.downVote,
      vote: vote ?? this.vote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<int>(channelId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (upVote.present) {
      map['up_vote'] = Variable<int>(upVote.value);
    }
    if (downVote.present) {
      map['down_vote'] = Variable<int>(downVote.value);
    }
    if (vote.present) {
      map['vote'] = Variable<String>(vote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPostsCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('channelId: $channelId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('image: $image, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('upVote: $upVote, ')
          ..write('downVote: $downVote, ')
          ..write('vote: $vote')
          ..write(')'))
        .toString();
  }
}

class $CachedPostsTable extends CachedPosts
    with TableInfo<$CachedPostsTable, CachedPost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPostsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _authorIdMeta = const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int?> authorId = GeneratedColumn<int?>(
      'author_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _channelIdMeta = const VerificationMeta('channelId');
  @override
  late final GeneratedColumn<int?> channelId = GeneratedColumn<int?>(
      'channel_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _upVoteMeta = const VerificationMeta('upVote');
  @override
  late final GeneratedColumn<int?> upVote = GeneratedColumn<int?>(
      'up_vote', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _downVoteMeta = const VerificationMeta('downVote');
  @override
  late final GeneratedColumn<int?> downVote = GeneratedColumn<int?>(
      'down_vote', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<String?> vote = GeneratedColumn<String?>(
      'vote', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        authorId,
        channelId,
        title,
        content,
        image,
        updatedAt,
        upVote,
        downVote,
        vote
      ];
  @override
  String get aliasedName => _alias ?? 'cached_posts';
  @override
  String get actualTableName => 'cached_posts';
  @override
  VerificationContext validateIntegrity(Insertable<CachedPost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('channel_id')) {
      context.handle(_channelIdMeta,
          channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta));
    } else if (isInserting) {
      context.missing(_channelIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('up_vote')) {
      context.handle(_upVoteMeta,
          upVote.isAcceptableOrUnknown(data['up_vote']!, _upVoteMeta));
    } else if (isInserting) {
      context.missing(_upVoteMeta);
    }
    if (data.containsKey('down_vote')) {
      context.handle(_downVoteMeta,
          downVote.isAcceptableOrUnknown(data['down_vote']!, _downVoteMeta));
    } else if (isInserting) {
      context.missing(_downVoteMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedPost map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CachedPost.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CachedPostsTable createAlias(String alias) {
    return $CachedPostsTable(attachedDatabase, alias);
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CachedUsersTable cachedUsers = $CachedUsersTable(this);
  late final $CachedChannelsTable cachedChannels = $CachedChannelsTable(this);
  late final $CachedCommentsTable cachedComments = $CachedCommentsTable(this);
  late final $CachedPostsTable cachedPosts = $CachedPostsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cachedUsers, cachedChannels, cachedComments, cachedPosts];
}
