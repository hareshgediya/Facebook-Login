# Facebook-Login
### 1. Install Facebook SDK for iOS

Make sure you are running the latest version of [CocoaPods](https://cocoapods.org) by running:

```bash
gem install cocoapods

# (or if the above fails)
sudo gem install cocoapods
```

Update your local specs repo by running:

```bash
pod repo update
```

**Note:** This step is optional, if you updated the specs repo recently.

Run `pod install` and you're all set!

### 2. Create a developer account for you and add an app. Get the App ID (ex: 164688418131135)

### 3. Save the app ID to your project's .plist.
   * FacebookAppID(String): `YOUR_FB_APP_ID`
   * FacebookDisplayName(String): Name of facebook dev app.
   * URL types(Array)
      1) Item 0(Dictionary)
      2) URLSchemes(Array)
         * Item 0(String): fb`YOUR_FB_APP_ID`
      3) Document Role(String)
