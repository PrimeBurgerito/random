import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smite_god.g.dart';

@JsonSerializable(anyMap: true, fieldRename: FieldRename.pascal)
class SmiteGod {
  static final DatabaseReference _ref =
      FirebaseDatabase.instance.reference().child('random/game/smite/god');

  static Future<List<SmiteGod>> fetchAll() async {
    final DataSnapshot snapshot = await _ref.once();
    final Map<dynamic, dynamic> nameToGod = snapshot.value;
    final gods = nameToGod.entries.map((e) {
      final value = Map.from(e.value);
      return SmiteGod.fromJson(value);
    });
    return List<SmiteGod>.from(gods);
  }

  final String ability1;
  final String ability2;
  final String ability3;
  final String ability4;
  final String ability5;
  final int abilityId1;
  final int abilityId2;
  final int abilityId3;
  final int abilityId4;
  final int abilityId5;
  @JsonKey(name: 'Ability_1')
  final Ability smiteGodAbility1;
  @JsonKey(name: 'Ability_2')
  final Ability smiteGodAbility2;
  @JsonKey(name: 'Ability_3')
  final Ability smiteGodAbility3;
  @JsonKey(name: 'Ability_4')
  final Ability smiteGodAbility4;
  @JsonKey(name: 'Ability_5')
  final Ability smiteGodAbility5;
  final double attackSpeed;
  final double attackSpeedPerLevel;
  final String autoBanned;
  final String cons;
  @JsonKey(name: 'HP5PerLevel')
  final double hp5PerLevel;
  final int health;
  final int healthPerFive;
  final int healthPerLevel;
  final String lore;
  @JsonKey(name: 'MP5PerLevel')
  final double mp5PerLevel;
  final int magicProtection;
  final double magicProtectionPerLevel;
  final int magicalPower;
  final double magicalPowerPerLevel;
  final int mana;
  final double manaPerFive;
  final int manaPerLevel;
  final String name;
  final String onFreeRotation;
  final String pantheon;
  final int physicalPower;
  final double physicalPowerPerLevel;
  final int physicalProtection;
  final double physicalProtectionPerLevel;
  final String pros;
  final Role roles;
  final int speed;
  final String title;
  final String type;
  @JsonKey(name: 'abilityDescription1')
  final AbilityDescription abilityDescription1;
  @JsonKey(name: 'abilityDescription2')
  final AbilityDescription abilityDescription2;
  @JsonKey(name: 'abilityDescription3')
  final AbilityDescription abilityDescription3;
  @JsonKey(name: 'abilityDescription4')
  final AbilityDescription abilityDescription4;
  @JsonKey(name: 'abilityDescription5')
  final AbilityDescription abilityDescription5;
  @JsonKey(name: 'basicAttack', required: false)
  final AbilityDescription? basicAttack;
  @JsonKey(name: 'godAbility1_URL')
  final String godAbility1Url;
  @JsonKey(name: 'godAbility2_URL')
  final String godAbility2Url;
  @JsonKey(name: 'godAbility3_URL')
  final String godAbility3Url;
  @JsonKey(name: 'godAbility4_URL')
  final String godAbility4Url;
  @JsonKey(name: 'godAbility5_URL')
  final String godAbility5Url;
  @JsonKey(name: 'godCard_URL')
  final String godCardUrl;
  @JsonKey(name: 'godIcon_URL')
  final String godIconUrl;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'latestGod')
  final LatestGod latestGod;
  @JsonKey(name: 'ret_msg')
  final dynamic retMsg;

  SmiteGod(
    this.ability1,
    this.ability2,
    this.ability3,
    this.ability4,
    this.ability5,
    this.abilityId1,
    this.abilityId2,
    this.abilityId3,
    this.abilityId4,
    this.abilityId5,
    this.smiteGodAbility1,
    this.smiteGodAbility2,
    this.smiteGodAbility3,
    this.smiteGodAbility4,
    this.smiteGodAbility5,
    this.attackSpeed,
    this.attackSpeedPerLevel,
    this.autoBanned,
    this.cons,
    this.hp5PerLevel,
    this.health,
    this.healthPerFive,
    this.healthPerLevel,
    this.lore,
    this.mp5PerLevel,
    this.magicProtection,
    this.magicProtectionPerLevel,
    this.magicalPower,
    this.magicalPowerPerLevel,
    this.mana,
    this.manaPerFive,
    this.manaPerLevel,
    this.name,
    this.onFreeRotation,
    this.pantheon,
    this.physicalPower,
    this.physicalPowerPerLevel,
    this.physicalProtection,
    this.physicalProtectionPerLevel,
    this.pros,
    this.roles,
    this.speed,
    this.title,
    this.type,
    this.abilityDescription1,
    this.abilityDescription2,
    this.abilityDescription3,
    this.abilityDescription4,
    this.abilityDescription5,
    this.basicAttack,
    this.godAbility1Url,
    this.godAbility2Url,
    this.godAbility3Url,
    this.godAbility4Url,
    this.godAbility5Url,
    this.godCardUrl,
    this.godIconUrl,
    this.id,
    this.latestGod,
    this.retMsg,
  );

  factory SmiteGod.fromJson(Map json) => _$SmiteGodFromJson(json);

  Map<String, dynamic> toJson() => _$SmiteGodToJson(this);
}

@JsonSerializable(anyMap: true)
class AbilityDescription {
  final ItemDescription itemDescription;

  AbilityDescription(this.itemDescription);

  factory AbilityDescription.fromJson(Map json) =>
      _$AbilityDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityDescriptionToJson(this);
}

@JsonSerializable(anyMap: true)
class ItemDescription {
  @JsonKey(name: 'cooldown')
  final String coolDown;
  final String cost;
  final String description;
  @JsonKey(name: 'menuitems', required: false)
  final List<Item> menuItems;
  @JsonKey(name: 'rankitems', required: false)
  final List<Item> rankItems;

  ItemDescription(
    this.coolDown,
    this.cost,
    this.description,
    List<Item>? menuItems,
    List<Item>? rankItems,
  )   : menuItems = menuItems ?? [],
        rankItems = rankItems ?? [];

  factory ItemDescription.fromJson(Map json) => _$ItemDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDescriptionToJson(this);
}

@JsonSerializable(anyMap: true)
class Item {
  final String description;
  final String value;

  Item(
    this.description,
    this.value,
  );

  factory Item.fromJson(Map json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable(anyMap: true, fieldRename: FieldRename.pascal)
class Ability {
  final AbilityDescription description;
  final int id;
  final String summary;
  @JsonKey(name: 'URL')
  final String url;

  Ability(
    this.description,
    this.id,
    this.summary,
    this.url,
  );

  factory Ability.fromJson(Map json) => _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

enum LatestGod { n, y }

enum Role {
  @JsonValue('Warrior')
  warrior,
  @JsonValue('Mage')
  mage,
  @JsonValue('Hunter')
  hunter,
  @JsonValue('Assassin')
  assassin,
  @JsonValue('Guardian')
  guardian,
}
