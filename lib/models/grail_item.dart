class GrailItem {
  final String id;
  final String name;
  final String category;
  final String baseType;
  final bool isSet;

  const GrailItem({
    required this.id,
    required this.name,
    required this.category,
    required this.baseType,
    this.isSet = false,
  });
}

class GrailCategory {
  final String name;
  final List<GrailItem> items;

  const GrailCategory({required this.name, required this.items});
}

// ─── Unique Items ────────────────────────────────────────────────────────────

const List<GrailCategory> kGrailCategories = [
  GrailCategory(name: 'Helms', items: _uniqueHelms),
  GrailCategory(name: 'Body Armor', items: _uniqueArmor),
  GrailCategory(name: 'Shields', items: _uniqueShields),
  GrailCategory(name: 'Gloves', items: _uniqueGloves),
  GrailCategory(name: 'Boots', items: _uniqueBoots),
  GrailCategory(name: 'Belts', items: _uniqueBelts),
  GrailCategory(name: 'Weapons', items: _uniqueWeapons),
  GrailCategory(name: 'Rings', items: _uniqueRings),
  GrailCategory(name: 'Amulets', items: _uniqueAmulets),
  GrailCategory(name: 'Charms', items: _uniqueCharms),
  GrailCategory(name: 'Jewels', items: _uniqueJewels),
  GrailCategory(name: 'Set Items', items: _setItems),
];

// Unique Helms
const _uniqueHelms = [
  GrailItem(id: 'h1',  name: 'Biggin\'s Bonnet',     category: 'Helms', baseType: 'Cap'),
  GrailItem(id: 'h2',  name: 'Tarnhelm',             category: 'Helms', baseType: 'Skull Cap'),
  GrailItem(id: 'h3',  name: 'Coif of Glory',        category: 'Helms', baseType: 'Helm'),
  GrailItem(id: 'h4',  name: 'Duskdeep',             category: 'Helms', baseType: 'Full Helm'),
  GrailItem(id: 'h5',  name: 'Wormskull',            category: 'Helms', baseType: 'Bone Helm'),
  GrailItem(id: 'h6',  name: 'Howltusk',             category: 'Helms', baseType: 'Great Helm'),
  GrailItem(id: 'h7',  name: 'Undead Crown',         category: 'Helms', baseType: 'Crown'),
  GrailItem(id: 'h8',  name: 'The Face of Horror',   category: 'Helms', baseType: 'Mask'),
  GrailItem(id: 'h9',  name: 'Rockstopper',          category: 'Helms', baseType: 'Sallet'),
  GrailItem(id: 'h10', name: 'Stealskull',           category: 'Helms', baseType: 'Casque'),
  GrailItem(id: 'h11', name: 'Darksight Helm',       category: 'Helms', baseType: 'Basinet'),
  GrailItem(id: 'h12', name: 'Valkyrie Wing',        category: 'Helms', baseType: 'Winged Helm'),
  GrailItem(id: 'h13', name: 'Kira\'s Guardian',     category: 'Helms', baseType: 'Tiara'),
  GrailItem(id: 'h14', name: 'Blackhorn\'s Face',    category: 'Helms', baseType: 'Death Mask'),
  GrailItem(id: 'h15', name: 'Vampire Gaze',         category: 'Helms', baseType: 'Grim Helm'),
  GrailItem(id: 'h16', name: 'Crown of Thieves',     category: 'Helms', baseType: 'Grand Crown'),
  GrailItem(id: 'h17', name: 'Harlequin Crest',      category: 'Helms', baseType: 'Shako'),
  GrailItem(id: 'h18', name: 'Nightwing\'s Veil',    category: 'Helms', baseType: 'Spired Helm'),
  GrailItem(id: 'h19', name: 'Crown of Ages',        category: 'Helms', baseType: 'Corona'),
  GrailItem(id: 'h20', name: 'Andariel\'s Visage',   category: 'Helms', baseType: 'Demonhead'),
  GrailItem(id: 'h21', name: 'Griffon\'s Eye',       category: 'Helms', baseType: 'Diadem'),
  GrailItem(id: 'h22', name: 'Giant Skull',          category: 'Helms', baseType: 'Bone Visage'),
];

// Unique Body Armor
const _uniqueArmor = [
  GrailItem(id: 'a1',  name: 'Greyform',             category: 'Body Armor', baseType: 'Quilted Armor'),
  GrailItem(id: 'a2',  name: 'Blinkbat\'s Form',     category: 'Body Armor', baseType: 'Leather Armor'),
  GrailItem(id: 'a3',  name: 'The Centurion',        category: 'Body Armor', baseType: 'Hard Leather Armor'),
  GrailItem(id: 'a4',  name: 'Twitchthroe',          category: 'Body Armor', baseType: 'Studded Leather'),
  GrailItem(id: 'a5',  name: 'Darkglow',             category: 'Body Armor', baseType: 'Ring Mail'),
  GrailItem(id: 'a6',  name: 'Hawkmail',             category: 'Body Armor', baseType: 'Scale Mail'),
  GrailItem(id: 'a7',  name: 'Silks of the Victor',  category: 'Body Armor', baseType: 'Light Plate'),
  GrailItem(id: 'a8',  name: 'Sparking Mail',        category: 'Body Armor', baseType: 'Chain Mail'),
  GrailItem(id: 'a9',  name: 'Venom Ward',           category: 'Body Armor', baseType: 'Breast Plate'),
  GrailItem(id: 'a10', name: 'Iceblink',             category: 'Body Armor', baseType: 'Splint Mail'),
  GrailItem(id: 'a11', name: 'Boneflesh',            category: 'Body Armor', baseType: 'Plate Mail'),
  GrailItem(id: 'a12', name: 'Rockfleece',           category: 'Body Armor', baseType: 'Field Plate'),
  GrailItem(id: 'a13', name: 'Rattlecage',           category: 'Body Armor', baseType: 'Gothic Plate'),
  GrailItem(id: 'a14', name: 'Goldskin',             category: 'Body Armor', baseType: 'Full Plate Mail'),
  GrailItem(id: 'a15', name: 'Skeleton Disguise',    category: 'Body Armor', baseType: 'Light Plate'),
  GrailItem(id: 'a16', name: 'Crow Caw',             category: 'Body Armor', baseType: 'Tigulated Mail'),
  GrailItem(id: 'a17', name: 'Shaftstop',            category: 'Body Armor', baseType: 'Mesh Armor'),
  GrailItem(id: 'a18', name: 'Duriel\'s Shell',      category: 'Body Armor', baseType: 'Cuirass'),
  GrailItem(id: 'a19', name: 'Skullder\'s Ire',      category: 'Body Armor', baseType: 'Russet Armor'),
  GrailItem(id: 'a20', name: 'Heavenly Garb',        category: 'Body Armor', baseType: 'Light Plate'),
  GrailItem(id: 'a21', name: 'Skin of the Vipermagi', category: 'Body Armor', baseType: 'Serpentskin Armor'),
  GrailItem(id: 'a22', name: 'Skin of the Flayed One', category: 'Body Armor', baseType: 'Demonhide Armor'),
  GrailItem(id: 'a23', name: 'Iron Pelt',            category: 'Body Armor', baseType: 'Trellised Armor'),
  GrailItem(id: 'a24', name: 'Spirit Forge',         category: 'Body Armor', baseType: 'Linked Mail'),
  GrailItem(id: 'a25', name: 'Gaurdian Angel',       category: 'Body Armor', baseType: 'Templar Coat'),
  GrailItem(id: 'a26', name: 'Toothrow',             category: 'Body Armor', baseType: 'Sharktooth Armor'),
  GrailItem(id: 'a27', name: 'Atma\'s Wail',         category: 'Body Armor', baseType: 'Embossed Plate'),
  GrailItem(id: 'a28', name: 'Black Hades',          category: 'Body Armor', baseType: 'Chaos Armor'),
  GrailItem(id: 'a29', name: 'Corpsemourn',          category: 'Body Armor', baseType: 'Ornate Plate'),
  GrailItem(id: 'a30', name: 'Que-Hegan\'s Wisdom',  category: 'Body Armor', baseType: 'Mage Plate'),
  GrailItem(id: 'a31', name: 'Arkaine\'s Valor',     category: 'Body Armor', baseType: 'Balrog Skin'),
  GrailItem(id: 'a32', name: 'Ormus\' Robes',        category: 'Body Armor', baseType: 'Dusk Shroud'),
  GrailItem(id: 'a33', name: 'Leviathan',            category: 'Body Armor', baseType: 'Kraken Shell'),
  GrailItem(id: 'a34', name: 'Steel Carapace',       category: 'Body Armor', baseType: 'Shadow Plate'),
  GrailItem(id: 'a35', name: 'Tyrael\'s Might',      category: 'Body Armor', baseType: 'Sacred Armor'),
  GrailItem(id: 'a36', name: 'Viperfork',            category: 'Body Armor', baseType: 'Mage Plate'),
];

// Unique Shields
const _uniqueShields = [
  GrailItem(id: 's1',  name: 'Pelta Lunata',         category: 'Shields', baseType: 'Buckler'),
  GrailItem(id: 's2',  name: 'Umbral Disk',          category: 'Shields', baseType: 'Small Shield'),
  GrailItem(id: 's3',  name: 'Stormguild',           category: 'Shields', baseType: 'Large Shield'),
  GrailItem(id: 's4',  name: 'Steelclash',           category: 'Shields', baseType: 'Kite Shield'),
  GrailItem(id: 's5',  name: 'Bverrit Keep',         category: 'Shields', baseType: 'Tower Shield'),
  GrailItem(id: 's6',  name: 'Wall of the Eyeless',  category: 'Shields', baseType: 'Bone Shield'),
  GrailItem(id: 's7',  name: 'Swordback Hold',       category: 'Shields', baseType: 'Spiked Shield'),
  GrailItem(id: 's8',  name: 'Visceratuant',         category: 'Shields', baseType: 'Defender'),
  GrailItem(id: 's9',  name: 'Moser\'s Blessed Circle', category: 'Shields', baseType: 'Round Shield'),
  GrailItem(id: 's10', name: 'Rockstopper',          category: 'Shields', baseType: 'Sallet'),
  GrailItem(id: 's11', name: 'Stormchaser',          category: 'Shields', baseType: 'Ancient Shield'),
  GrailItem(id: 's12', name: 'Lidless Wall',         category: 'Shields', baseType: 'Grim Shield'),
  GrailItem(id: 's13', name: 'Lance Guard',          category: 'Shields', baseType: 'Pavise'),
  GrailItem(id: 's14', name: 'Gerke\'s Sanctuary',   category: 'Shields', baseType: 'Pavise'),
  GrailItem(id: 's15', name: 'Radament\'s Sphere',   category: 'Shields', baseType: 'Hyperion'),
  GrailItem(id: 's16', name: 'Milabrega\'s Orb',     category: 'Shields', baseType: 'Kite Shield'),
  GrailItem(id: 's17', name: 'Alma Negra',           category: 'Shields', baseType: 'Sacred Rondache'),
  GrailItem(id: 's18', name: 'Darkforce Spawn',      category: 'Shields', baseType: 'Bloodlord Skull'),
  GrailItem(id: 's19', name: 'Boneflame',            category: 'Shields', baseType: 'Succubus Skull'),
  GrailItem(id: 's20', name: 'Spike Thorn',          category: 'Shields', baseType: 'Blade Barrier'),
  GrailItem(id: 's21', name: 'Head Hunter\'s Glory', category: 'Shields', baseType: 'Troll Nest'),
  GrailItem(id: 's22', name: 'Thunderstroke',        category: 'Shields', baseType: 'Matriarchal Javelin'),
  GrailItem(id: 's23', name: 'The Aegis',            category: 'Shields', baseType: 'Aegis'),
  GrailItem(id: 's24', name: 'Hellcleft',            category: 'Shields', baseType: 'War Fork'),
  GrailItem(id: 's25', name: 'Dragonscale',          category: 'Shields', baseType: 'Monarch'),
];

// Unique Gloves
const _uniqueGloves = [
  GrailItem(id: 'g1',  name: 'The Hand of Broc',     category: 'Gloves', baseType: 'Leather Gloves'),
  GrailItem(id: 'g2',  name: 'Bloodfist',            category: 'Gloves', baseType: 'Heavy Gloves'),
  GrailItem(id: 'g3',  name: 'Chance Guards',        category: 'Gloves', baseType: 'Chain Gloves'),
  GrailItem(id: 'g4',  name: 'Magefist',             category: 'Gloves', baseType: 'Light Gauntlets'),
  GrailItem(id: 'g5',  name: 'Frostburn',            category: 'Gloves', baseType: 'Gauntlets'),
  GrailItem(id: 'g6',  name: 'Hellmouth',            category: 'Gloves', baseType: 'War Gauntlets'),
  GrailItem(id: 'g7',  name: 'Gravepalm',            category: 'Gloves', baseType: 'Sharkskin Gloves'),
  GrailItem(id: 'g8',  name: 'Ghoulhide',            category: 'Gloves', baseType: 'Heavy Bracers'),
  GrailItem(id: 'g9',  name: 'Lava Gout',            category: 'Gloves', baseType: 'Battle Gauntlets'),
  GrailItem(id: 'g10', name: 'Venom Grip',           category: 'Gloves', baseType: 'Demonhide Gloves'),
  GrailItem(id: 'g11', name: 'Dracul\'s Grasp',      category: 'Gloves', baseType: 'Vampirebone Gloves'),
  GrailItem(id: 'g12', name: 'Soul Drainer',         category: 'Gloves', baseType: 'Vambraces'),
  GrailItem(id: 'g13', name: 'Steelrend',            category: 'Gloves', baseType: 'Ogre Gauntlets'),
];

// Unique Boots
const _uniqueBoots = [
  GrailItem(id: 'b1',  name: 'Hotspur',              category: 'Boots', baseType: 'Boots'),
  GrailItem(id: 'b2',  name: 'Gorefoot',             category: 'Boots', baseType: 'Heavy Boots'),
  GrailItem(id: 'b3',  name: 'Treads of Cthon',      category: 'Boots', baseType: 'Chain Boots'),
  GrailItem(id: 'b4',  name: 'Goblin Toe',           category: 'Boots', baseType: 'Light Plated Boots'),
  GrailItem(id: 'b5',  name: 'Tearhaunch',           category: 'Boots', baseType: 'Greaves'),
  GrailItem(id: 'b6',  name: 'Infernostride',        category: 'Boots', baseType: 'Demonhide Boots'),
  GrailItem(id: 'b7',  name: 'Waterwalk',            category: 'Boots', baseType: 'Sharkskin Boots'),
  GrailItem(id: 'b8',  name: 'Silkweave',            category: 'Boots', baseType: 'Mesh Boots'),
  GrailItem(id: 'b9',  name: 'War Traveler',         category: 'Boots', baseType: 'Battle Boots'),
  GrailItem(id: 'b10', name: 'Gore Rider',           category: 'Boots', baseType: 'War Boots'),
  GrailItem(id: 'b11', name: 'Sandstorm Trek',       category: 'Boots', baseType: 'Scarabshell Boots'),
  GrailItem(id: 'b12', name: 'Marrowwalk',           category: 'Boots', baseType: 'Boneweave Boots'),
  GrailItem(id: 'b13', name: 'Ethereal Edge',        category: 'Boots', baseType: 'Fire Walkers'),
  GrailItem(id: 'b14', name: 'Shadow Dancer',        category: 'Boots', baseType: 'Myrmidon Greaves'),
];

// Unique Belts
const _uniqueBelts = [
  GrailItem(id: 'bl1', name: 'Sash of Knives',       category: 'Belts', baseType: 'Sash'),
  GrailItem(id: 'bl2', name: 'Nightsmoke',           category: 'Belts', baseType: 'Belt'),
  GrailItem(id: 'bl3', name: 'Goldwrap',             category: 'Belts', baseType: 'Heavy Belt'),
  GrailItem(id: 'bl4', name: 'Bladebuckle',          category: 'Belts', baseType: 'Plated Belt'),
  GrailItem(id: 'bl5', name: 'String of Ears',       category: 'Belts', baseType: 'Demonhide Sash'),
  GrailItem(id: 'bl6', name: 'Razortail',            category: 'Belts', baseType: 'Sharkskin Belt'),
  GrailItem(id: 'bl7', name: 'Gloom\'s Trap',        category: 'Belts', baseType: 'Mesh Belt'),
  GrailItem(id: 'bl8', name: 'Thundergod\'s Vigor',  category: 'Belts', baseType: 'War Belt'),
  GrailItem(id: 'bl9', name: 'Arachnid Mesh',        category: 'Belts', baseType: 'Spiderweb Sash'),
  GrailItem(id: 'bl10', name: 'Nosferatu\'s Coil',   category: 'Belts', baseType: 'Vampirefang Belt'),
  GrailItem(id: 'bl11', name: 'Verdungo\'s Hearty Cord', category: 'Belts', baseType: 'Mithril Coil'),
  GrailItem(id: 'bl12', name: 'Carrion Wind',        category: 'Belts', baseType: 'Ring'),
];

// Unique Weapons (selection of key items)
const _uniqueWeapons = [
  GrailItem(id: 'w1',  name: 'The Gnasher',          category: 'Weapons', baseType: 'Hand Axe'),
  GrailItem(id: 'w2',  name: 'Deathspade',           category: 'Weapons', baseType: 'Axe'),
  GrailItem(id: 'w3',  name: 'Bladebone',            category: 'Weapons', baseType: 'Double Axe'),
  GrailItem(id: 'w4',  name: 'Skull Splitter',       category: 'Weapons', baseType: 'Military Pick'),
  GrailItem(id: 'w5',  name: 'Rakescar',             category: 'Weapons', baseType: 'War Axe'),
  GrailItem(id: 'w6',  name: 'Axe of Fechmar',       category: 'Weapons', baseType: 'Large Axe'),
  GrailItem(id: 'w7',  name: 'Goreshovel',           category: 'Weapons', baseType: 'Broad Axe'),
  GrailItem(id: 'w8',  name: 'The Chieftain',        category: 'Weapons', baseType: 'Battle Axe'),
  GrailItem(id: 'w9',  name: 'Brainhew',             category: 'Weapons', baseType: 'Great Axe'),
  GrailItem(id: 'w10', name: 'Humongous',            category: 'Weapons', baseType: 'Giant Axe'),
  GrailItem(id: 'w11', name: 'Torch of Iro',         category: 'Weapons', baseType: 'Wand'),
  GrailItem(id: 'w12', name: 'Maelstrom',            category: 'Weapons', baseType: 'Yew Wand'),
  GrailItem(id: 'w13', name: 'Gravenspine',          category: 'Weapons', baseType: 'Bone Wand'),
  GrailItem(id: 'w14', name: 'Ume\'s Lament',        category: 'Weapons', baseType: 'Grim Wand'),
  GrailItem(id: 'w15', name: 'Suicide Branch',       category: 'Weapons', baseType: 'Burnt Wand'),
  GrailItem(id: 'w16', name: 'Carin Shard',          category: 'Weapons', baseType: 'Petrified Wand'),
  GrailItem(id: 'w17', name: 'The Witch\'s Knot',    category: 'Weapons', baseType: 'Tomb Wand'),
  GrailItem(id: 'w18', name: 'Arm of King Leoric',   category: 'Weapons', baseType: 'Tomb Wand'),
  GrailItem(id: 'w19', name: 'Blackhand Key',        category: 'Weapons', baseType: 'Grave Wand'),
  GrailItem(id: 'w20', name: 'The Oculus',           category: 'Weapons', baseType: 'Swirling Crystal'),
  GrailItem(id: 'w21', name: 'Harlequin Crest',      category: 'Weapons', baseType: 'Shako'),
  GrailItem(id: 'w22', name: 'Eschuta\'s Temper',    category: 'Weapons', baseType: 'Eldritch Orb'),
  GrailItem(id: 'w23', name: 'Death\'s Web',         category: 'Weapons', baseType: 'Unearthed Wand'),
  GrailItem(id: 'w24', name: 'Wizardspike',          category: 'Weapons', baseType: 'Bone Knife'),
  GrailItem(id: 'w25', name: 'The Grandfather',      category: 'Weapons', baseType: 'Colossus Blade'),
  GrailItem(id: 'w26', name: 'Doombringer',          category: 'Weapons', baseType: 'Champion Sword'),
  GrailItem(id: 'w27', name: 'Windforce',            category: 'Weapons', baseType: 'Hydra Bow'),
  GrailItem(id: 'w28', name: 'Buriza-Do Kyanon',     category: 'Weapons', baseType: 'Ballista'),
  GrailItem(id: 'w29', name: 'Stormspire',           category: 'Weapons', baseType: 'Giant Thresher'),
  GrailItem(id: 'w30', name: 'Ethereal Edge',        category: 'Weapons', baseType: 'Fire Walkers'),
  GrailItem(id: 'w31', name: 'Lightsabre',           category: 'Weapons', baseType: 'Phase Blade'),
  GrailItem(id: 'w32', name: 'Azurewrath',           category: 'Weapons', baseType: 'Phase Blade'),
  GrailItem(id: 'w33', name: 'Ondal\'s Wisdom',      category: 'Weapons', baseType: 'Elder Staff'),
  GrailItem(id: 'w34', name: 'Bul-Kathos\' Sacred Charge', category: 'Weapons', baseType: 'Colossus Blade'),
  GrailItem(id: 'w35', name: 'Bul-Kathos\' Tribal Guardian', category: 'Weapons', baseType: 'Mythical Sword'),
  GrailItem(id: 'w36', name: 'Hellslayer',           category: 'Weapons', baseType: 'Dimensional Blade'),
  GrailItem(id: 'w37', name: 'Messerschmidt\'s Reaver', category: 'Weapons', baseType: 'Champion Axe'),
  GrailItem(id: 'w38', name: 'Cranebeak',            category: 'Weapons', baseType: 'War Spike'),
  GrailItem(id: 'w39', name: 'Nord\'s Tenderizer',   category: 'Weapons', baseType: 'Truncheon'),
  GrailItem(id: 'w40', name: 'Earthshaker',          category: 'Weapons', baseType: 'Battle Hammer'),
  GrailItem(id: 'w41', name: 'Shadowfang',           category: 'Weapons', baseType: 'Two-Handed Sword'),
  GrailItem(id: 'w42', name: 'Soul Harvest',         category: 'Weapons', baseType: 'Elegant Blade'),
  GrailItem(id: 'w43', name: 'The Reaper\'s Toll',   category: 'Weapons', baseType: 'Thresher'),
  GrailItem(id: 'w44', name: 'Bonehew',              category: 'Weapons', baseType: 'Ogre Axe'),
  GrailItem(id: 'w45', name: 'Infinity',             category: 'Weapons', baseType: 'Thresher (RW)'),
];

// Unique Rings
const _uniqueRings = [
  GrailItem(id: 'r1',  name: 'Nagelring',            category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r2',  name: 'Manald Heal',          category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r3',  name: 'The Stone of Jordan',  category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r4',  name: 'Dwarf Star',           category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r5',  name: 'Raven Frost',          category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r6',  name: 'Bul-Kathos\' Wedding Band', category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r7',  name: 'Carrion Wind',         category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r8',  name: 'Nature\'s Peace',      category: 'Rings', baseType: 'Ring'),
  GrailItem(id: 'r9',  name: 'Wisp Projector',       category: 'Rings', baseType: 'Ring'),
];

// Unique Amulets
const _uniqueAmulets = [
  GrailItem(id: 'am1', name: 'Nokozan Relic',        category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am2', name: 'The Eye of Etlich',    category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am3', name: 'Mahim-Oak Curio',      category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am4', name: 'Saracen\'s Chance',    category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am5', name: 'The Rising Sun',       category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am6', name: 'Atma\'s Scarab',       category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am7', name: 'The Cat\'s Eye',       category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am8', name: 'Highlord\'s Wrath',    category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am9', name: 'Mara\'s Kaleidoscope', category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am10', name: 'Seraph\'s Hymn',      category: 'Amulets', baseType: 'Amulet'),
  GrailItem(id: 'am11', name: 'Metalgrid',           category: 'Amulets', baseType: 'Amulet'),
];

// Unique Charms
const _uniqueCharms = [
  GrailItem(id: 'ch1', name: 'Annihilus',            category: 'Charms', baseType: 'Small Charm'),
  GrailItem(id: 'ch2', name: 'Hellfire Torch',       category: 'Charms', baseType: 'Large Charm'),
  GrailItem(id: 'ch3', name: 'Gheed\'s Fortune',     category: 'Charms', baseType: 'Grand Charm'),
];

// Unique Jewels
const _uniqueJewels = [
  GrailItem(id: 'j1',  name: 'Rainbow Facet (Fire)', category: 'Jewels', baseType: 'Jewel'),
  GrailItem(id: 'j2',  name: 'Rainbow Facet (Cold)', category: 'Jewels', baseType: 'Jewel'),
  GrailItem(id: 'j3',  name: 'Rainbow Facet (Lightning)', category: 'Jewels', baseType: 'Jewel'),
  GrailItem(id: 'j4',  name: 'Rainbow Facet (Poison)', category: 'Jewels', baseType: 'Jewel'),
  GrailItem(id: 'j5',  name: 'Coruscating Gem',      category: 'Jewels', baseType: 'Jewel'),
];

// Set Items
const _setItems = [
  // Civerb's Vestments
  GrailItem(id: 'si1',  name: 'Civerb\'s Icon',        category: 'Set Items', baseType: 'Amulet', isSet: true),
  GrailItem(id: 'si2',  name: 'Civerb\'s Cudgel',      category: 'Set Items', baseType: 'Grand Scepter', isSet: true),
  GrailItem(id: 'si3',  name: 'Civerb\'s Ward',        category: 'Set Items', baseType: 'Large Shield', isSet: true),
  // Isenhart's Armory
  GrailItem(id: 'si4',  name: 'Isenhart\'s Lightbrand', category: 'Set Items', baseType: 'Broad Sword', isSet: true),
  GrailItem(id: 'si5',  name: 'Isenhart\'s Parry',     category: 'Set Items', baseType: 'Gothic Shield', isSet: true),
  GrailItem(id: 'si6',  name: 'Isenhart\'s Case',      category: 'Set Items', baseType: 'Breast Plate', isSet: true),
  GrailItem(id: 'si7',  name: 'Isenhart\'s Horns',     category: 'Set Items', baseType: 'Full Helm', isSet: true),
  // Hsaru's Defense
  GrailItem(id: 'si8',  name: 'Hsaru\'s Iron Heel',    category: 'Set Items', baseType: 'Chain Boots', isSet: true),
  GrailItem(id: 'si9',  name: 'Hsaru\'s Iron Stay',    category: 'Set Items', baseType: 'Belt', isSet: true),
  GrailItem(id: 'si10', name: 'Hsaru\'s Iron Fist',    category: 'Set Items', baseType: 'Buckler', isSet: true),
  // Cleglaw's Brace
  GrailItem(id: 'si11', name: 'Cleglaw\'s Tooth',      category: 'Set Items', baseType: 'Long Sword', isSet: true),
  GrailItem(id: 'si12', name: 'Cleglaw\'s Claw',       category: 'Set Items', baseType: 'Small Shield', isSet: true),
  GrailItem(id: 'si13', name: 'Cleglaw\'s Pincers',    category: 'Set Items', baseType: 'Chain Gloves', isSet: true),
  // Iratha's Finery
  GrailItem(id: 'si14', name: 'Iratha\'s Collar',      category: 'Set Items', baseType: 'Amulet', isSet: true),
  GrailItem(id: 'si15', name: 'Iratha\'s Cuff',        category: 'Set Items', baseType: 'Light Gauntlets', isSet: true),
  GrailItem(id: 'si16', name: 'Iratha\'s Coil',        category: 'Set Items', baseType: 'Cap', isSet: true),
  GrailItem(id: 'si17', name: 'Iratha\'s Cord',        category: 'Set Items', baseType: 'Heavy Belt', isSet: true),
  // Vidala's Rig
  GrailItem(id: 'si18', name: 'Vidala\'s Barb',        category: 'Set Items', baseType: 'Long Battle Bow', isSet: true),
  GrailItem(id: 'si19', name: 'Vidala\'s Fetlock',     category: 'Set Items', baseType: 'Light Plated Boots', isSet: true),
  GrailItem(id: 'si20', name: 'Vidala\'s Ambush',      category: 'Set Items', baseType: 'Leather Armor', isSet: true),
  GrailItem(id: 'si21', name: 'Vidala\'s Snare',       category: 'Set Items', baseType: 'Amulet', isSet: true),
  // Milabrega's Regalia
  GrailItem(id: 'si22', name: 'Milabrega\'s Orb',      category: 'Set Items', baseType: 'Kite Shield', isSet: true),
  GrailItem(id: 'si23', name: 'Milabrega\'s Rod',      category: 'Set Items', baseType: 'War Scepter', isSet: true),
  GrailItem(id: 'si24', name: 'Milabrega\'s Diadem',   category: 'Set Items', baseType: 'Crown', isSet: true),
  GrailItem(id: 'si25', name: 'Milabrega\'s Robe',     category: 'Set Items', baseType: 'Ancient Armor', isSet: true),
  // Cathan's Traps
  GrailItem(id: 'si26', name: 'Cathan\'s Rule',        category: 'Set Items', baseType: 'Battle Staff', isSet: true),
  GrailItem(id: 'si27', name: 'Cathan\'s Mesh',        category: 'Set Items', baseType: 'Chain Mail', isSet: true),
  GrailItem(id: 'si28', name: 'Cathan\'s Visage',      category: 'Set Items', baseType: 'Mask', isSet: true),
  GrailItem(id: 'si29', name: 'Cathan\'s Sigil',       category: 'Set Items', baseType: 'Amulet', isSet: true),
  GrailItem(id: 'si30', name: 'Cathan\'s Seal',        category: 'Set Items', baseType: 'Ring', isSet: true),
  // Tancred's Battlegear
  GrailItem(id: 'si31', name: 'Tancred\'s Crowbill',   category: 'Set Items', baseType: 'Military Pick', isSet: true),
  GrailItem(id: 'si32', name: 'Tancred\'s Spine',      category: 'Set Items', baseType: 'Full Plate Mail', isSet: true),
  GrailItem(id: 'si33', name: 'Tancred\'s Hobnails',   category: 'Set Items', baseType: 'Boots', isSet: true),
  GrailItem(id: 'si34', name: 'Tancred\'s Weird',      category: 'Set Items', baseType: 'Amulet', isSet: true),
  GrailItem(id: 'si35', name: 'Tancred\'s Skull',      category: 'Set Items', baseType: 'Bone Helm', isSet: true),
  // Sigon's Complete Steel
  GrailItem(id: 'si36', name: 'Sigon\'s Gage',         category: 'Set Items', baseType: 'Gauntlets', isSet: true),
  GrailItem(id: 'si37', name: 'Sigon\'s Visor',        category: 'Set Items', baseType: 'Great Helm', isSet: true),
  GrailItem(id: 'si38', name: 'Sigon\'s Shelter',      category: 'Set Items', baseType: 'Gothic Plate', isSet: true),
  GrailItem(id: 'si39', name: 'Sigon\'s Sabot',        category: 'Set Items', baseType: 'Greaves', isSet: true),
  GrailItem(id: 'si40', name: 'Sigon\'s Wrap',         category: 'Set Items', baseType: 'Plated Belt', isSet: true),
  GrailItem(id: 'si41', name: 'Sigon\'s Guard',        category: 'Set Items', baseType: 'Tower Shield', isSet: true),
  // Infernal Tools
  GrailItem(id: 'si42', name: 'Infernal Cranium',      category: 'Set Items', baseType: 'Cap', isSet: true),
  GrailItem(id: 'si43', name: 'Infernal Torch',        category: 'Set Items', baseType: 'Grim Wand', isSet: true),
  GrailItem(id: 'si44', name: 'Infernal Sign',         category: 'Set Items', baseType: 'Heavy Belt', isSet: true),
  // Berserker's Arsenal
  GrailItem(id: 'si45', name: 'Berserker\'s Hatchet',  category: 'Set Items', baseType: 'Double Axe', isSet: true),
  GrailItem(id: 'si46', name: 'Berserker\'s Hauberk',  category: 'Set Items', baseType: 'Splint Mail', isSet: true),
  GrailItem(id: 'si47', name: 'Berserker\'s Headgear', category: 'Set Items', baseType: 'Helm', isSet: true),
  // Angelical Raiment
  GrailItem(id: 'si48', name: 'Angelic Sickle',        category: 'Set Items', baseType: 'Sabre', isSet: true),
  GrailItem(id: 'si49', name: 'Angelic Mantle',        category: 'Set Items', baseType: 'Ring Mail', isSet: true),
  GrailItem(id: 'si50', name: 'Angelic Halo',          category: 'Set Items', baseType: 'Ring', isSet: true),
  GrailItem(id: 'si51', name: 'Angelic Wings',         category: 'Set Items', baseType: 'Amulet', isSet: true),
  // Arctic Gear
  GrailItem(id: 'si52', name: 'Arctic Horn',           category: 'Set Items', baseType: 'Short War Bow', isSet: true),
  GrailItem(id: 'si53', name: 'Arctic Furs',           category: 'Set Items', baseType: 'Plate Mail', isSet: true),
  GrailItem(id: 'si54', name: 'Arctic Binding',        category: 'Set Items', baseType: 'Light Belt', isSet: true),
  GrailItem(id: 'si55', name: 'Arctic Mitts',         category: 'Set Items', baseType: 'Heavy Gloves', isSet: true),
  // Naj's Ancient Vestige
  GrailItem(id: 'si56', name: 'Naj\'s Puzzler',        category: 'Set Items', baseType: 'Elder Staff', isSet: true),
  GrailItem(id: 'si57', name: 'Naj\'s Light Plate',    category: 'Set Items', baseType: 'Templar Coat', isSet: true),
  GrailItem(id: 'si58', name: 'Naj\'s Circlet',        category: 'Set Items', baseType: 'Circlet', isSet: true),
  // Sander's Folly
  GrailItem(id: 'si59', name: 'Sander\'s Paragon',     category: 'Set Items', baseType: 'Skull Cap', isSet: true),
  GrailItem(id: 'si60', name: 'Sander\'s Riprap',      category: 'Set Items', baseType: 'Heavy Boots', isSet: true),
  GrailItem(id: 'si61', name: 'Sander\'s Taboo',       category: 'Set Items', baseType: 'Heavy Gloves', isSet: true),
  GrailItem(id: 'si62', name: 'Sander\'s Superstition', category: 'Set Items', baseType: 'Bone Wand', isSet: true),
  // Aldur's Watchtower
  GrailItem(id: 'si63', name: 'Aldur\'s Stony Gaze',   category: 'Set Items', baseType: 'Hunter\'s Guise', isSet: true),
  GrailItem(id: 'si64', name: 'Aldur\'s Deception',    category: 'Set Items', baseType: 'Shadow Plate', isSet: true),
  GrailItem(id: 'si65', name: 'Aldur\'s Advance',      category: 'Set Items', baseType: 'Battle Boots', isSet: true),
  GrailItem(id: 'si66', name: 'Aldur\'s Rhythm',       category: 'Set Items', baseType: 'Jagged Star', isSet: true),
  // Immortal King
  GrailItem(id: 'si67', name: 'Immortal King\'s Will',  category: 'Set Items', baseType: 'Avenger Guard', isSet: true),
  GrailItem(id: 'si68', name: 'Immortal King\'s Soul Cage', category: 'Set Items', baseType: 'Sacred Armor', isSet: true),
  GrailItem(id: 'si69', name: 'Immortal King\'s Forge', category: 'Set Items', baseType: 'War Gauntlets', isSet: true),
  GrailItem(id: 'si70', name: 'Immortal King\'s Pillar', category: 'Set Items', baseType: 'War Boots', isSet: true),
  GrailItem(id: 'si71', name: 'Immortal King\'s Detail', category: 'Set Items', baseType: 'War Belt', isSet: true),
  GrailItem(id: 'si72', name: 'Immortal King\'s Stone Crusher', category: 'Set Items', baseType: 'Ogre Maul', isSet: true),
  // Tal Rasha's Wrappings
  GrailItem(id: 'si73', name: 'Tal Rasha\'s Fine-Spun Cloth', category: 'Set Items', baseType: 'Mesh Belt', isSet: true),
  GrailItem(id: 'si74', name: 'Tal Rasha\'s Horadric Crest', category: 'Set Items', baseType: 'Death Mask', isSet: true),
  GrailItem(id: 'si75', name: 'Tal Rasha\'s Lidless Eye', category: 'Set Items', baseType: 'Swirling Crystal', isSet: true),
  GrailItem(id: 'si76', name: 'Tal Rasha\'s Guardianship', category: 'Set Items', baseType: 'Lacquered Plate', isSet: true),
  GrailItem(id: 'si77', name: 'Tal Rasha\'s Adjudication', category: 'Set Items', baseType: 'Amulet', isSet: true),
  // Griswold's Legacy
  GrailItem(id: 'si78', name: 'Griswold\'s Valor',      category: 'Set Items', baseType: 'Corona', isSet: true),
  GrailItem(id: 'si79', name: 'Griswold\'s Heart',      category: 'Set Items', baseType: 'Ornate Plate', isSet: true),
  GrailItem(id: 'si80', name: 'Griswold\'s Redemption', category: 'Set Items', baseType: 'Caduceus', isSet: true),
  GrailItem(id: 'si81', name: 'Griswold\'s Honor',      category: 'Set Items', baseType: 'Vortex Shield', isSet: true),
  // M'avina's Battle Hymn
  GrailItem(id: 'si82', name: 'M\'avina\'s True Sight',  category: 'Set Items', baseType: 'Diadem', isSet: true),
  GrailItem(id: 'si83', name: 'M\'avina\'s Embrace',    category: 'Set Items', baseType: 'Kraken Shell', isSet: true),
  GrailItem(id: 'si84', name: 'M\'avina\'s Tenet',      category: 'Set Items', baseType: 'Sharkskin Belt', isSet: true),
  GrailItem(id: 'si85', name: 'M\'avina\'s Caster',     category: 'Set Items', baseType: 'Grand Matron Bow', isSet: true),
  GrailItem(id: 'si86', name: 'M\'avina\'s Icy Clutch', category: 'Set Items', baseType: 'Battle Gauntlets', isSet: true),
  // Trang-Oul's Avatar
  GrailItem(id: 'si87', name: 'Trang-Oul\'s Guise',    category: 'Set Items', baseType: 'Bone Visage', isSet: true),
  GrailItem(id: 'si88', name: 'Trang-Oul\'s Scales',   category: 'Set Items', baseType: 'Chaos Armor', isSet: true),
  GrailItem(id: 'si89', name: 'Trang-Oul\'s Wing',     category: 'Set Items', baseType: 'Cantor Trophy', isSet: true),
  GrailItem(id: 'si90', name: 'Trang-Oul\'s Girth',    category: 'Set Items', baseType: 'Troll Belt', isSet: true),
  GrailItem(id: 'si91', name: 'Trang-Oul\'s Claws',    category: 'Set Items', baseType: 'Vampirebone Gloves', isSet: true),
  // The Disciple
  GrailItem(id: 'si92', name: 'Telling of Beads',      category: 'Set Items', baseType: 'Amulet', isSet: true),
  GrailItem(id: 'si93', name: 'Laying of Hands',       category: 'Set Items', baseType: 'Bramble Mitts', isSet: true),
  GrailItem(id: 'si94', name: 'Rite of Passage',       category: 'Set Items', baseType: 'Demonhide Boots', isSet: true),
  GrailItem(id: 'si95', name: 'Dark Adherent',         category: 'Set Items', baseType: 'Dusk Shroud', isSet: true),
  GrailItem(id: 'si96', name: 'Credendum',             category: 'Set Items', baseType: 'Mithril Coil', isSet: true),
  // Natalya's Odium
  GrailItem(id: 'si97', name: 'Natalya\'s Totem',      category: 'Set Items', baseType: 'Grim Helm', isSet: true),
  GrailItem(id: 'si98', name: 'Natalya\'s Shadow',     category: 'Set Items', baseType: 'Loricated Mail', isSet: true),
  GrailItem(id: 'si99', name: 'Natalya\'s Mark',       category: 'Set Items', baseType: 'Scissors Suwayyah', isSet: true),
  GrailItem(id: 'si100', name: 'Natalya\'s Soul',      category: 'Set Items', baseType: 'Mesh Boots', isSet: true),
  // Bul-Kathos' Children
  GrailItem(id: 'si101', name: 'Bul-Kathos\' Sacred Charge', category: 'Set Items', baseType: 'Colossus Blade', isSet: true),
  GrailItem(id: 'si102', name: 'Bul-Kathos\' Tribal Guardian', category: 'Set Items', baseType: 'Mythical Sword', isSet: true),
];

int get kTotalGrailItems =>
    kGrailCategories.fold(0, (sum, cat) => sum + cat.items.length);
