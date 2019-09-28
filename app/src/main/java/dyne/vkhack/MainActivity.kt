package dyne.vkhack

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.vk.api.sdk.VK
import com.vk.api.sdk.VKApiManager
import com.vk.api.sdk.VKMethodCall
import com.vk.api.sdk.auth.VKAccessToken
import com.vk.api.sdk.auth.VKAuthCallback
import com.vk.api.sdk.auth.VKScope
import com.vk.api.sdk.requests.VKRequest
import kotlinx.android.synthetic.main.activity_choose_categories.*

import org.jetbrains.anko.find
import org.jetbrains.anko.toast

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.open_item_projects)


//        setSupportActionBar(findViewById(R.id.toolbar))
//        setSupportActionBar(findViewById(R.id.toolbar2))
//        rvCategories.layoutManager = GridLayoutManager(this, 2)
//        rvCategories.adapter = CategoryAdapter()
//        VK.initialize(this)
//
//        VK.login(this, arrayListOf(VKScope.WALL, VKScope.PHOTOS, VKScope.FRIENDS, VKScope.GROUPS))


    }

//    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
//        val callback = object: VKAuthCallback {
//            override fun onLogin(token: VKAccessToken) {
//                toast("Authorized")
//            }
//
//            override fun onLoginFailed(errorCode: Int) {
//                toast("Something")
//            }
//        }
//        if (data == null || !VK.onActivityResult(requestCode, resultCode, data, callback)) {
//            super.onActivityResult(requestCode, resultCode, data)
//        }
//    }
}
