package dyne.vkhack.Fragments

import android.content.Context
import android.net.Uri
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import dyne.vkhack.NewsAdapter
import dyne.vkhack.R
import dyne.vkhack.model.News

class NewsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_news, container, false)

        val projectsMutable : MutableList<News> = arrayListOf()

        val rv = view.findViewById<RecyclerView>(R.id.rvProjects)
        rv.layoutManager = LinearLayoutManager(this.context)
        rv.adapter = NewsAdapter(projectsMutable)

        return view
    }

}
