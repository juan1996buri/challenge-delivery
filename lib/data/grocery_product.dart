class GroceryProduct {
  const GroceryProduct(
      {required this.price,
      required this.name,
      required this.description,
      required this.image,
      required this.weight});
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
    price: 2.20,
    name: 'fresa',
    description:
        'Las fresas son frutas deliciosas y jugosas que se caracterizan por su sabor dulce y su textura suave. Son ampliamente utilizadas en postres, ensaladas y batidos debido a su versatilidad culinaria. Además de su agradable sabor, las fresas son ricas en vitamina C y antioxidantes que promueven la salud y el bienestar.',
    image: 'assets/images/fresa.jpeg',
    weight: '120g',
  ),
  GroceryProduct(
    price: 3.23,
    name: 'banana',
    description:
        'Las bananas, también conocidas como plátanos, son frutas tropicales que se caracterizan por su forma alargada y su pulpa suave. Son una excelente fuente de potasio y fibra dietética, lo que las convierte en un snack saludable y energético. Las bananas son perfectas para añadir a los cereales, batidos o simplemente disfrutarlas solas.',
    image: 'assets/images/banana.jpeg',
    weight: '160g',
  ),
  GroceryProduct(
    price: 5.22,
    name: 'carambola',
    description:
        'La carambola, también conocida como fruta estrella, es una fruta exótica con forma de estrella de cinco puntas. Su sabor es suavemente dulce y refrescante, con una textura crujiente. La carambola es rica en vitamina C y antioxidantes, y se puede disfrutar fresca, en ensaladas de frutas o como adorno para platos exquisitos.',
    image: 'assets/images/carambola.jpg',
    weight: '90g',
  ),
  GroceryProduct(
    price: 9.20,
    name: 'kiwi',
    description:
        'El kiwi es una fruta pequeña pero poderosa que está repleta de nutrientes esenciales. Tiene un sabor dulce y ligeramente ácido, y su interior verde brillante está lleno de pequeñas semillas comestibles. Los kiwis son una excelente fuente de vitamina C, vitamina K, fibra y antioxidantes. Pueden ser disfrutados solos o agregados a ensaladas y batidos.',
    image: 'assets/images/kiwi.jpg',
    weight: '79g',
  ),
  GroceryProduct(
    price: 2.20,
    name: 'limon',
    description:
        'El limón es una fruta cítrica extremadamente versátil que se utiliza en numerosas preparaciones culinarias en todo el mundo. Su sabor ácido y refrescante puede realzar el sabor de muchos platos y bebidas. Además, los limones son ricos en vitamina C y antioxidantes que apoyan la salud inmunológica y digestiva. Son indispensables en la cocina y también pueden utilizarse para hacer limonada casera.',
    image: 'assets/images/limon.jpg',
    weight: '67g',
  ),
  GroceryProduct(
    price: 5.20,
    name: 'mango',
    description:
        'El mango es una fruta tropical deliciosa y jugosa que se destaca por su sabor dulce y exótico. Su pulpa suave y fibrosa tiene un color vibrante que va desde el amarillo al naranja. Los mangos son una excelente fuente de vitamina C, vitamina A y fibra dietética. Pueden ser disfrutados frescos, utilizados en ensaladas tropicales o como ingrediente en salsas y postres.',
    image: 'assets/images/mango.jpg',
    weight: '150g',
  ),
  GroceryProduct(
    price: 5.27,
    name: 'manzana',
    description:
        'La manzana es una fruta clásica y popular que se encuentra en una amplia variedad de variedades y sabores. Es conocida por su sabor dulce y refrescante, así como por su crujiente textura. Las manzanas son una excelente fuente de fibra y antioxidantes, y son ideales tanto para comer solas como para usar en preparaciones culinarias como pasteles, compotas y ensaladas.',
    image: 'assets/images/manzana.jpeg',
    weight: '100g',
  ),
  GroceryProduct(
    price: 4.20,
    name: 'papaya',
    description:
        'La papaya es una fruta tropical exquisita y jugosa que se destaca por su sabor dulce y su textura suave. Su carne anaranjada está llena de vitaminas, minerales y enzimas digestivas. La papaya es conocida por sus propiedades digestivas y su capacidad para promover la salud del sistema inmunológico. Puede ser disfrutada fresca, en batidos o agregada a ensaladas de frutas.',
    image: 'assets/images/papaya.jpg',
    weight: '190g',
  ),
  GroceryProduct(
    price: 2.27,
    name: 'pera',
    description:
        'La pera es una fruta jugosa y dulce que viene en una variedad de variedades. Su pulpa suave y aromática tiene un sabor delicado y refrescante. Las peras son una excelente fuente de fibra dietética y vitamina C. Se pueden disfrutar solas, en ensaladas o como ingrediente en postres como tartas y compotas.',
    image: 'assets/images/pera.jpg',
    weight: '170g',
  ),
  GroceryProduct(
    price: 8.40,
    name: 'sandia',
    description:
        'La sandía es una fruta refrescante y jugosa que es perfecta para disfrutar en los días calurosos de verano. Su pulpa roja y jugosa tiene un sabor dulce y refrescante, y está compuesta principalmente de agua. La sandía es baja en calorías y una excelente fuente de hidratación. Se puede comer fresca, en rodajas o utilizarla como base para hacer batidos y jugos.',
    image: 'assets/images/sandia.jpeg',
    weight: '200g',
  ),
];
