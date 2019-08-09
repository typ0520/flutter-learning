package com.example.flutterhybridandroid

import android.content.Context
import android.widget.Toast
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.view.FlutterView

class BasicMessageChannelPlugin(flutterView: FlutterView) : BasicMessageChannel.MessageHandler<String> {

    private var context: Context?
    private var messageChannel: BasicMessageChannel<String> =
        BasicMessageChannel(flutterView, "BasicMessageChannelPlugin", StringCodec.INSTANCE)

    companion object {
        fun registerWith(flutterView: FlutterView): BasicMessageChannelPlugin {
            val plugin = BasicMessageChannelPlugin(flutterView)
            return plugin
        }
    }

    init {
        messageChannel.setMessageHandler(this)
        this.context = flutterView.context
    }

    override fun onMessage(args: String?, p1: BasicMessageChannel.Reply<String>) {
        p1.reply("BasicMessageChannelPlugin: " + args)

        (context as? FlutterAppActivity)?.run {
            onShowMessage(args)
        }

        Toast.makeText(context, args, Toast.LENGTH_LONG).show()
    }

    fun send(message: String?) {
        messageChannel.send(message)
    }
}