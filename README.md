# zs-flutter

zs-flutter is a demo food app, made with [Getx](https://pub.dev/packages/get) and Flutter sdk. 

The main goal is to build a readable, maintainable, scalable and high-quality flutter app using a nice clean architecture.

### Step 1
Create a folder on your machine and clone the repo using the following command

```
git clone https://github.com/inanmahmud92/zs-flutter.git

```

### Step 2
Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 

```

### Step 3
Run the project using following command

```
flutter run

``` 

### Libraries & Tools Used

* [Dio](https://pub.dev/packages/dio)
* [GetX](https://pub.dev/packages/get)
* [Connectivity](https://pub.dev/packages/connectivity)
* [SharedPreference](https://pub.dev/packages/shared_preferences)
* [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
* [Shimmer](https://pub.dev/packages/shimmer)
* [Google Fonts](https://pub.dev/packages/google_fonts)

### With above tools and libraries the pubspec.yaml will look like below:

```
dependencies:
  flutter:
    sdk: flutter
    
  get: ^4.1.4
  dio: ^4.0.0
  connectivity: ^3.0.6
  google_fonts: ^2.1.0
  shared_preferences: ^2.0.6
  shimmer: ^2.0.0
  cached_network_image: ^3.0.0
  
```

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure I have been using in this project

```
lib/
|- bindings/
|- constants/
|- controllers/
|- data/
|- routes/
|- utils/
|- views/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.


```
1- bindings - All the dependencies injected in this project are defined in this directory with their respected files.
2- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `urls`,`strings`.
3- controllers - Contains all the controllers for this project which communicate with the ui and repositories.
4- data — Contains the data layer for this project, having 2 sub directories which contains the model classes and repositories.
5- routes — Contains the routes with route management of the app.
6- utils — Contains the utilities/common functions, having sub directories for enums, helper classes, base response and services.
7- views — Contains all the ui of this project, contains app pages and widgets.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title etc.
```
### Bindings

This directory contains all the classes for dependency injection. A separate file is created for each type as shown in example below:

```
bindings/
|- authentication_binding.dart
|- connection_binding.dart
|- menu_binding.dart
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_constants.dart
|- app_theme.dart
|- urls.dart
```

### Controllers

This directory contains all the controllers. The communication between UI and data layer is handled by using controllers. A separate file is created for each type as shown in example below:

```
controllers/
|- authentication_controller.dart
|- connection_controller.dart
|- menu_controller.dart
```

### Data

All the business logic of this application are into this directory, it represents the data layer of the project. It is sub-divided into two directories `models` and `repositories`. First one contains all the model classes where the other contains the domain specific logic.

```
data/
|- models/
    |- menus/
    |- login_model.dart
       
|- repositories
    |- login_repository.dart
    |- menu_repository.dart
    
```

### Routes

This file contains the route management for this application.

```
routes/
|- app_pages.dart
|- routes.dart

```

### Utils

Contains the common files and utilities used in a project. The folder structure is as follows: 

```
utils/
|- enums
   |- app_state.dart
|- helpers
  |- failure.dart
  |- snackbars.dart
  |- validators.dart
|- response
  |- api_response.dart
|- services
  |- local_storage.dart
```

### Views

This directory contains all the ui of the application. Screens are located into sub directory named `screens` and widgets are located into sub directory named `widgets`. The screen which has its specific widget are placed into another sub directory and the widget specific to that screen are placed into the `components` directory under that sub directory.
```
views/
|- screens
  |- details
    |- components
        |- item_image.dart
        |- item_info.dart
        |- price_clipper.dart
    |- details_screen.dart
  |- login_screen.dart
  |- menu_screen.dart
  |- splash_screen.dart
|- widgets
  |- bezier_curve
      |- bezier_container.dart
      |- customer_clipper.dart
  |- error_widet.dart
  |- modal_progress.dart
  |- shimmer_widget.dart

   
```
### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title etc.

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zstask/bindings/connection_binding.dart';
import 'package:zstask/constants/app_constants.dart';
import 'package:zstask/constants/app_theme.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/controllers/connection_controller.dart';
import 'package:zstask/routes/app_pages.dart';
import 'package:zstask/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectionController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.APPNAME,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      initialBinding: ConnectionBinding(),
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      theme: AppThemes.appTheme,
    );
  }
}

```
