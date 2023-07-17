import 'package:flutter/material.dart';
import 'package:verse/src/features/home/screens/home/components/MenuListWidget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../core/screens/widget/BarVerse.dart';
import '../../controllers/home_controller.dart';
import '../../models/Product.dart';
import '../deatils/details_screen.dart';
import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'components/header.dart';
import 'components/product_card.dart';

// Today i will show you how to implement the animation
// So starting project comes with the UI
// Run the app

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: BarVerse(context),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        // Header
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? 0
                              : -size.height * 0.13,
                          right: 0,
                          left: 0,
                          height: size.height * 0.165,
                          child: HomeHeader(),
                        ),

                        //Menu with bar
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? size.height * 0.14
                              : -(constraints.maxHeight -
                                  size.height * 0.1 * 2 -
                                  size.height * 0.13),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight -
                              size.height * 0.13 -
                              size.height * 0.1,
                          child: DefaultTabController(
                            length: tabs.length,
                            child: Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                                backgroundColor: isDarkMode
                                    ? backgroundColorBlack
                                    : backgroundColorWhihe,
                                bottom: PreferredSize(
                                  preferredSize: Size.fromHeight(0),
                                  child: TabBar(
                                    indicatorColor:
                                        isDarkMode ? Colors.white : Colors.red,
                                    labelColor: Colors.red,
                                    unselectedLabelColor: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    isScrollable: true,
                                    tabs: tabs,
                                  ),
                                ),
                              ),
                              body: TabBarView(
                                children: [
                                  MenuListWidget(
                                    controller: controller,
                                    constraints: constraints,
                                    product: demo_products,
                                  ),
                                  MenuListWidget(
                                    controller: controller,
                                    constraints: constraints,
                                    product: Product_Drink,
                                  ),
                                  MenuListWidget(
                                    controller: controller,
                                    constraints: constraints,
                                    product: demo_products,
                                  ),
                                  MenuListWidget(
                                    controller: controller,
                                    constraints: constraints,
                                    product: Product_Drink,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Card Panel
                        AnimatedPositioned(
                          duration: panelTransition,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal
                              ? size.height * 0.1
                              : (constraints.maxHeight - size.height * 0.1),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              color: isDarkMode
                                  ? Color(0xFF272727)
                                  : tCardBgColor, // Color(0xFFEAEAEA),
                              alignment: Alignment.topLeft,
                              child: AnimatedSwitcher(
                                duration: panelTransition,
                                child: controller.homeState == HomeState.normal
                                    ? CardShortView(controller: controller)
                                    : CartDetailsView(controller: controller),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
