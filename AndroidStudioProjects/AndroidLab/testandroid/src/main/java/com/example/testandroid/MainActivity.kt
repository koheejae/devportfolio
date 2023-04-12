package com.example.testandroid

import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.KeyEvent
import android.widget.Toast
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.R)
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if(keyCode ===KeyEvent.KEYCODE_BACK){
                Toast.makeText(this, "원하시는 위치를 눌러주세요", Toast.LENGTH_SHORT).show()
                return true
        }
        return super.onKeyDown(keyCode, event)
    }



}