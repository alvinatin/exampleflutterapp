package com.alvinatin.exampleflutterapp

import android.os.Bundle
import android.widget.Button
import io.flutter.app.FlutterActivity
import com.alvinatin.exampleflutterapp.R
import io.flutter.plugin.common.MethodChannel

/**
 * @author by alvinatin on 21/12/18.
 */
class NativeViewActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val channel = MethodChannel(flutterView, MainActivity.CHANNEL)

        setContentView(R.layout.layout)
        findViewById<Button>(R.id.button).setOnClickListener {
            channel.invokeMethod("message", "Hello from Android native host")
        }
    }
}