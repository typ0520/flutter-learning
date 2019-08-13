package com.example.flutterhybridandroid

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

class MethodChannelPlugin(flutterView: FlutterView): MethodChannel.MethodCallHandler {
    companion object {
        fun registerWith(flutterView: FlutterView): MethodChannelPlugin {
            return MethodChannelPlugin(flutterView)
        }
    }

    private var context: Context?

    init {
        MethodChannel(flutterView, "MethodChannelPlugin").setMethodCallHandler(this)
        this.context = flutterView.context
    }
    override fun onMethodCall(call: MethodCall, p1: MethodChannel.Result) {
        (context as? FlutterAppActivity)?.run {
            onShowMessage("call：${call.method}, args: ${call.arguments}")
        }
        p1.success("dart调用了：${call.method}, args: ${call.arguments}")
    }
}