# README

## Task 1

Step up a Ruby on Rails project

## Task 2

Create a GraphQL Menu endpoint

### Step 1: Setup models and associations

```ruby
rails generate model Menu identifier:string label:string state:string start_date:date end_date:date
rails generate model Section identifier:string label:string description:string
rails generate model MenuSection menu:references section:references display_order:integer
rails generate model Item type:string identifier:string label:string description:string price:float
rails generate model SectionItem section:references item:references display_order:integer
rails generate model ModifierGroup identifier:string label:string selection_required_min:integer selection_required_max:integer
rails generate model Modifier item:references modifier_group:references display_order:integer default_quantity:integer price_override:float
rails generate model ItemModifierGroup item:references modifier_group:references
```

### Step 2: Create GraphQL types and queries

```ruby
rails generate graphql:object Menu
rails generate graphql:object Section
rails generate graphql:object MenuSection
rails generate graphql:object Item
rails generate graphql:object ModifierGroup
rails generate graphql:object Modifier
```

```ruby
rails generate graphql:mutation_create ModifierGroup
rails generate graphql:mutation_update ModifierGroup
rails generate graphql:mutation_delete ModifierGroup
rails generate graphql:mutation_create Modifier
rails generate graphql:mutation_update Modifier
rails generate graphql:mutation_delete Modifier
```

Menu Query: Use the following query to query the menu.

```graphql
query {
  menus {
    identifier
    label
    state
    startDate
    endDate
    menuSections {
      displayOrder
      section {
        identifier
        label
        description
        items {
          id
          type
          identifier
          label
          description
          price
          modifierGroups {
            label
            selectionRequiredMin
            selectionRequiredMax
            modifiers {
              item {
                label
                description
              }
              displayOrder
              defaultQuantity
              priceOverride
            }
          }
        }
      }
    }
  }
}
```

1. To Create Modifier Group and Modifier

```graphql
mutation {
  modifierGroupCreate(
    input: {
      modifierGroupInput: {
        identifier: "example_identifier"
        label: "Example Label"
        selectionRequiredMin: 1
        selectionRequiredMax: 5
        modifiers: [
          {
            itemId: 1
            displayOrder: 1
            defaultQuantity: 1
            priceOverride: 9.99
          }
          {
            itemId: 2
            displayOrder: 2
            defaultQuantity: 2
            priceOverride: 19.99
          }
        ]
      }
    }
  ) {
    modifierGroup {
      id
      identifier
      label
      selectionRequiredMin
      selectionRequiredMax
      modifiers {
        id
        displayOrder
        defaultQuantity
        priceOverride
      }
    }
  }
}
```

2. To Create Modifier Only

```graphql
mutation {
  modifierCreate(
    input: {
      modifierInput: {
        itemId: 1
        modifierGroupId: 5
        displayOrder: 2
        defaultQuantity: 3
        priceOverride: 15.99
      }
    }
  ) {
    modifier {
      id
      displayOrder
      defaultQuantity
      priceOverride
    }
  }
}
```

3. To Update Modifier Group and Modifier

```graphQL
mutation {
  modifierGroupUpdate(
    input: {
      modifierGroupInput: {
        id: 5
        identifier: "example_identifier Update"
        label: "Example Label Update"
        selectionRequiredMin: 1
        selectionRequiredMax: 5
        modifiers: [
          {
            id: 14
            itemId: 2
            displayOrder: 1
            defaultQuantity: 2
            priceOverride: 10.00
          }
          {
            id: 15
            itemId: 1
            displayOrder: 2
            defaultQuantity: 2
            priceOverride: 20.00
          }
        ]
      }
    }
  ) {
    modifierGroup {
      id
      identifier
      label
      selectionRequiredMin
      selectionRequiredMax
      modifiers {
        id
        displayOrder
        defaultQuantity
        priceOverride
      }
    }
  }
}
```

4. To Update Modifier

```graphql
mutation {
  modifierUpdate(
    input: {
      modifierInput: {
        id: 13
        displayOrder: 3
        defaultQuantity: 3
        priceOverride: 0.99
      }
    }
  ) {
    modifier {
      id
      displayOrder
      defaultQuantity
      priceOverride
    }
  }
}
```

5. To Delete Modifier

```graphql
mutation {
  modifierDelete(input: { id: 5 }) {
    modifier {
      id
      displayOrder
      defaultQuantity
      priceOverride
    }
  }
}
```

6. To Delete Modifier Group and Modifier

```graphql
mutation {
  modifierGroupDelete(input: { id: 5 }) {
    modifierGroup {
      id
      identifier
      label
      selectionRequiredMin
      selectionRequiredMax
      modifiers {
        id
        displayOrder
        defaultQuantity
        priceOverride
      }
    }
  }
}
```

###
