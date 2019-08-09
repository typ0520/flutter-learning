package com.example.flutterhybridandroid

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btn.setOnClickListener {
            val intent = Intent(this, FlutterAppActivity::class.java)
            intent.putExtra(FlutterAppActivity.EXTRA_INIT_PARAMS, et.text.toString())
            startActivity(intent)
        }
    }
}
