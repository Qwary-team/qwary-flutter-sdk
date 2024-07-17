# Qwary Plugin

The qwray_plugin Flutter plugin integrates the official Android and iOS SDKs for the Qwary Survey
Platform.

# Usage

Add qwray_plugin as a dependency in your pubspec.yaml file.

Import the package and use the methods provided by the qwray_plugin class.

# Example: Installation in flutter

Copy code - using dart

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
For more detailed information, refer to the Qwary Plugin Android documentation and Qwary Plugin iOS
documentation.(past web link for document)

# Android Installation Steps

The qwray_plugin requires a FragmentActivity for the Android implementation. Update your
MainActivity.kt as follows:

# Android kotlin Example

Copy code
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
Additionally, ensure Java 8 support is enabled in your project:

Add this code in gradle file (location:- your_project - app - build.gradle )
Copy code
android {
...
compileOptions {
sourceCompatibility JavaVersion.VERSION_1_8
targetCompatibility JavaVersion.VERSION_1_8
}
# // For Kotlin projects
kotlinOptions {
jvmTarget = "1.8"
}
}

# IOS Installation Steps

Add the render.html and qw.intercept.sdk.merged.js files to your project within the Assets folder.
first you need to create Assets folder on this location(ios - Assets)

# Android and Ios
Replace ENVIRONMENT_ID with your actual environment ID.

Note:
The official libraries do not support any desktop platforms. The iOS library is also not supported
on macOS.


