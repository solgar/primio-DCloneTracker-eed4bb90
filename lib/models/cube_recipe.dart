class CubeRecipe {
  final String name;
  final List<String> inputs;
  final String output;
  final String category;
  final String? note;

  const CubeRecipe({
    required this.name,
    required this.inputs,
    required this.output,
    required this.category,
    this.note,
  });
}

class CubeRecipeCategory {
  final String name;
  final List<CubeRecipe> recipes;

  const CubeRecipeCategory({required this.name, required this.recipes});
}

const List<CubeRecipeCategory> kCubeCategories = [
  CubeRecipeCategory(name: 'Gems', recipes: kGemRecipes),
  CubeRecipeCategory(name: 'Runes', recipes: kRuneRecipes),
  CubeRecipeCategory(name: 'Scrolls & Tomes', recipes: kScrollRecipes),
  CubeRecipeCategory(name: 'Potions', recipes: kPotionRecipes),
  CubeRecipeCategory(name: 'Socketing', recipes: kSocketRecipes),
  CubeRecipeCategory(name: 'Rerolling', recipes: kRerollRecipes),
  CubeRecipeCategory(name: 'Upgrading', recipes: kUpgradeRecipes),
  CubeRecipeCategory(name: 'Rejuvenation', recipes: kRejuvRecipes),
];

const kGemRecipes = [
  CubeRecipe(
    name: 'Upgrade Gem',
    inputs: ['3 Gems of the same type and grade'],
    output: 'Same type gem, one grade higher',
    category: 'Gems',
    note: 'Works for all gem types up to Perfect',
  ),
  CubeRecipe(
    name: 'Perfect Skull Reward',
    inputs: ['1 Perfect Skull', '1 Rare Item'],
    output: 'Rerolled Rare Item (same type)',
    category: 'Gems',
    note: 'Re-randomizes all affixes on the Rare item',
  ),
];

const kRuneRecipes = [
  CubeRecipe(
    name: 'El → Eld',
    inputs: ['3 El Runes'],
    output: '1 Eld Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Eld → Tir',
    inputs: ['3 Eld Runes'],
    output: '1 Tir Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Tir → Nef',
    inputs: ['3 Tir Runes'],
    output: '1 Nef Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Nef → Eth',
    inputs: ['3 Nef Runes'],
    output: '1 Eth Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Eth → Ith',
    inputs: ['3 Eth Runes'],
    output: '1 Ith Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ith → Tal',
    inputs: ['3 Ith Runes'],
    output: '1 Tal Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Tal → Ral',
    inputs: ['3 Tal Runes'],
    output: '1 Ral Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ral → Ort',
    inputs: ['3 Ral Runes'],
    output: '1 Ort Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ort → Thul',
    inputs: ['3 Ort Runes'],
    output: '1 Thul Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Thul → Amn',
    inputs: ['3 Thul Runes', '1 Chipped Topaz'],
    output: '1 Amn Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Amn → Sol',
    inputs: ['3 Amn Runes', '1 Chipped Amethyst'],
    output: '1 Sol Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Sol → Shael',
    inputs: ['3 Sol Runes', '1 Chipped Sapphire'],
    output: '1 Shael Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Shael → Dol',
    inputs: ['3 Shael Runes', '1 Chipped Ruby'],
    output: '1 Dol Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Dol → Hel',
    inputs: ['3 Dol Runes', '1 Chipped Emerald'],
    output: '1 Hel Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Hel → Io',
    inputs: ['3 Hel Runes', '1 Chipped Diamond'],
    output: '1 Io Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Io → Lum',
    inputs: ['3 Io Runes', '1 Flawed Topaz'],
    output: '1 Lum Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Lum → Ko',
    inputs: ['3 Lum Runes', '1 Flawed Amethyst'],
    output: '1 Ko Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ko → Fal',
    inputs: ['3 Ko Runes', '1 Flawed Sapphire'],
    output: '1 Fal Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Fal → Lem',
    inputs: ['3 Fal Runes', '1 Flawed Ruby'],
    output: '1 Lem Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Lem → Pul',
    inputs: ['3 Lem Runes', '1 Flawed Emerald'],
    output: '1 Pul Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Pul → Um',
    inputs: ['2 Pul Runes', '1 Flawed Diamond'],
    output: '1 Um Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Um → Mal',
    inputs: ['2 Um Runes', '1 Topaz'],
    output: '1 Mal Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Mal → Ist',
    inputs: ['2 Mal Runes', '1 Amethyst'],
    output: '1 Ist Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ist → Gul',
    inputs: ['2 Ist Runes', '1 Sapphire'],
    output: '1 Gul Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Gul → Vex',
    inputs: ['2 Gul Runes', '1 Ruby'],
    output: '1 Vex Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Vex → Ohm',
    inputs: ['2 Vex Runes', '1 Emerald'],
    output: '1 Ohm Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ohm → Lo',
    inputs: ['2 Ohm Runes', '1 Diamond'],
    output: '1 Lo Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Lo → Sur',
    inputs: ['2 Lo Runes', '1 Flawless Topaz'],
    output: '1 Sur Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Sur → Ber',
    inputs: ['2 Sur Runes', '1 Flawless Amethyst'],
    output: '1 Ber Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Ber → Jah',
    inputs: ['2 Ber Runes', '1 Flawless Sapphire'],
    output: '1 Jah Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Jah → Cham',
    inputs: ['2 Jah Runes', '1 Flawless Ruby'],
    output: '1 Cham Rune',
    category: 'Runes',
  ),
  CubeRecipe(
    name: 'Cham → Zod',
    inputs: ['2 Cham Runes', '1 Flawless Emerald'],
    output: '1 Zod Rune',
    category: 'Runes',
  ),
];

const kScrollRecipes = [
  CubeRecipe(
    name: 'Tome of Town Portal',
    inputs: ['3 Scrolls of Town Portal'],
    output: '1 Scroll of Town Portal',
    category: 'Scrolls & Tomes',
    note: 'Not commonly needed but useful early game',
  ),
  CubeRecipe(
    name: 'Tome of Identify',
    inputs: ['3 Scrolls of Identify'],
    output: '1 Scroll of Identify',
    category: 'Scrolls & Tomes',
  ),
];

const kPotionRecipes = [
  CubeRecipe(
    name: 'Full Rejuvenation Potion',
    inputs: ['3 Rejuvenation Potions'],
    output: '1 Full Rejuvenation Potion',
    category: 'Potions',
  ),
  CubeRecipe(
    name: 'Antidote Potion',
    inputs: ['3 Chipped Gems (any)', '1 Strangling Gas Potion'],
    output: '1 Antidote Potion',
    category: 'Potions',
    note: 'Removes poison from the character',
  ),
  CubeRecipe(
    name: 'Thawing Potion',
    inputs: ['3 Chipped Gems (any)', '1 Exploding Potion'],
    output: '1 Thawing Potion',
    category: 'Potions',
    note: 'Removes frozen effect from the character',
  ),
];

const kSocketRecipes = [
  CubeRecipe(
    name: 'Socket Magic Weapon',
    inputs: ['1 Magic Weapon', '3 Ral Runes', '3 Amn Runes', '1 Perfect Amethyst'],
    output: 'Socketed Magic Weapon (1–2 sockets)',
    category: 'Socketing',
    note: 'Does not work on Unique, Set, or Rare items',
  ),
  CubeRecipe(
    name: 'Socket Magic Armor',
    inputs: ['1 Magic Armor', '3 Tal Runes', '3 Thul Runes', '1 Perfect Topaz'],
    output: 'Socketed Magic Armor (1–3 sockets)',
    category: 'Socketing',
  ),
  CubeRecipe(
    name: 'Socket Magic Shield',
    inputs: ['1 Magic Shield', '3 Ral Runes', '3 Thul Runes', '1 Perfect Sapphire'],
    output: 'Socketed Magic Shield (1–3 sockets)',
    category: 'Socketing',
  ),
  CubeRecipe(
    name: 'Socket Normal Weapon',
    inputs: ['1 Normal Weapon (white)', '1 Ral Rune', '1 Amn Rune', '1 Perfect Amethyst'],
    output: 'Socketed Normal Weapon (max sockets for ilvl)',
    category: 'Socketing',
    note: 'Item level determines number of sockets added',
  ),
  CubeRecipe(
    name: 'Socket Normal Armor',
    inputs: ['1 Normal Armor (white)', '1 Tal Rune', '1 Thul Rune', '1 Perfect Topaz'],
    output: 'Socketed Normal Armor (max sockets for ilvl)',
    category: 'Socketing',
  ),
  CubeRecipe(
    name: 'Socket Normal Shield',
    inputs: ['1 Normal Shield (white)', '1 Ral Rune', '1 Thul Rune', '1 Perfect Sapphire'],
    output: 'Socketed Normal Shield (max sockets for ilvl)',
    category: 'Socketing',
  ),
];

const kRerollRecipes = [
  CubeRecipe(
    name: 'Reroll Magic Item',
    inputs: ['6 Perfect Skulls', '1 Stone of Jordan', '1 Magic Item'],
    output: 'Rerolled Magic Item (same type)',
    category: 'Rerolling',
    note: 'Randomizes all affixes; item level becomes 99',
  ),
  CubeRecipe(
    name: 'Reroll Rare Item',
    inputs: ['1 Perfect Skull', '1 Rare Item'],
    output: 'Rerolled Rare Item (same type)',
    category: 'Rerolling',
    note: 'Re-randomizes all affixes on the Rare item',
  ),
  CubeRecipe(
    name: 'Reroll Rare Weapons (Low)',
    inputs: ['6 Ort Runes', '1 Amn Rune', '1 Rare Weapon'],
    output: 'Rerolled Rare Weapon (Normal)',
    category: 'Rerolling',
  ),
  CubeRecipe(
    name: 'Reroll Rare Weapons (High)',
    inputs: ['6 Fal Runes', '1 Um Rune', '1 Rare Weapon'],
    output: 'Rerolled Rare Weapon (Exceptional or Elite)',
    category: 'Rerolling',
  ),
  CubeRecipe(
    name: 'Remove Gem / Rune / Jewel',
    inputs: ['1 Hel Rune', '1 Scroll of Town Portal', '1 Socketed Item'],
    output: 'Unsocketed Item (sockets emptied)',
    category: 'Rerolling',
    note: 'Destroys all gems, runes, and jewels in the item',
  ),
];

const kUpgradeRecipes = [
  CubeRecipe(
    name: 'Upgrade Normal → Exceptional Weapon',
    inputs: ['1 Ort Rune', '1 Amn Rune', '1 Perfect Sapphire', '1 Normal Weapon (Unique)'],
    output: 'Exceptional version of the weapon',
    category: 'Upgrading',
    note: 'Works only on Unique quality items',
  ),
  CubeRecipe(
    name: 'Upgrade Exceptional → Elite Weapon',
    inputs: ['1 Fal Rune', '1 Um Rune', '1 Perfect Sapphire', '1 Exceptional Weapon (Unique)'],
    output: 'Elite version of the weapon',
    category: 'Upgrading',
  ),
  CubeRecipe(
    name: 'Upgrade Normal → Exceptional Armor',
    inputs: ['1 Tal Rune', '1 Shael Rune', '1 Perfect Diamond', '1 Normal Armor (Unique)'],
    output: 'Exceptional version of the armor',
    category: 'Upgrading',
  ),
  CubeRecipe(
    name: 'Upgrade Exceptional → Elite Armor',
    inputs: ['1 Ko Rune', '1 Lem Rune', '1 Perfect Diamond', '1 Exceptional Armor (Unique)'],
    output: 'Elite version of the armor',
    category: 'Upgrading',
  ),
  CubeRecipe(
    name: 'Upgrade Normal → Exceptional (Set Weapon)',
    inputs: ['1 Ort Rune', '1 Amn Rune', '1 Perfect Sapphire', '1 Normal Weapon (Set)'],
    output: 'Exceptional version of the Set weapon',
    category: 'Upgrading',
  ),
  CubeRecipe(
    name: 'Upgrade Normal → Exceptional (Set Armor)',
    inputs: ['1 Tal Rune', '1 Shael Rune', '1 Perfect Diamond', '1 Normal Armor (Set)'],
    output: 'Exceptional version of the Set armor',
    category: 'Upgrading',
  ),
];

const kRejuvRecipes = [
  CubeRecipe(
    name: 'Minor Healing → Rejuvenation',
    inputs: ['3 Minor Healing Potions', '3 Minor Mana Potions'],
    output: '1 Rejuvenation Potion',
    category: 'Rejuvenation',
  ),
  CubeRecipe(
    name: 'Light Healing → Rejuvenation',
    inputs: ['3 Light Healing Potions', '3 Light Mana Potions'],
    output: '1 Rejuvenation Potion',
    category: 'Rejuvenation',
  ),
  CubeRecipe(
    name: 'Healing → Rejuvenation',
    inputs: ['3 Healing Potions', '3 Mana Potions'],
    output: '1 Rejuvenation Potion',
    category: 'Rejuvenation',
  ),
  CubeRecipe(
    name: 'Greater Healing → Full Rejuvenation',
    inputs: ['3 Greater Healing Potions', '3 Greater Mana Potions'],
    output: '1 Full Rejuvenation Potion',
    category: 'Rejuvenation',
  ),
  CubeRecipe(
    name: 'Super Healing → Full Rejuvenation',
    inputs: ['3 Super Healing Potions', '3 Super Mana Potions'],
    output: '1 Full Rejuvenation Potion',
    category: 'Rejuvenation',
  ),
];
