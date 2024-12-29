# Clear existing data
ItemModifierGroup.destroy_all
Modifier.destroy_all
ModifierGroup.destroy_all
SectionItem.destroy_all
Item.destroy_all
MenuSection.destroy_all
Section.destroy_all
Menu.destroy_all

# === BURGER MENU ===

burger_menu = Menu.create!(identifier: 'burger_menu', label: 'Burger Menu', state: 'active', start_date: Date.today)

# Sections for Burger Menu
burger_section1 = Section.create!(identifier: 'classic_burgers', label: 'Classic Burgers', description: 'Our signature burger recipes')
burger_section2 = Section.create!(identifier: 'custom_burgers', label: 'Custom Burgers', description: 'Build your own burger')
burger_section3 = Section.create!(identifier: 'sides_and_drinks', label: 'Sides & Drinks', description: 'Great additions to your meal')

MenuSection.create!(menu: burger_menu, section: burger_section1, display_order: 1)
MenuSection.create!(menu: burger_menu, section: burger_section2, display_order: 2)
MenuSection.create!(menu: burger_menu, section: burger_section3, display_order: 3)

# Burger Items
burger_item1 = Item.create!(type: 'Product', identifier: 'cheeseburger', label: 'Cheeseburger', description: 'A classic cheeseburger with lettuce, tomato, and our special sauce', price: 8.0)
burger_item2 = Item.create!(type: 'Product', identifier: 'bacon_burger', label: 'Bacon Burger', description: 'Juicy beef patty topped with crispy bacon and cheddar cheese', price: 10.0)
burger_item3 = Item.create!(type: 'Product', identifier: 'veggie_burger', label: 'Veggie Burger', description: 'A plant-based patty with fresh veggies and vegan mayo', price: 9.0)
burger_section1.items << [ burger_item1, burger_item2, burger_item3 ]

# Custom Burger Base
custom_burger_item = Item.create!(type: 'Component', identifier: 'plain_burger', label: 'Plain Burger Base', description: 'A fresh burger bun with lettuce and tomato', price: 6.0)
burger_section2.items << custom_burger_item

# Sides & Drinks
side_item1 = Item.create!(type: 'Product', identifier: 'fries', label: 'French Fries', description: 'Crispy golden fries', price: 3.0)
side_item2 = Item.create!(type: 'Product', identifier: 'onion_rings', label: 'Onion Rings', description: 'Crispy onion rings', price: 4.0)
drink_item1 = Item.create!(type: 'Product', identifier: 'soda', label: 'Soft Drink', description: 'Choice of Coca Cola, Sprite, or Fanta', price: 2.0)
drink_item2 = Item.create!(type: 'Product', identifier: 'milkshake', label: 'Milkshake', description: 'Vanilla, chocolate, or strawberry', price: 5.0)
burger_section3.items << [ side_item1, side_item2, drink_item1, drink_item2 ]

# Modifiers for Burger Menu
burger_size_group = ModifierGroup.create!(identifier: 'burger_size', label: 'Burger Size', selection_required_min: 1, selection_required_max: 1)
burger_extras_group = ModifierGroup.create!(identifier: 'burger_extras', label: 'Burger Extras', selection_required_min: 0, selection_required_max: 3)

extra_cheese = Item.create!(type: 'Component', identifier: 'extra_cheese', label: 'Extra Cheese', description: 'Add more cheese', price: 1.0)
extra_bacon = Item.create!(type: 'Component', identifier: 'extra_bacon', label: 'Extra Bacon', description: 'Add crispy bacon', price: 2.0)
extra_patty = Item.create!(type: 'Component', identifier: 'extra_patty', label: 'Extra Patty', description: 'Add an additional beef patty', price: 3.0)

[ burger_item1, burger_item2, burger_item3, custom_burger_item ].each do |burger|
  ItemModifierGroup.create!(item: burger, modifier_group: burger_size_group)
  ItemModifierGroup.create!(item: burger, modifier_group: burger_extras_group)
end

[ extra_cheese, extra_bacon, extra_patty ].each do |extra|
  Modifier.create!(item: extra, modifier_group: burger_extras_group)
end

# === PASTA MENU ===

pasta_menu = Menu.create!(identifier: 'pasta_menu', label: 'Pasta Menu', state: 'active', start_date: Date.today)

# Sections for Pasta Menu
pasta_section1 = Section.create!(identifier: 'classic_pastas', label: 'Classic Pastas', description: 'Authentic Italian pasta dishes')
pasta_section2 = Section.create!(identifier: 'custom_pastas', label: 'Custom Pastas', description: 'Make your own pasta')

MenuSection.create!(menu: pasta_menu, section: pasta_section1, display_order: 1)
MenuSection.create!(menu: pasta_menu, section: pasta_section2, display_order: 2)

# Pasta Items
pasta_item1 = Item.create!(type: 'Product', identifier: 'spaghetti_bolognese', label: 'Spaghetti Bolognese', description: 'Traditional spaghetti with rich meat sauce', price: 12.0)
pasta_item2 = Item.create!(type: 'Product', identifier: 'fettuccine_alfredo', label: 'Fettuccine Alfredo', description: 'Creamy Alfredo sauce with parmesan', price: 13.0)
pasta_item3 = Item.create!(type: 'Product', identifier: 'pesto_pasta', label: 'Pesto Pasta', description: 'Fresh basil pesto sauce over penne', price: 11.0)
pasta_section1.items << [ pasta_item1, pasta_item2, pasta_item3 ]

# Custom Pasta Base
custom_pasta_item = Item.create!(type: 'Component', identifier: 'plain_pasta', label: 'Plain Pasta Base', description: 'Choose your pasta and sauce', price: 8.0)
pasta_section2.items << custom_pasta_item

# Modifiers for Pasta Menu
pasta_type_group = ModifierGroup.create!(identifier: 'pasta_type', label: 'Pasta Type', selection_required_min: 1, selection_required_max: 1)
pasta_sauce_group = ModifierGroup.create!(identifier: 'pasta_sauce', label: 'Pasta Sauce', selection_required_min: 1, selection_required_max: 1)

spaghetti = Item.create!(type: 'Component', identifier: 'spaghetti', label: 'Spaghetti', description: 'Long thin pasta', price: 0.0)
penne = Item.create!(type: 'Component', identifier: 'penne', label: 'Penne', description: 'Short tube pasta', price: 0.0)
fettuccine = Item.create!(type: 'Component', identifier: 'fettuccine', label: 'Fettuccine', description: 'Flat wide pasta', price: 0.0)

tomato_sauce = Item.create!(type: 'Component', identifier: 'tomato_sauce', label: 'Tomato Sauce', description: 'Rich tomato-based sauce', price: 0.0)
cream_sauce = Item.create!(type: 'Component', identifier: 'cream_sauce', label: 'Cream Sauce', description: 'Creamy white sauce', price: 0.0)
pesto_sauce = Item.create!(type: 'Component', identifier: 'pesto_sauce', label: 'Pesto Sauce', description: 'Fresh basil pesto', price: 0.0)

[ spaghetti, penne, fettuccine ].each do |pasta|
  Modifier.create!(item: pasta, modifier_group: pasta_type_group)
end

[ tomato_sauce, cream_sauce, pesto_sauce ].each do |sauce|
  Modifier.create!(item: sauce, modifier_group: pasta_sauce_group)
end

ItemModifierGroup.create!(item: custom_pasta_item, modifier_group: pasta_type_group)
ItemModifierGroup.create!(item: custom_pasta_item, modifier_group: pasta_sauce_group)

puts "Burger and Pasta menu seed data created successfully!"
