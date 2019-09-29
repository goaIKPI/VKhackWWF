package dyne.vkhack

import android.os.Bundle
import android.os.PersistableBundle
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import com.google.android.material.bottomnavigation.BottomNavigationView

class MenuPageActivity: AppCompatActivity()  {

    val fm = supportFragmentManager

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        setContentView(R.layout.activity_maaain)



    }

//    private fun attachProjectsFragment() {
//        fm.beginTransaction().add(R.id.container_for_proj, ProjectsFragment()).commit()
//    }


}