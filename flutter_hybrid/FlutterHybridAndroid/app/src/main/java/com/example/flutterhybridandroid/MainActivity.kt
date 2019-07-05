package com.example.flutterhybridandroid

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import io.flutter.facade.Flutter
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btn.setOnClickListener {
            supportFragmentManager.beginTransaction().replace(R.id.fl, Flutter.createFragment("{name: 'devio'}")).commit()
        }
    }
}
