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
import dyne.vkhack.FundsAdapter
import dyne.vkhack.R
import dyne.vkhack.model.Funds

class FundsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_funds, container, false)

        val fundsMutable: MutableList<Funds> = arrayListOf()

        val rv = view.findViewById<RecyclerView>(R.id.rvFunds)
        rv.layoutManager = LinearLayoutManager(this.context)
        rv.adapter = FundsAdapter(fundsMutable)

        return view
    }

}
