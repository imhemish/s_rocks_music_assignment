# S.Rocks.Music assignment

Here is the project for submission of assignment for Flutter Dev Intern role at S.Rocks.Music

## Folder Structure

I used MVVM structure as asked in assignment and here is the description what I did in each file:

```
lib/
├── firebase_options.dart
│    # This will have firebase options configured by flutterfire
├── firebase_options.dart.example
│    # I put example file because firebase_options.dart is ignored as I put it into .gitignore
│
├── main.dart
│
├── models/
│   └── service_model.dart
│    # model class for service
│
├── repository/
│   └── service_repository.dart
│      # I made function inside it for fetching services
│      # This also ensures user is signed in anonymously first
│
├── viewmodels/
│   └── service_viewmodel.dart
│        # In this I made a provider for home screen which handles state
│
├── views/
│   ├── home/
│   │   ├── home_bottom_navigation.dart
│   │   │    # in this I made the UI for navigation bar
│   │   │    # including highlighting the curretly selected
│   │   │
│   │   ├── home_hero_section.dart
│   │   │    # hero section with the top search bar and profile icon
│   │   │
│   │   ├── home_services_section.dart
│   │   │    # uses services which are fetched by provider
│   │   │    # and displays the cards for services
│   │   │
│   │   └── home_view.dart
│   │       # Combines all of these in one widget
│   │
│   └── service_detail_view.dart
│       # Screen which shows 'You tapped on'
│
└── widgets/
    ├── half_circle_indicator.dart
    │   # used for selected indicator inside bottom navigation
    │
    └── service_card.dart
         # reusable servie card widget
         # which shows service according
         # to title, description, image, etc.

assets/
├── fonts
│   │ # These Syne and Lobster font were used in Figma design
│   ├── Lobster-Regular.ttf
│   ├── Syne-Bold.ttf
│   ├── Syne-ExtraBold.ttf
│   ├── Syne-Medium.ttf
│   ├── Syne-Regular.ttf
│   └── Syne-SemiBold.ttf
│
├── graphics
│   │ # Two graphics exported for hero section
│   ├── piano.png
│   └── vinyl.png
│
├── icons
│   │ # Contains avatar, bottom navigation, right arrow icons
│   │ # It lso contains icons whose asset path would be fetched from firebase
│   ├── avatar.png
│   ├── home.png
│   ├── icon_1.png
│   ├── icon_2.png
│   ├── icon_3.png
│   ├── icon_4.png
│   ├── logo.png
│   ├── news.png
│   ├── projects.png
│   ├── right_arrow_filled.png
│   └── trackbox.png
│  
└── images
    │ # These images' asset path would be fetched from firebase
    │ # They are used in background of services card
    ├── image_1.png
    ├── image_2.png
    ├── image_3.png
    └── image_4.png
```

## Dependencies

I used these packages

- `firebase_core`: for firebase initialisation
- `cloud_firestore`: for accessing firestore
- `firebase_auth`: to ensure anonoymous authentication to use firestore
- `provider`: State management
- `flutter_launcher_icons`: to add launcher icon as visible in video

## Firebase Setup

- Create a new firebase project
- Add firebase_options.dart using ```flutterfire configure```
- Enable Anonymous Authentication in Firebase Console (Authentication > Sign-in method > Anonymous > Enable)

#### Ignored files

- `firebase_options.dart` - Contains Firebase configuration (I added to .gitignore so that credentials are not pushed to GitHub)
- `android/app/google-services.json` - Android Firebase configuration (added to .gitignore as well)

### Data in firebase

I created a Firestore collection named 'services' and added these documents into it:

**Document 1:**
```
bg_image: "assets/images/image_1.png" (string)
description: "Custom instrumentals & film scoring" (string)
icon: "assets/icons/icon_1.png" (string)
title: "Music Production" (string)
```

**Document 2:**
```
bg_image: "assets/images/image_2.png" (string)
description: "Make your tracks Radio-Ready" (string)
icon: "assets/icons/icon_2.png" (string)
title: "Mixing & Mastering" (string)
```

**Document 3:**
```
bg_image: "assets/images/image_3.png" (string)
description: "Turn feelings into lyrics" (string)
icon: "assets/icons/icon_3.png" (string)
title: "Lyrics Writing" (string)
```

**Document 4:**
```
bg_image: "assets/images/image_4.png" (string)
description: "Vocal that bring your lyrics to life" (string)
icon: "assets/icons/icon_4.png" (string)
title: "Vocals" (string)
```

## Launcher icon

- I added the icon of S.Rocks.Music as a launcher icon which is visible in video
- I used the `flutter_launcher_icons` package to generate custom app launcher icons.
- The launcher icon configuration is set in `flutter_launcher_icons.yaml`
- The command ```dart run flutter_launcher_icons``` adds the icon to android folder

## Authentication Note

Anonymous authentication must be enabled in Firebase Console because Firebase requires authentication by default to access Firestore. The app automatically signs in users anonymously when they open the application.