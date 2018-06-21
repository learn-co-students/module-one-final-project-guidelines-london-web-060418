#TEMPLATE RECIPES
TemplateRecipe.create(
  meal: "Risotto",
  avg_cooking_time: 60,
  ingredient_requirement: "{
    \"grains\":0,
    \"proteins\":0,
    \"veg\":3,
    \"base_ingredients\":[
      \"Oil\",
      \"Stock\",
      \"Risotto Rice\"
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
quinoa = Ingredient.create(name: "Quinoa", category: "grain", protein: 10, carbs: 30, fat: 8)
brown_rice = Ingredient.create(name: "Brown Rice", category: "grain", protein: 8, carbs: 38, fat: 5)
barley = Ingredient.create(name: "Barley", category: "grain", protein: 14, carbs: 26, fat: 10)
buckwheat = Ingredient.create(name: "Buckwheat", category: "grain", protein: 11, carbs: 29, fat: 3)
pasta = Ingredient.create(name: "Pasta", category: "grain", protein: 6, carbs: 40, fat: 2)

carrot = Ingredient.create(name: "Carrot", category: "veg", protein: 1, carbs: 6, fat: 1)
tomato = Ingredient.create(name: "Tomato", category: "veg", protein: 0.5, carbs: 4, fat: 0)
onion = Ingredient.create(name: "Onion", category: "veg", protein: 1, carbs: 6, fat: 1)
courgette = Ingredient.create(name: "Courgette", category: "veg", protein: 1, carbs: 6, fat: 1)
aubergine = Ingredient.create(name: "Aubergine", category: "veg", protein: 1, carbs: 6, fat: 1)
mushroom = Ingredient.create(name: "Mushroom", category: "veg", protein: 1, carbs: 6, fat: 1)
broccoli = Ingredient.create(name: "Broccoli", category: "veg", protein: 1, carbs: 6, fat: 1)
beetroot = Ingredient.create(name: "Beetroot", category: "veg", protein: 1, carbs: 6, fat: 1)

black_beans = Ingredient.create(name: "Black_beans", category: "protein", protein: 10, carbs: 20, fat: 5)
tofu = Ingredient.create(name: "Tofu", category: "protein", protein: 15, carbs: 10, fat: 5)
quorn_pieces = Ingredient.create(name: "Quorn Pieces", category: "protein", protein: 20, carbs: 3, fat: 3)
lentils = Ingredient.create(name: "Lentils", category: "protein", protein: 10, carbs: 20, fat: 5)
portobello = Ingredient.create(name: "Portobello mushroom", category: "protein", protein: 11, carbs: 15, fat: 7)
soy_chunks = Ingredient.create(name: "Soy Chunks", category: "protein", protein: 18, carbs: 4, fat: 2)

Ingredient.create(name: "Oil", category: "extra", protein: 18, carbs: 4, fat: 2)
Ingredient.create(name: "Stock", category: "extra", protein: 18, carbs: 4, fat: 2)
Ingredient.create(name: "Risotto Rice", category: "grain", protein: 18, carbs: 4, fat: 2)

puts 'all done!'
