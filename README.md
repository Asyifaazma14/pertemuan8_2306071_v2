# pertemuan8_1

A Flutter app demonstrating API consumption using Provider state management.

## Features

- Fetches post data from JSONPlaceholder API
- Fetches photo data from Picsum.photos API
- Uses `provider` for state management of posts and photos
- Displays lists of posts and photos with navigation between pages
- Uses a pink/white theme for a clean UI

## Project Structure

- `lib/main.dart`: App entry point and `MultiProvider` setup
- `lib/post.dart`: Post listing screen using `PostProvider`
- `lib/photos.dart`: Photo listing screen using `PhotoProvider`
- `lib/provider/post_provider.dart`: Provider for post state and API loading
- `lib/provider/photo_provider.dart`: Provider for photo state and API loading
- `lib/models`: Data models for posts and photos
- `lib/services`: HTTP service classes for API calls

  ![Uploading Screenshot 2026-05-23 225049.png…]()
<img width="1297" height="988" alt="Screenshot 2026-05-23 225042" src="https://github.com/user-attachments/assets/43710f7e-655f-4f22-bccc-1ae03943cde0" />

## How to Run

1. Install Flutter and set up your environment.
2. Open the project folder in VS Code or Android Studio.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to launch the app.

## Notes

- The app currently displays up to 10 photos.
- The photo list uses a pink-accent theme with white backgrounds.
- The app is pushed to `https://github.com/Asyifaazma14/pertemuan8_2306071_v2`.
