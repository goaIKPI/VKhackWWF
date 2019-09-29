package dyne.vkhack.Fragments

import android.content.Context
import android.net.Uri
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Adapter
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import dyne.vkhack.ProjectsAdapter
import dyne.vkhack.R
import dyne.vkhack.model.Project


class ProjectsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        val view = inflater.inflate(R.layout.fragment_projects, container, false)

        val projectsMutable : MutableList<Project> = arrayListOf()

        val rv = view.findViewById<RecyclerView>(R.id.rvProjects)
        rv.layoutManager = LinearLayoutManager(this.context)
        rv.adapter = ProjectsAdapter(projectsMutable)

        return view
    }

}
