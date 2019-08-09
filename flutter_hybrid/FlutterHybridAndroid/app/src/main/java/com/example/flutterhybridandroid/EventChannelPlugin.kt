package com.example.flutterhybridandroid

import io.flutter.plugin.common.EventChannel
import io.flutter.view.FlutterView

class EventChannelPlugin : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    companion object {
        fun registerWith(flutterView: FlutterView): EventChannelPlugin {
            val plugin = EventChannelPlugin()
            EventChannel(flutterView, "EventChannelPlugin").setStreamHandler(plugin)
            return plugin
        }
    }

    override fun onListen(arguments: Any, p1: EventChannel.EventSink?) {
        this.eventSink = p1
    }

    override fun onCancel(arguments: Any?) {
        this.eventSink = null
    }

    fun send(params: Any) {
        eventSink?.success(params)
    }
}