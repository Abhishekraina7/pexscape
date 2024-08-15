**Pexscape**
===================================================================

 Pexscape is an mobile app that is **AI🤖** powered and  lets you browse and set curated real-time and AI generated Visuals and as your wallpaper in a snap ⚡.


Key Features:
---

*   **AI-Powered:** It uses Open-Source LAI-Imagenration-vSDXL-2 LLM to Produce stunning visuals.
*   **Extensive Wallpaper Collection:** Explore a wide range of real-time curated photos from Pexels, ensuring you find the perfect image for your style.
*   **Seamless Browsing Experience:** Navigate the app's grid view with ease, discovering wallpapers that match your preferences.
*   **Effortless Wallpaper Setting:** Set any image as your wallpaper with a single tap, directly from the full-screen image view.
  

## Sneak-Peak into the App

Coming soon.... project is under-construction.😁


Getting Started:
---

To run Pexscape on your device, you'll need the following:

*   **Flutter Development Environment:** Make sure you have Flutter installed and configured on your system. Refer to the official Flutter documentation for detailed setup instructions: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
*   **Pexels API Key:** To access the Pexels API and display images, you'll need a free API key. Sign up for a Pexels developer account to obtain your key: [https://www.pexels.com/api/](https://www.pexels.com/api/)

**Installation**

1.  Clone the Pexscape repository using Git:
   
```
Bash
git clone https://github.com/Abhishekraina7/Pexscape.git
```

2. Navigate to the project directory:

```
Bash
cd Pexscape
```

3. Install the dependencies:

```
Bash
flutter pub get
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
Bash
flutter run
```

**Technical Details**
---

Pexscape is built using the following technologies:

*   **Flutter:** A powerful framework for building beautiful and native-looking mobile apps.
*   **AI-Model:** Open-Source LAI-Imagenration-vSDXL-2 LLM to Produce stunning visuals.
*   **Pexels API:** Provides a vast collection of high-quality images under a permissive license.
*   **http:** Used for making HTTP requests to the Pexels API to fetch wallpaper data.
*   **jsonDecode:** Decodes JSON responses from the API to extract image information.
*   **GridView.builder:** Creates a scrollable and efficient grid layout for displaying wallpapers.
*   **Image.network:** Loads images from the Pexels API URLs and displays them within the app.
*   **InteractiveViewer (Optional):** Allows zooming and panning on full-screen images (requires the `interactive_viewer` package).
*   **flutter\_wallpaper\_manager (Optional):** Enables setting images as wallpaper directly from the app (requires the `flutter_wallpaper_manager` package and proper permission handling).\

  ## Contributions 🤝

  I would be happyif anyone interested in contributing to this project. 



