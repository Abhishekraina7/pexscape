**Pexscape**
===================================================================

 Pexscape is an app that lets you browse and set curated real-time photos as your wallpaper. It leverages the Pexels API to provide a vast collection of high-quality images, making it a perfect choice for anyone who wants to personalize their device with fresh, eye-catching wallpapers.

  

Key Features:
-------------

*   **Extensive Wallpaper Collection:** Explore a wide range of real-time curated photos from Pexels, ensuring you find the perfect image for your style.
*   **Seamless Browsing Experience:** Navigate the app's grid view with ease, discovering wallpapers that match your preferences.
*   **Effortless Wallpaper Setting:** Set any image as your wallpaper with a single tap, directly from the full-screen image view.
*   **Intuitive User Interface:** The app boasts a clean and user-friendly design, making it a joy to browse and personalize your device.

# PEXSCAPE

 Pexscape is an app that lets you browse and set curated real-time photos as your wallpaper. It leverages the Pexels API to provide a vast collection of high-quality images, making it a perfect choice for anyone who wants to personalize their device with fresh, eye-catching wallpapers.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

What things you need to install the software and how to install them

*   **Flutter Development Environment:** Make sure you have Flutter installed and configured on your system. Refer to the official Flutter documentation for detailed setup instructions: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
*   **Pexels API Key:** To access the Pexels API and display images, you'll need a free API key. Sign up for a Pexels developer account to obtain your key: [https://www.pexels.com/api/](https://www.pexels.com/api/)


### Installing

A step by step series of examples that tell you how to get a development env running

1.  Clone the Pexscape repository using Git:

```
Bash git clone https://github.com/Abhishekraina7/Pexscape.git
```

2. Navigate to the project directory:

```
Bash cd Pexscape
```

3. Install the dependencies:

```
Bash flutter pub get
```
4. Replace `YOUR_API_KEY` in the `lib/wallpapers.dart file` with your Pexels API key:
```
Dart
// ... existing code
final String apiKey = 'YOUR_API_KEY';
// ... rest of the code
```
5. Run the app on your device:

```
Bash flutter run
```

## Built With

* [Flutter](https://flutter.dev/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [PEXEL API](https://www.pexels.com/api/) - Used to generate RSS Feeds
* [DART](https://dart.dev/) - Core language for both Frontend and for RESTAPI's
* [Google Gemini](https://ai.google.dev/edge) - AI Image generation
* [Postman](https://www.postman.com/) - API testing and RestAPI development

## Contributing

I made this project compleletely solo and yeah It is a hobby project


## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to FLUTTER GEMS - best premade components and packages for Frontend.
* And Yeah Google's GEMINI API Docs were really awsome.



