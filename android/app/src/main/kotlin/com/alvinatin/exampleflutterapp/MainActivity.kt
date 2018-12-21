package com.alvinatin.exampleflutterapp

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  companion object {
      const val CHANNEL = "com.alvinatin.exampleflutterapp"
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "showNativeView") {
        val intent = Intent(this, NativeViewActivity::class.java)
        startActivity(intent)
        result.success(true)
      } else {
        result.notImplemented()
      }
    }
  }
}
