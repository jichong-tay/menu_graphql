# Clear existing data
ItemModifierGroup.destroy_all
Modifier.destroy_all
ModifierGroup.destroy_all
SectionItem.destroy_all
Item.destroy_all
MenuSection.destroy_all
Section.destroy_all
Menu.destroy_all

# === SAMPLE MENU ===

sample_menu = Menu.create!(identifier: 'sample_menu', label: 'Sample Menu', state: 'active', start_date: Date.today)

# Sections for Sample Menu
non_configurable_section = Section.create!(identifier: 'non_configurable_items', label: 'Non-Configurable Items', description: 'Items that cannot be customized')
configurable_section = Section.create!(identifier: 'configurable_items', label: 'Configurable Items', description: 'Items that can be customized with various options')

MenuSection.create!(menu: sample_menu, section: non_configurable_section, display_order: 1)
MenuSection.create!(menu: sample_menu, section: configurable_section, display_order: 2)

# Non-Configurable Items
non_configurable_item1 = Item.create!(type: 'Product', identifier: 'simple_burger', label: 'Simple Burger', description: 'A classic burger with no customization', price: 5.0)
non_configurable_item2 = Item.create!(type: 'Product', identifier: 'simple_fries', label: 'Simple Fries', description: 'Crispy golden fries with no customization', price: 2.0)
non_configurable_section.items << [ non_configurable_item1, non_configurable_item2 ]

# Configurable Items
configurable_item1 = Item.create!(type: 'Product', identifier: 'custom_burger', label: 'Custom Burger', description: 'A burger you can customize with various options', price: 6.0)
configurable_item2 = Item.create!(type: 'Product', identifier: 'custom_pasta', label: 'Custom Pasta', description: 'A pasta dish you can customize with various options', price: 7.0)
configurable_section.items << [ configurable_item1, configurable_item2 ]

# Modifier Groups for Configurable Items
burger_size_group = ModifierGroup.create!(identifier: 'burger_size', label: 'Burger Size', selection_required_min: 1, selection_required_max: 1)
burger_extras_group = ModifierGroup.create!(identifier: 'burger_extras', label: 'Burger Extras', selection_required_min: 0, selection_required_max: 3)
pasta_type_group = ModifierGroup.create!(identifier: 'pasta_type', label: 'Pasta Type', selection_required_min: 1, selection_required_max: 1)
pasta_sauce_group = ModifierGroup.create!(identifier: 'pasta_sauce', label: 'Pasta Sauce', selection_required_min: 1, selection_required_max: 1)

# Modifiers for Burger
small_burger = Item.create!(type: 'Component', identifier: 'small_burger', label: 'Small Burger', description: 'Small size burger', price: 5.0)
medium_burger = Item.create!(type: 'Component', identifier: 'medium_burger', label: 'Medium Burger', description: 'Medium size burger', price: 6.0)
large_burger = Item.create!(type: 'Component', identifier: 'large_burger', label: 'Large Burger', description: 'Large size burger', price: 7.0)
extra_cheese = Item.create!(type: 'Component', identifier: 'extra_cheese', label: 'Extra Cheese', description: 'Add more cheese', price: 1.0)
extra_bacon = Item.create!(type: 'Component', identifier: 'extra_bacon', label: 'Extra Bacon', description: 'Add crispy bacon', price: 2.0)
extra_patty = Item.create!(type: 'Component', identifier: 'extra_patty', label: 'Extra Patty', description: 'Add an additional beef patty', price: 3.0)

# Modifiers for Pasta
spaghetti = Item.create!(type: 'Component', identifier: 'spaghetti', label: 'Spaghetti', description: 'Long thin pasta', price: 0.0)
penne = Item.create!(type: 'Component', identifier: 'penne', label: 'Penne', description: 'Short tube pasta', price: 0.0)
fettuccine = Item.create!(type: 'Component', identifier: 'fettuccine', label: 'Fettuccine', description: 'Flat wide pasta', price: 0.0)
tomato_sauce = Item.create!(type: 'Component', identifier: 'tomato_sauce', label: 'Tomato Sauce', description: 'Rich tomato-based sauce', price: 0.0)
cream_sauce = Item.create!(type: 'Component', identifier: 'cream_sauce', label: 'Cream Sauce', description: 'Creamy white sauce', price: 0.0)
pesto_sauce = Item.create!(type: 'Component', identifier: 'pesto_sauce', label: 'Pesto Sauce', description: 'Fresh basil pesto', price: 0.0)

# Associate Modifiers with Modifier Groups
[ small_burger, medium_burger, large_burger ].each_with_index do |size, index|
  Modifier.create!(item: size, modifier_group: burger_size_group, display_order: index + 1, default_quantity: 1, price_override: size.price)
end

[ extra_cheese, extra_bacon, extra_patty ].each_with_index do |extra, index|
  Modifier.create!(item: extra, modifier_group: burger_extras_group, display_order: index + 1, default_quantity: 1, price_override: extra.price)
end

[ spaghetti, penne, fettuccine ].each_with_index do |pasta, index|
  Modifier.create!(item: pasta, modifier_group: pasta_type_group, display_order: index + 1, default_quantity: 1, price_override: pasta.price)
end

[ tomato_sauce, cream_sauce, pesto_sauce ].each_with_index do |sauce, index|
  Modifier.create!(item: sauce, modifier_group: pasta_sauce_group, display_order: index + 1, default_quantity: 1, price_override: sauce.price)
end

# Associate Modifier Groups with Configurable Items
ItemModifierGroup.create!(item: configurable_item1, modifier_group: burger_size_group)
ItemModifierGroup.create!(item: configurable_item1, modifier_group: burger_extras_group)
ItemModifierGroup.create!(item: configurable_item2, modifier_group: pasta_type_group)
ItemModifierGroup.create!(item: configurable_item2, modifier_group: pasta_sauce_group)

puts "Sample menu seed data created successfully!"
