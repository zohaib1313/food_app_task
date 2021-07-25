import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/view_models/MyHomePageViewModel.dart';
import 'package:food_application/view_models/OnlineFoodServiceViewModel.dart';
import 'package:food_application/view_models/WallpaperScreenViewModel.dart';
import 'package:food_application/views/MyHomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ApiCalls.fetchAllImages(1);
  //print(result.toString());
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<MyHomePageViewModel>(
              create: (context) {
                return MyHomePageViewModel();
              },
            ),
            ChangeNotifierProvider<WallpaperScreenViewModel>(
              create: (context) {
                return WallpaperScreenViewModel();
              },
            ),
            ChangeNotifierProvider<OnlineFoodServiceViewModel>(
              create: (context) {
                return OnlineFoodServiceViewModel();
              },
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ),
                scaffoldBackgroundColor: Colors.white),
            home: MyHomePage(),
          ),
        ),
      ),
    );
  }
}
