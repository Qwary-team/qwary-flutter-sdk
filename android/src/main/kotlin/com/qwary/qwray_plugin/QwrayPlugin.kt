package com.qwary.qwray_plugin

import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import androidx.fragment.app.FragmentActivity
import com.qwary.internal.QwaryWebController
import com.qwary.Qwary

class QwrayPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var applicationContext: Context
    private var activityContext: FragmentActivity? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "qwray_plugin")
        channel.setMethodCallHandler(this)
        applicationContext = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {

        when (call.method) {
            "getPlatformVersion" -> {

                activityContext?.let {
                    Qwary.configure(it, "c5e3e8c3-5b12-481d-a4c9-1570bd532860")
                    result.success(null)
                    // result.success("Android ${android.os.Build.VERSION.RELEASE}")
                } ?: run {
                    Log.e("QwrayPlugin", "Activity context is null")
                    result.error("NO_ACTIVITY", "Activity context is not available", null)
                }
            }
            "configure" -> {
                val enironment_id = call.argument<String>("enironment_id")
                if (enironment_id != null) {
                    activityContext?.let {
                        Qwary.configure(it, enironment_id)
                        result.success(null)
                        // result.success("Android ${android.os.Build.VERSION.RELEASE}")
                    } ?: run {
                        Log.e("QwrayPlugin", "Activity context is null")
                        result.error("NO_ACTIVITY", "Activity context is not available", null)
                    }
                } else {
                    result.error("INVALID_ARGUMENT", "Event name is null", null)
                }


            }
            "presentSurvey" -> {
                val isBanner = call.argument<Boolean>("isBanner") ?: false

                activityContext?.let {
                    Qwary.presentSurvey(it, isBanner)
                    result.success(null)
                    // result.success("Android ${android.os.Build.VERSION.RELEASE}")
                }

            }
            "addEvent" -> {
                Log.e("addEvent", "addEvent")
                val eventName = call.argument<String>("eventName")
                if (eventName != null) {
                    Log.e("addEvent", "addEvent call $eventName")

                    Qwary.addEvent(eventName)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "Event name is null", null)
                }
            }
            "logout" -> {
                Qwary.logout()
                result.success(null)
            }
            "dismissActiveSurvey" -> {
                Qwary.dismissActiveSurvey()
                result.success(null)
            }
            else -> result.notImplemented()
        }

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityContext = binding.activity as? FragmentActivity
    }

    override fun onDetachedFromActivity() {
        activityContext = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityContext = binding.activity as? FragmentActivity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityContext = null
    }
}