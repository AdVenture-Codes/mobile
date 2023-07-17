import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:verse/src/constants/images_string.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../components/fav_btn.dart';
import '../../components/price.dart';
import '../../models/Product.dart';
import 'components/Ingredient_widget.dart';
import 'components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key, required this.product, required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //late final List<String> items;
  late final ProductD _productD;
  late List<String> _selectedItems = [];
  final List<String> items = [
    'Extra eggs',
    'Extra spinach',
    'Extra bread',
    'Extra tomato',
    'Extra cucumber',
    'Extra olives'
  ];

// this function is called when the Submit button is tapped

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
      print(_selectedItems);
    });
  }

  String _cartTag = "";
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Text("Add to Cart"),
            ),
          ),
        ),
      ),
      appBar: AppBarDetails("Gram Bistro"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                    child: Expanded(
                      child: Hero(
                        tag: widget.product.title! + _cartTag,
                        child: Image.asset(
                          widget.product.image!,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    child: CartCounter(),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Price(amount: "${widget.product.price}"),
                ],
              ),
            ),
            Container(
              height: size.height * 0.47,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: ReadMoreText(
                        "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' ',
                        trimExpandedText: 'Hide',
                        textAlign: TextAlign.justify,
                        moreStyle: Theme.of(context).textTheme.bodyText1!,
                        lessStyle: TextStyle(
                          color: Color(0xFFBDBDBD),
                          height: 1.6,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Ingredients",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.11,
                      child: ListView.builder(
                        itemCount: ingredients.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SizedBox(
                          height: size.height * 0.18,
                          width: size.width * 0.18,
                          child: IngredientWidget(
                              title: ingredients[index].titleIng,
                              image: ingredients[index].imageIng),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Add toppings",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListBody(
                      children: items
                          .map(
                            (item) => Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isDarkMode
                                    ? Color(0xFF272727)
                                    : tCardBgColor,
                              ),
                              child: CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text(item),
                                  activeColor: titleOrangeColorL,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  value: _selectedItems.contains(item),
                                  secondary: Text(
                                    '4.20',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: titleOrangeColorL),
                                  ),
                                  onChanged: (isChecked) =>
                                      _itemChange(item, isChecked!)),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Add a request  ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: TextField(
                        //controller: controller,

                        cursorColor:
                            isDarkMode ? tCardBgColor : Color(0xFF272727),
                        decoration: InputDecoration(
                          hintText: "Ex: Don’t add onion",
                          hintStyle: TextStyle(
                              color: isDarkMode
                                  ? tCardBgColor
                                  : Color(0xFF272727)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar AppBarDetails(String title) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return AppBar(
      leading: BackButton(
        color: isDarkMode ? twhiteColor : tDarkColor,
      ),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      elevation: 0,
      centerTitle: true,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontSize: 20, fontWeight: FontWeight.w300)),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
