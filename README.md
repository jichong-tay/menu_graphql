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

###
