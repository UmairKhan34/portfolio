import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myportfolio/src/home/home_view.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: HomeView.route, page: () => HomeView()),
  ];
}
