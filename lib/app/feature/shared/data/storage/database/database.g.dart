// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DoctorsTable extends Doctors with TableInfo<$DoctorsTable, Doctor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _kodMeta = const VerificationMeta('kod');
  @override
  late final GeneratedColumn<int> kod = GeneratedColumn<int>(
      'kod', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filialMeta = const VerificationMeta('filial');
  @override
  late final GeneratedColumn<String> filial = GeneratedColumn<String>(
      'filial', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dolzhnostMeta =
      const VerificationMeta('dolzhnost');
  @override
  late final GeneratedColumn<String> dolzhnost = GeneratedColumn<String>(
      'dolzhnost', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imgMeta = const VerificationMeta('img');
  @override
  late final GeneratedColumn<String> img = GeneratedColumn<String>(
      'img', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<String> active = GeneratedColumn<String>(
      'active', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _delMeta = const VerificationMeta('del');
  @override
  late final GeneratedColumn<String> del = GeneratedColumn<String>(
      'del', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, kod, name, filial, dolzhnost, img, active, del];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctors';
  @override
  VerificationContext validateIntegrity(Insertable<Doctor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kod')) {
      context.handle(
          _kodMeta, kod.isAcceptableOrUnknown(data['kod']!, _kodMeta));
    } else if (isInserting) {
      context.missing(_kodMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('filial')) {
      context.handle(_filialMeta,
          filial.isAcceptableOrUnknown(data['filial']!, _filialMeta));
    } else if (isInserting) {
      context.missing(_filialMeta);
    }
    if (data.containsKey('dolzhnost')) {
      context.handle(_dolzhnostMeta,
          dolzhnost.isAcceptableOrUnknown(data['dolzhnost']!, _dolzhnostMeta));
    } else if (isInserting) {
      context.missing(_dolzhnostMeta);
    }
    if (data.containsKey('img')) {
      context.handle(
          _imgMeta, img.isAcceptableOrUnknown(data['img']!, _imgMeta));
    } else if (isInserting) {
      context.missing(_imgMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('del')) {
      context.handle(
          _delMeta, del.isAcceptableOrUnknown(data['del']!, _delMeta));
    } else if (isInserting) {
      context.missing(_delMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Doctor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Doctor(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kod'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      filial: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filial'])!,
      dolzhnost: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dolzhnost'])!,
      img: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}img'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}active'])!,
      del: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}del'])!,
    );
  }

  @override
  $DoctorsTable createAlias(String alias) {
    return $DoctorsTable(attachedDatabase, alias);
  }
}

class Doctor extends DataClass implements Insertable<Doctor> {
  final int id;
  final int kod;
  final String name;
  final String filial;
  final String dolzhnost;
  final String img;
  final String active;
  final String del;
  const Doctor(
      {required this.id,
      required this.kod,
      required this.name,
      required this.filial,
      required this.dolzhnost,
      required this.img,
      required this.active,
      required this.del});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kod'] = Variable<int>(kod);
    map['name'] = Variable<String>(name);
    map['filial'] = Variable<String>(filial);
    map['dolzhnost'] = Variable<String>(dolzhnost);
    map['img'] = Variable<String>(img);
    map['active'] = Variable<String>(active);
    map['del'] = Variable<String>(del);
    return map;
  }

  DoctorsCompanion toCompanion(bool nullToAbsent) {
    return DoctorsCompanion(
      id: Value(id),
      kod: Value(kod),
      name: Value(name),
      filial: Value(filial),
      dolzhnost: Value(dolzhnost),
      img: Value(img),
      active: Value(active),
      del: Value(del),
    );
  }

  factory Doctor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Doctor(
      id: serializer.fromJson<int>(json['id']),
      kod: serializer.fromJson<int>(json['kod']),
      name: serializer.fromJson<String>(json['name']),
      filial: serializer.fromJson<String>(json['filial']),
      dolzhnost: serializer.fromJson<String>(json['dolzhnost']),
      img: serializer.fromJson<String>(json['img']),
      active: serializer.fromJson<String>(json['active']),
      del: serializer.fromJson<String>(json['del']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kod': serializer.toJson<int>(kod),
      'name': serializer.toJson<String>(name),
      'filial': serializer.toJson<String>(filial),
      'dolzhnost': serializer.toJson<String>(dolzhnost),
      'img': serializer.toJson<String>(img),
      'active': serializer.toJson<String>(active),
      'del': serializer.toJson<String>(del),
    };
  }

  Doctor copyWith(
          {int? id,
          int? kod,
          String? name,
          String? filial,
          String? dolzhnost,
          String? img,
          String? active,
          String? del}) =>
      Doctor(
        id: id ?? this.id,
        kod: kod ?? this.kod,
        name: name ?? this.name,
        filial: filial ?? this.filial,
        dolzhnost: dolzhnost ?? this.dolzhnost,
        img: img ?? this.img,
        active: active ?? this.active,
        del: del ?? this.del,
      );
  @override
  String toString() {
    return (StringBuffer('Doctor(')
          ..write('id: $id, ')
          ..write('kod: $kod, ')
          ..write('name: $name, ')
          ..write('filial: $filial, ')
          ..write('dolzhnost: $dolzhnost, ')
          ..write('img: $img, ')
          ..write('active: $active, ')
          ..write('del: $del')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, kod, name, filial, dolzhnost, img, active, del);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Doctor &&
          other.id == this.id &&
          other.kod == this.kod &&
          other.name == this.name &&
          other.filial == this.filial &&
          other.dolzhnost == this.dolzhnost &&
          other.img == this.img &&
          other.active == this.active &&
          other.del == this.del);
}

class DoctorsCompanion extends UpdateCompanion<Doctor> {
  final Value<int> id;
  final Value<int> kod;
  final Value<String> name;
  final Value<String> filial;
  final Value<String> dolzhnost;
  final Value<String> img;
  final Value<String> active;
  final Value<String> del;
  const DoctorsCompanion({
    this.id = const Value.absent(),
    this.kod = const Value.absent(),
    this.name = const Value.absent(),
    this.filial = const Value.absent(),
    this.dolzhnost = const Value.absent(),
    this.img = const Value.absent(),
    this.active = const Value.absent(),
    this.del = const Value.absent(),
  });
  DoctorsCompanion.insert({
    this.id = const Value.absent(),
    required int kod,
    required String name,
    required String filial,
    required String dolzhnost,
    required String img,
    required String active,
    required String del,
  })  : kod = Value(kod),
        name = Value(name),
        filial = Value(filial),
        dolzhnost = Value(dolzhnost),
        img = Value(img),
        active = Value(active),
        del = Value(del);
  static Insertable<Doctor> custom({
    Expression<int>? id,
    Expression<int>? kod,
    Expression<String>? name,
    Expression<String>? filial,
    Expression<String>? dolzhnost,
    Expression<String>? img,
    Expression<String>? active,
    Expression<String>? del,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kod != null) 'kod': kod,
      if (name != null) 'name': name,
      if (filial != null) 'filial': filial,
      if (dolzhnost != null) 'dolzhnost': dolzhnost,
      if (img != null) 'img': img,
      if (active != null) 'active': active,
      if (del != null) 'del': del,
    });
  }

  DoctorsCompanion copyWith(
      {Value<int>? id,
      Value<int>? kod,
      Value<String>? name,
      Value<String>? filial,
      Value<String>? dolzhnost,
      Value<String>? img,
      Value<String>? active,
      Value<String>? del}) {
    return DoctorsCompanion(
      id: id ?? this.id,
      kod: kod ?? this.kod,
      name: name ?? this.name,
      filial: filial ?? this.filial,
      dolzhnost: dolzhnost ?? this.dolzhnost,
      img: img ?? this.img,
      active: active ?? this.active,
      del: del ?? this.del,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kod.present) {
      map['kod'] = Variable<int>(kod.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (filial.present) {
      map['filial'] = Variable<String>(filial.value);
    }
    if (dolzhnost.present) {
      map['dolzhnost'] = Variable<String>(dolzhnost.value);
    }
    if (img.present) {
      map['img'] = Variable<String>(img.value);
    }
    if (active.present) {
      map['active'] = Variable<String>(active.value);
    }
    if (del.present) {
      map['del'] = Variable<String>(del.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorsCompanion(')
          ..write('id: $id, ')
          ..write('kod: $kod, ')
          ..write('name: $name, ')
          ..write('filial: $filial, ')
          ..write('dolzhnost: $dolzhnost, ')
          ..write('img: $img, ')
          ..write('active: $active, ')
          ..write('del: $del')
          ..write(')'))
        .toString();
  }
}

class $HospitalServicesTable extends HospitalServices
    with TableInfo<$HospitalServicesTable, HospitalService> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalServicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _kodMeta = const VerificationMeta('kod');
  @override
  late final GeneratedColumn<int> kod = GeneratedColumn<int>(
      'kod', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<String> active = GeneratedColumn<String>(
      'active', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _delMeta = const VerificationMeta('del');
  @override
  late final GeneratedColumn<String> del = GeneratedColumn<String>(
      'del', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, kod, name, active, del, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hospital_services';
  @override
  VerificationContext validateIntegrity(Insertable<HospitalService> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kod')) {
      context.handle(
          _kodMeta, kod.isAcceptableOrUnknown(data['kod']!, _kodMeta));
    } else if (isInserting) {
      context.missing(_kodMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('del')) {
      context.handle(
          _delMeta, del.isAcceptableOrUnknown(data['del']!, _delMeta));
    } else if (isInserting) {
      context.missing(_delMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HospitalService map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HospitalService(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kod'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}active'])!,
      del: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}del'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $HospitalServicesTable createAlias(String alias) {
    return $HospitalServicesTable(attachedDatabase, alias);
  }
}

class HospitalService extends DataClass implements Insertable<HospitalService> {
  final int id;
  final int kod;
  final String name;
  final String active;
  final String del;
  final String price;
  const HospitalService(
      {required this.id,
      required this.kod,
      required this.name,
      required this.active,
      required this.del,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kod'] = Variable<int>(kod);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<String>(active);
    map['del'] = Variable<String>(del);
    map['price'] = Variable<String>(price);
    return map;
  }

  HospitalServicesCompanion toCompanion(bool nullToAbsent) {
    return HospitalServicesCompanion(
      id: Value(id),
      kod: Value(kod),
      name: Value(name),
      active: Value(active),
      del: Value(del),
      price: Value(price),
    );
  }

  factory HospitalService.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HospitalService(
      id: serializer.fromJson<int>(json['id']),
      kod: serializer.fromJson<int>(json['kod']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<String>(json['active']),
      del: serializer.fromJson<String>(json['del']),
      price: serializer.fromJson<String>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kod': serializer.toJson<int>(kod),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<String>(active),
      'del': serializer.toJson<String>(del),
      'price': serializer.toJson<String>(price),
    };
  }

  HospitalService copyWith(
          {int? id,
          int? kod,
          String? name,
          String? active,
          String? del,
          String? price}) =>
      HospitalService(
        id: id ?? this.id,
        kod: kod ?? this.kod,
        name: name ?? this.name,
        active: active ?? this.active,
        del: del ?? this.del,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('HospitalService(')
          ..write('id: $id, ')
          ..write('kod: $kod, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('del: $del, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kod, name, active, del, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HospitalService &&
          other.id == this.id &&
          other.kod == this.kod &&
          other.name == this.name &&
          other.active == this.active &&
          other.del == this.del &&
          other.price == this.price);
}

class HospitalServicesCompanion extends UpdateCompanion<HospitalService> {
  final Value<int> id;
  final Value<int> kod;
  final Value<String> name;
  final Value<String> active;
  final Value<String> del;
  final Value<String> price;
  const HospitalServicesCompanion({
    this.id = const Value.absent(),
    this.kod = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.del = const Value.absent(),
    this.price = const Value.absent(),
  });
  HospitalServicesCompanion.insert({
    this.id = const Value.absent(),
    required int kod,
    required String name,
    required String active,
    required String del,
    required String price,
  })  : kod = Value(kod),
        name = Value(name),
        active = Value(active),
        del = Value(del),
        price = Value(price);
  static Insertable<HospitalService> custom({
    Expression<int>? id,
    Expression<int>? kod,
    Expression<String>? name,
    Expression<String>? active,
    Expression<String>? del,
    Expression<String>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kod != null) 'kod': kod,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (del != null) 'del': del,
      if (price != null) 'price': price,
    });
  }

  HospitalServicesCompanion copyWith(
      {Value<int>? id,
      Value<int>? kod,
      Value<String>? name,
      Value<String>? active,
      Value<String>? del,
      Value<String>? price}) {
    return HospitalServicesCompanion(
      id: id ?? this.id,
      kod: kod ?? this.kod,
      name: name ?? this.name,
      active: active ?? this.active,
      del: del ?? this.del,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kod.present) {
      map['kod'] = Variable<int>(kod.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<String>(active.value);
    }
    if (del.present) {
      map['del'] = Variable<String>(del.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalServicesCompanion(')
          ..write('id: $id, ')
          ..write('kod: $kod, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('del: $del, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorMeta = const VerificationMeta('doctor');
  @override
  late final GeneratedColumn<int> doctor = GeneratedColumn<int>(
      'doctor', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES doctors (id)'));
  static const VerificationMeta _serviceMeta =
      const VerificationMeta('service');
  @override
  late final GeneratedColumn<int> service = GeneratedColumn<int>(
      'service', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES hospital_services (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, date, doctor, service];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('doctor')) {
      context.handle(_doctorMeta,
          doctor.isAcceptableOrUnknown(data['doctor']!, _doctorMeta));
    } else if (isInserting) {
      context.missing(_doctorMeta);
    }
    if (data.containsKey('service')) {
      context.handle(_serviceMeta,
          service.isAcceptableOrUnknown(data['service']!, _serviceMeta));
    } else if (isInserting) {
      context.missing(_serviceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Record(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      doctor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}doctor'])!,
      service: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}service'])!,
    );
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(attachedDatabase, alias);
  }
}

class Record extends DataClass implements Insertable<Record> {
  final int id;
  final String date;
  final int doctor;
  final int service;
  const Record(
      {required this.id,
      required this.date,
      required this.doctor,
      required this.service});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<String>(date);
    map['doctor'] = Variable<int>(doctor);
    map['service'] = Variable<int>(service);
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: Value(id),
      date: Value(date),
      doctor: Value(doctor),
      service: Value(service),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String>(json['date']),
      doctor: serializer.fromJson<int>(json['doctor']),
      service: serializer.fromJson<int>(json['service']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String>(date),
      'doctor': serializer.toJson<int>(doctor),
      'service': serializer.toJson<int>(service),
    };
  }

  Record copyWith({int? id, String? date, int? doctor, int? service}) => Record(
        id: id ?? this.id,
        date: date ?? this.date,
        doctor: doctor ?? this.doctor,
        service: service ?? this.service,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('doctor: $doctor, ')
          ..write('service: $service')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, doctor, service);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.date == this.date &&
          other.doctor == this.doctor &&
          other.service == this.service);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<int> id;
  final Value<String> date;
  final Value<int> doctor;
  final Value<int> service;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.doctor = const Value.absent(),
    this.service = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    required String date,
    required int doctor,
    required int service,
  })  : date = Value(date),
        doctor = Value(doctor),
        service = Value(service);
  static Insertable<Record> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<int>? doctor,
    Expression<int>? service,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (doctor != null) 'doctor': doctor,
      if (service != null) 'service': service,
    });
  }

  RecordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? date,
      Value<int>? doctor,
      Value<int>? service}) {
    return RecordsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      doctor: doctor ?? this.doctor,
      service: service ?? this.service,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (doctor.present) {
      map['doctor'] = Variable<int>(doctor.value);
    }
    if (service.present) {
      map['service'] = Variable<int>(service.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('doctor: $doctor, ')
          ..write('service: $service')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $DoctorsTable doctors = $DoctorsTable(this);
  late final $HospitalServicesTable hospitalServices =
      $HospitalServicesTable(this);
  late final $RecordsTable records = $RecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [doctors, hospitalServices, records];
}
