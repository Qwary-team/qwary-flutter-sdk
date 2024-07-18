
# Qwary Plugin

The `qwray_plugin` Flutter plugin integrates the official Android and iOS SDKs for the Qwary Survey Platform.

## Usage

1. Add `qwray_plugin` as a dependency in your `pubspec.yaml` file.
2. Import the package and use the methods provided by the `qwray_plugin` class.

## Example: Installation in Flutter

```dart
import 'package:qwray/qwray_plugin.dart';

void main() async {
  Qwary.configure('ENVIRONMENT_ID');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          Qwary.presentSurvey(true);
        },
        child: Text('Present Debug Survey'),
      ),
    );
  }
}
```

For more detailed information, refer to the https://www.qwary.com/. 

## Android Installation Steps

The `qwray_plugin` requires a `FragmentActivity` for the Android implementation. Update your `MainActivity.kt` as follows:

### Android Kotlin Example

```kotlin
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine)
  }
}
```

Additionally, ensure Java 8 support is enabled in your project by adding the following code to your `build.gradle` file (location: `your_project/app/build.gradle`):

```gradle
android {
  ...
  compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
  }
  // For Kotlin projects
  kotlinOptions {
    jvmTarget = "1.8"
  }
}
```
```setting.gradle
plugins {
    id "com.android.application" version "8.1.0" apply false
    id "org.jetbrains.kotlin.android" version "1.9.10" apply false
}
```

## Android and iOS

Replace `ENVIRONMENT_ID` with your actual environment ID.

**Note:**
The official libraries do not support any desktop platforms. The iOS library is also not supported on macOS.
