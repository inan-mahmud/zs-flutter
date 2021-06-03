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
