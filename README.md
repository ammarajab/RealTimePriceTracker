# RealTimePriceTracker

A SwiftUI-based iOS application that streams simulated stock prices over a WebSocket echo service and presents them in a live-updating feed with symbol details. The project demonstrates an MVVM architecture, shared streaming service, and deep link navigation using `NavigationStack`.

## Features
- 25-symbol feed sorted by latest price with color-coded movement indicators.
- Start/Stop controls with connection status shown in the top bar.
- Symbol detail screen with live price updates and descriptive copy.
- WebSocket integration using `wss://ws.postman-echo.com/raw` with randomized price generation every 2 seconds.
- Deep link support for `stocks://symbol/{symbol}`.
- Basic unit and UI tests (placeholders for local Xcode execution).

## Running the App
1. Open `RealTimePriceTracker.xcodeproj` in Xcode 15 or later.
2. Build and run the `RealTimePriceTracker` scheme on iOS 17+ simulator or device.
3. Use the Start/Stop button to control the feed and tap symbols for details. To test deep linking, run:
   ```
   xcrun simctl openurl booted "stocks://symbol/AAPL"
   ```

## Testing
Execute tests from Xcode's Product > Test menu or via command line:
```
xcodebuild test -scheme RealTimePriceTracker -destination 'platform=iOS Simulator,name=iPhone 15'
```
