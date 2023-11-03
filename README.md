# How to change the variation of the app

## App Properties

- Go to config.dart
- Look for setAppConfigurations()
- uncomment the method associated with desired variation (ensure others are commented out)

## App Package Name

- Open a terminal window in the app home directory
- Run the following command with the desired package name:

```
flutter pub get && dart run change_app_package_name:main new.package.name
```

## App Display Name

- Open a terminal window in the app home directory
- Run the following command with the desired app name:

```
flutter pub get && dart run rename_app:main all="New App Name"
```

## App Bundle Id

- Open a terminal window in the app home directory
- Run the following command with the desired bundle id:

```
flutter pub get
flutter pub global activate rename
dart run rename --bundleId new.bundle.id
```
