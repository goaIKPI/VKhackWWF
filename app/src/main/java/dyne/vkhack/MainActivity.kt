package dyne.vkhack

import android.content.Intent
import android.graphics.drawable.Drawable
import android.media.Image
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import dyne.vkhack.model.Category
import kotlinx.android.synthetic.main.activity_choose_categories.*
import org.jetbrains.anko.toast

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_choose_categories)

        val categoryNames : MutableList<Category> = arrayListOf(
            Category("Культура",R.drawable.pic1),
            Category("Здравоохранение",R.drawable.pic1),
            Category("Образование",R.drawable.pic2),
            Category("Социальные программы",R.drawable.pic2),
            Category("Общественные организации",R.drawable.pic3),
            Category("Дикая природа",R.drawable.pic4))

        rvCategories.layoutManager = GridLayoutManager(this, 2) as RecyclerView.LayoutManager?
        rvCategories.adapter = CategoryAdapter(categoryNames)

        accept_categories_btn.setOnClickListener{

            val intent = Intent(this, MenuPageActivity::class.java)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
            startActivity(intent)
        }
//        setSupportActionBar(findViewById(R.id.toolbar))
//        setSupportActionBar(findViewById(R.id.toolbar2))

//        VK.initialize(this)
//
//        VK.login(this, arrayListOf(VKScope.WALL, VKScope.PHOTOS, VKScope.FRIENDS, VKScope.GROUPS))


    }

//    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
//        val callback = object: VKAuthCallback {
//            override fun onLogin(token: VKAccessToken) {
//                toast("")
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
