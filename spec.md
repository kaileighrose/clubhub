# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
-- Team has_many Meetings, Meetings have_many Notes 
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
-- Meeting belongs_to Team, Note belongs to Meeting
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
-- User has_many meetings through Teams
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
-- Meeting time, Team, Location, and Note Content are selected by User
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
-- presence for most
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
-- Active teams (/teams and /users/1)
-- Meetings in the Future (/users/1)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
-- Note in /teams/:id/meetings/new
- [x] Include signup (how e.g. Devise)
--Devise
- [x] Include login (how e.g. Devise)
--Devise
- [x] Include logout (how e.g. Devise)
--Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
--Devise/OmniAuth (Facebook)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
-- teams/2/meetings/1
-- teams/2/meetings/1/notes
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
-- teams/2/meetings/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
-- _form.html.erb meetings, and teams. User has it through devise.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate