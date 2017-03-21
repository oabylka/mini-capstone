Product.create!([
  {name: "Charmander", price: 9.99, description: "fire pokemon, red", stock_number: 1, supplier_id: 5},
  {name: "Napping Cat", price: 9.99, description: "cat napping on a keyboard", stock_number: 1, supplier_id: 5},
  {name: "pen", price: 1.99, description: "hdhjdjdj", stock_number: 1, supplier_id: 5},
  {name: "Jacket", price: 24.99, description: "Black leather jacket", stock_number: 1, supplier_id: 4},
  {name: "Eevie", price: 9.99, description: "small, doglike pokemon", stock_number: 1, supplier_id: 5},
  {name: "Mew", price: 100.0, description: "rarest Pokemon", stock_number: 1, supplier_id: 5},
  {name: "Backpacking tent", price: 135.99, description: "backpacking tent", stock_number: 1, supplier_id: 3},
  {name: "Stove - backpacking", price: 5.99, description: "backpacking stove", stock_number: 1, supplier_id: 2},
  {name: "Sleeping Bag", price: 60.0, description: "sleeping bag (negative temp)", stock_number: 1, supplier_id: 1},
  {name: "Pillow", price: 15.99, description: "Microfoam pillow", stock_number: 1, supplier_id: 5},
  {name: "PIKACHU", price: 9.99, description: "small, catlike pokemon", stock_number: 1, supplier_id: 4},
  {name: "mug", price: 9.99, description: "mug with heat sword", stock_number: 1, supplier_id: 5},
  {name: "Macbook Air", price: 599.99, description: "macbook laptop", stock_number: 1, supplier_id: 5},
  {name: "Hello", price: 7.99, description: "just testing stuffs", stock_number: 4, supplier_id: 5}
])

Supplier.create!([
  {name: "Pokemon center", phone: 63635, email: "poke@poke.com"},
  {name: "Cat factory", phone: 63635, email: "cats@cats.com"}, 
  {name: "Backpacking company", phone: 63635, email: "back@back.com"}, 
  {name: "Yandex", phone: 63635, email: "yandex@yandex.com"}
  ])

Image.create!([
  {name: "char.jpeg" , product_id: 1},
  {name: "char2.png" , product_id: 1},
  {name: "napcat.jpg" , product_id: 2},
  {name: "napcat2.jpg" , product_id: 2},
  {name: "pen.jpg" , product_id: 3},
  {name: "pen2.jpg" , product_id: 3},
  {name: "jacket.jpg" , product_id: 4},
  {name: "jacket2.jpg" , product_id: 4},
  {name: "eevie.jpeg" , product_id: 5},
  {name: "eevie2.jpg" , product_id: 5},
  {name: "mew.png" , product_id: 6},
  {name: "mew2.png" , product_id: 6},
  {name: "back.jpg" , product_id: 7},
  {name: "back2.jpg" , product_id: 7},
  {name: "stove.jpg" , product_id: 8},
  {name: "stove2.jpg" , product_id: 8},
  {name: "sleep.jpg" , product_id: 9},
  {name: "sleep2.jpg" , product_id: 9},
  {name: "pillow.jpeg" , product_id: 10},
  {name: "pillow2.jpeg" , product_id: 10},
  {name: "pikachu.png" , product_id: 11},
  {name: "pikachu2.png" , product_id: 11},
  {name: "mug.gif" , product_id: 12},
  {name: "mug2.jpg" , product_id: 12},
  {name: "macbook.jpg" , product_id: 13},
  {name: "macbook2.jpg" , product_id: 13},
  {name: "lol.png" , product_id: 14},
  {name: "lol2.jpeg" , product_id: 14}
  ])