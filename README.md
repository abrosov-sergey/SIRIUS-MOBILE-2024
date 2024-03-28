# Mobile SiriusMapIOS Source Code Compilation Guide

SiriusMapIOS - Application for building a route inside Sirius University. Inside the application, the functionality of scanning Qr codes is implemented, 
which allows you to determine the user’s position. There is also the ability to manually select start and end points.

![Launch Screen](https://i.ibb.co/PmKhq5F/Launch-Screen-Screenshot.png = 256*256) ![Map Screen](https://i.ibb.co/TWG5GFh/Map-Screen-Screenshot.png)
![](./Screenshots/LaunchScreenScreenshot.png =100x20)

## Get the Code

```
git clone https://github.com/abrosov-sergey/SIRIUS-MOBILE-2024.git
```

## Installing SwiftFormat

```
brew install swiftformat
```

## Installing XcodeGen

```
brew install xcodegen
```

## Usage

In the terminal, go to the project folder and call the following command:

```
xcodegen generate
```

# Mobile Flutter SiriusMap Source Code Compilation Guide

## Get the Code

```
git clone https://github.com/abrosov-sergey/SIRIUS-MOBILE-2024
```

## Usage

In the terminal, go to the project folder:

```
 cd SIRIUS-MOBILE-2024/flutter_sirius_map
```


Call the following command:

```
flutter run
```

## Installing dependencies

```
flutter pub get
```


## Build 

To build an application into an executable file (APK for Android or IPA for iOS), use the command:

```
flutter build apk
```

or

```
flutter build ios
```
