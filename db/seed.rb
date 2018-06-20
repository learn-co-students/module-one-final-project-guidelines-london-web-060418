#TEMPLATE RECIPES
TemplateRecipe.create(
  type: "Risotto",
  avg_cooking_time: 60,
  ingredient_requirement: "{
    \"grains\":1,
    \"proteins\":0,
    \"vegetables\":3,
    \"base_ingredients\":[
      \"oil\",
      \"stock\",
      \"risotto rice\"
    ]
  }",
  instructions: "{
    \"1\":\"Chop your vegetables. Prepare stock and keep it to the side.\",
    \"2\":\"In a big pan, cook all of your vegetables.\",
    \"3\":\"Add the risotto rice, and stir well over a medium heat.\",
    \"4\":\"When the rice starts to turn translucent, add a laddle of the stock and continue to stir.\",
    \"5\":\"When most of the liquid has been absorbed, add another laddle of stock. Repeat this step until the rice is well cooked (approx. 20 min).\",
    \"6\":\"Remove risotto from heat, and allow to cool.\",
    \"7\":\"Serve onto plate(s) and add any accompanying garnish.\",
    \"optional\":\"You can add some white wine to the pan with the risotto rice in step 3.\"
  }"
)

#INGREDIENTS
quinoa = Ingredient.create("Quinoa", "grain", 10, 30, 8)
brown_rice = Ingredient.create("Brown Rice", "grain", 8, 38, 5)
barley = Ingredient.create("Barley", "grain", 14, 26, 10)
buckwheat = Ingredient.create("Buckwheat", "grain", 11, 29, 3)
pasta = Ingredient.create("Pasta", "grain", 6, 40, 2)

carrot = Ingredient.create("Carrot", "veg", 1, 6, 1)
tomato = Ingredient.create("Tomato", "veg", 0.5, 4, 0)
onion = Ingredient.create("Onion", "veg", 1, 6, 1)
courgette = Ingredient.create("Courgette", "veg", 1, 6, 1)
aubergine = Ingredient.create("Aubergine", "veg", 1, 6, 1)
mushroom = Ingredient.create("Mushroom", "veg", 1, 6, 1)
broccoli = Ingredient.create("Broccoli", "veg", 1, 6, 1)
beetroot = Ingredient.create("Beetroot", "veg", 1, 6, 1)

black_beans = Ingredient.create("Black_beans", "protein", 10, 20, 5)
tofu = Ingredient.create("Tofu", "protein", 15, 10, 5)
quorn_pieces = Ingredient.create("Quorn Pieces", "protein", 20, 3, 3)
lentils = Ingredient.create("Lentils", "protein", 10, 20, 5)
portobello = Ingredient.create("Portobello mushroom", "protein",11, 15, 7)
soy_chunks = Ingredient.create("Soy Chunks", "protein", 18, 4, 2)
