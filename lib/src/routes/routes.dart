import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/models/fruit_veg_model.dart';
import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/widgets/product_details_page.dart';
// import 'package:ui_challenges_app/src/apps/fruits_and_veg_ui/fruits_and_veg_ui.dart';
import '../apps/garden_planning/pages/login/leafy_login.dart';
import '../apps/garden_planning/pages/welcome/leafy_welcome.dart';
import '../src.dart';

/// # App Routes Provider
///
/// This provider defines the navigation routes for the application using the `go_router` package.
/// It utilizes Riverpod for state management, allowing the routes to be accessed and managed throughout the app.
///
/// ## Route Structure
///
/// The application's route structure is defined as follows:
///
/// - `/`: The root path, which displays the `WelcomePage`.
///   - `fruits_veg_ui`: A sub-route that leads to the `FruitsAndVegUIHome` page.
///     - `product_details`: A nested sub-route within `fruits_veg_ui` for displaying product details.
///       - This route expects a `FruitVegModel` object to be passed as `extra` in the navigation state.
///       - It uses the `ProductDetailsPage` widget to display the details of the selected fruit or vegetable.
///
/// ## Usage
///
/// This provider is consumed in the `MainApp` widget in `main.dart` to configure the `MaterialApp.router`.
///
/// ```dart
/// final appRouter = ref.watch(appRoutesProvider);
/// return MaterialApp.router(
///   debugShowCheckedModeBanner: false,
///   routerConfig: appRouter,
/// );
/// ```
///
/// ## Navigation
///
/// To navigate to a specific route, use the `context.go()` or `context.push()` methods provided by `go_router`.
///
/// ### Example: Navigating to Product Details
///
/// ```dart
/// context.goNamed(
///   'productDetails',
///   extra: myFruitVegModel, // Pass the FruitVegModel object
/// );
/// ```
///
/// ## Dependencies
///
/// - `go_router`: For declarative routing.
/// - `hooks_riverpod`: For state management.
/// - `ui_challenges_app/src/apps/fruits_and_veg_ui/models/fruit_veg_model.dart`: Defines the `FruitVegModel` data structure.
/// - `ui_challenges_app/src/apps/fruits_and_veg_ui/widgets/product_details_page.dart`: The widget for displaying product details.
/// - `../src.dart`: Imports other necessary components like `WelcomePage` and `FruitsAndVegUIHome`.
final appRoutesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const WelcomePage();
        },
        routes: [
          // fruits and veg route
          GoRoute(
            path: 'fruits_veg_ui',
            builder: (context, state) {
              return const FruitsAndVegUIHome();
            },
            routes: [
              GoRoute(
                path: 'product_details',
                name: 'productDetails',
                builder: (context, state) {
                  // get passed details
                  final fruitDetails = state.extra as FruitVegModel;
                  // pass on the details to product details page
                  return ProductDetailsPage(
                    fruitVegDetails: fruitDetails,
                  );
                },
              ),
            ],
          ),
          // garden planning route
          GoRoute(
            path: 'leafy',
            name: 'leafy',
            builder: (context, state) {
              return const LeafyWelcome();
            },
            routes: [
              GoRoute(
                path: 'login',
                name: 'leafyLogin',
                builder: (context, state) {
                  return const LeafyLogin();
                },
              ),
            ],
          )
        ],
      ),
    ],
  );
});
