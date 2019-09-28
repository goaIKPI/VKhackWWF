package dyne.vkhack

import android.os.Bundle
import com.vk.api.sdk.VK
import com.vk.api.sdk.auth.VKAccessToken

class Application : android.app.Activity() {

    override fun onCreate() {
        super.onCreate()
        VK.initialize(this)
    }

}