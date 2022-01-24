import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app_ui_lesson_5/madels/product_model.dart';
import 'package:market_app_ui_lesson_5/pages/details_page.dart';

List<Product> details = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["All", "Red", "Blue", "Green", "Black"];
  int _selectedIndex = 0;
  int counter = 0;

  List<Product> products = [
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 100,
        image: "assets/images/img.png",
        category: "Red"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 200,
        image: "assets/images/img_1.png",
        category: "Blue"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 200,
        image: "assets/images/img_14.png",
        category: "Blue"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 100,
        image: "assets/images/img_12.png",
        category: "Red"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 300,
        image: "assets/images/img_4.png",
        category: "Green"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 400,
        image: "assets/images/img_3.png",
        category: "Black"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 100,
        image: "assets/images/img_5.png",
        category: "Red"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 200,
        image: "assets/images/img_6.png",
        category: "Blue"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 400,
        image: "assets/images/img_9.png",
        category: "Black"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 300,
        image: "assets/images/img_8.png",
        category: "Green"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 400,
        image: "assets/images/img_10.png",
        category: "Black"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 100,
        image: "assets/images/img_11.png",
        category: "Red"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 200,
        image: "assets/images/img_13.png",
        category: "Blue"),
    Product(
        name: "PDP Car",
        type: "Electric",
        cost: 300,
        image: "assets/images/img_7.png",
        category: "Green"),
  ];

  List<Product> _selectedProducts = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedProduct();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _selectedProduct();
  }

  void _selectedProduct() {
    if (_selectedIndex == 0) {
      _selectedProducts.clear();
      _selectedProducts.addAll(products);
    } else {
      _selectedProducts.clear();
      _selectedProducts.addAll(products
          .where((element) => element.category == categories[_selectedIndex]));
    }
    print(_selectedProducts.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Cars",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
          MaterialButton(
            minWidth: 25,
            onPressed: () {
              Navigator.pushNamed(context, DetailsPage.id);
            },
            shape: const CircleBorder(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  counter.toString(),
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //#categories
            _itemOfCategories(),

            //#products
            ListView.builder(
              itemCount: _selectedProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _itemOfProducts(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOfProducts(int index) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _selectedProducts[index].isLike = !_selectedProducts[index].isLike;
          if (_selectedProducts[index].isLike) {
            details.add(_selectedProducts[index]);
            counter++;
          } else {
            details.remove(_selectedProducts[index]);
            counter--;
          }
        });
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(_selectedProducts[index].image),
                fit: BoxFit.cover,
              )),
          height: 240,
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, bottom: 20, right: 10, top: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.1),
                  ],
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          _selectedProducts[index].name,
                          style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _selectedProducts[index].type,
                          style: const TextStyle(
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    MaterialButton(
                      minWidth: 35,
                      height: 35,
                      onPressed: () {
                        setState(() {
                          _selectedProducts[index].isLike = !_selectedProducts[index].isLike;
                          if (_selectedProducts[index].isLike) {
                            details.add(_selectedProducts[index]);
                            counter++;
                          } else {
                            details.remove(_selectedProducts[index]);
                            counter--;
                          }
                        });
                      },
                      child: Icon(_selectedProducts[index].isLike
                          ? Icons.favorite_outlined
                          : Icons.favorite_outline),
                      shape: const CircleBorder(),
                      color: CupertinoColors.white,
                    ),
                  ],
                ),
                Text(
                  "${_selectedProducts[index].cost.toString()}\$",
                  style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _itemOfCategories() {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: (index == categories.length - 1)
                ? const EdgeInsets.only(bottom: 8, top: 8, right: 20)
                : const EdgeInsets.only(bottom: 8, top: 8),
            width: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: MaterialButton(
              elevation: 0,
              color:
                  _selectedIndex == index ? Colors.grey.shade300 : Colors.white,
              shape: const StadiumBorder(),
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Text(
                categories[index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
