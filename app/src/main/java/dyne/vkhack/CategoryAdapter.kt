package dyne.vkhack

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.item_category.view.*

class CategoryAdapter (
    private val courseList: MutableList<Int> = MutableList(
        100,
        { index -> index}
    )
) :
    RecyclerView.Adapter<CategoryHolder>(){
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_category, parent, false)
        return CategoryHolder(view)
    }

    override fun getItemCount(): Int = courseList.size

    override fun onBindViewHolder(holder: CategoryHolder, position: Int) {}

}

class CategoryHolder(view: View) : RecyclerView.ViewHolder(view) {

    val categoryType = view.category_name_txt_view

}