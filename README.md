# happy

> 日本語のREADMEはこちらです: [README.ja.md](README.ja.md)

The "Sabae SDGs App 'Happy'" is a Flutter application designed to promote the UN's Sustainable Development Goals (SDGs) within Sabae City, Japan. It allows users to earn points by participating in local events and supporting collaborating businesses.

## Demo

The main screen of the application displays the user's current point totals and provides access to the core features.


![The main screen of the Happy app, showing "SDGsポイント 0" and "ハッピー 0" at the top. A large button with a QR code icon is in the center for scanning. Below are tabs for Events, Shops, and Settings.](https://user-images.githubusercontent.com/1715217/160021012-40df6d54-3b0b-405f-bd47-abd1a4dde6d5.png)


More details are available in the [preliminary briefing session notes (in Japanese)](https://fukuno.jig.jp/3521).

## Features

-   **Point Tracking**: Keep track of your "Happy" points and SDGs points.
-   **QR Code Scanning**: Earn points by scanning QR codes at events and shops.
-   **Event Listings**: Browse a list of upcoming SDGs-related events.
-   **Shop Finder**: View a map of collaborating local shops.

## Getting Started

### Requirements

-   Flutter SDK: `_>=2.16.1 <3.0.0_`

### Installation & Usage

To run this project, follow these steps:

1.  Ensure you have the required Flutter SDK version installed.
2.  Clone the repository:
    ```sh
    git clone https://github.com/your-username/happy.git
    ```
3.  Navigate to the project directory:
    ```sh
    cd happy
    ```
4.  Install dependencies:
    ```sh
    flutter pub get
    ```
5.  Run the app:
    ```sh
    flutter run
    ```

## Key Dependencies

This project utilizes several key packages:

-   [flutter_barcode_scanner](https://pub.dev/packages/flutter_barcode_scanner) to scan QR codes.
-   [audioplayers](https://pub.dev/packages/audioplayers) for in-app sound effects.

## License

MIT License — see [LICENSE](LICENSE).