package dyne.vkhack

import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MenuItem
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.google.android.material.bottomnavigation.BottomNavigationView
import dyne.vkhack.Fragments.FundsFragment
import dyne.vkhack.Fragments.NewsFragment
import dyne.vkhack.Fragments.ProjectsFragment
import org.jetbrains.anko.textColor

class MainManuActivity : AppCompatActivity(), BottomNavigationView.OnNavigationItemSelectedListener{


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_maaain )


        val proj = findViewById<TextView>(R.id.projects_toolbar)
        val funds = findViewById<TextView>(R.id.fonds_toolbar)
        val news = findViewById<TextView>(R.id.news_toolbar)

        proj.textColor = Color.parseColor("#FFFFFF")
        funds.textColor = Color.parseColor("#009656")
        news.textColor = Color.parseColor("#009656")

        loadFragment(ProjectsFragment())

        proj.setOnClickListener {
            loadFragment(ProjectsFragment())
            proj.isClickable = false
            funds.isClickable = true
            news.isClickable = true
            proj.setBackgroundResource(R.drawable.shape_choose_btn_elem)
            funds.setBackgroundResource(R.drawable.shape_choose_btn)
            news.setBackgroundResource(R.drawable.shape_choose_btn)
            proj.textColor = Color.parseColor("#FFFFFF")
            funds.textColor = Color.parseColor("#009656")
            news.textColor = Color.parseColor("#009656")
        }

        funds.setOnClickListener {
            loadFragment(FundsFragment())
            it.isClickable = false
            proj.isClickable = true
            news.isClickable = true
            funds.setBackgroundResource(R.drawable.shape_choose_btn_elem)
            proj.setBackgroundResource(R.drawable.shape_choose_btn)
            news.setBackgroundResource(R.drawable.shape_choose_btn)
            funds.textColor = Color.parseColor("#FFFFFF")
            proj.textColor = Color.parseColor("#009656")
            news.textColor = Color.parseColor("#009656")
        }

        news.setOnClickListener {
            loadFragment(NewsFragment())
            it.isClickable = false
            funds.isClickable = true
            proj.isClickable = true
            news.setBackgroundResource(R.drawable.shape_choose_btn_elem)
            funds.setBackgroundResource(R.drawable.shape_choose_btn)
            proj.setBackgroundResource(R.drawable.shape_choose_btn)
            news.textColor = Color.parseColor("#FFFFFF")
            funds.textColor = Color.parseColor("#009656")
            proj.textColor = Color.parseColor("#009656")
        }

        //attachProjectsFragment()
        setOnClickItem()
    }

    private fun setOnClickItem() {
        val toolbar = findViewById<BottomNavigationView>(R.id.bottom_navigation)
        toolbar.setOnNavigationItemSelectedListener(this)
    }

    override fun onNavigationItemSelected(p0: MenuItem): Boolean {

        var fragment = Fragment()

//        when(p0.itemId){
//            R.id.second -> fragment = ProjectsFragment()
//
//            R.id.third -> fragment = NewsFragment()
//
//            R.id.fourth -> fragment = FundsFragment()
//        }

        return loadFragment(fragment)
    }

    fun loadFragment(fragment: Fragment): Boolean {

        if (fragment != null)
        {
            supportFragmentManager.beginTransaction().replace(R.id.container_for_proj, fragment).commit()
            return true
        }

        return false
    }

}
