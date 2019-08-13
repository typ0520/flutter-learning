package com.example.flutterhybridandroid

import android.os.Bundle
import android.support.v4.app.FragmentActivity
import android.view.ViewGroup.LayoutParams
import android.widget.FrameLayout
import io.flutter.facade.Flutter
import kotlinx.android.synthetic.main.activity_flutter_app.*

class FlutterAppActivity : FragmentActivity() {
    companion object {
        const val EXTRA_INIT_PARAMS = "init_params"
    }

    lateinit var eventChannelPlugin: EventChannelPlugin

    lateinit var basicMessageChannelPlugin: BasicMessageChannelPlugin

    lateinit var methodChannelPlugin: MethodChannelPlugin

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_flutter_app)

        val initParams = intent.getStringExtra(EXTRA_INIT_PARAMS)

        val flutterView = Flutter.createView(this, lifecycle, initParams)
        fl.addView(flutterView, FrameLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT))

        eventChannelPlugin = EventChannelPlugin.registerWith(flutterView)
        basicMessageChannelPlugin = BasicMessageChannelPlugin.registerWith(flutterView)
        methodChannelPlugin = MethodChannelPlugin.registerWith(flutterView)

        btn_send.setOnClickListener {
            if (rg.checkedRadioButtonId == R.id.rb_event_channel) {
                eventChannelPlugin.send(et.text.toString())
            } else {
                basicMessageChannelPlugin.send(et.text.toString())
            }
        }
    }

    fun onShowMessage(message: String?) {
        runOnUiThread {
            tv_message.text = message
        }
    }
}