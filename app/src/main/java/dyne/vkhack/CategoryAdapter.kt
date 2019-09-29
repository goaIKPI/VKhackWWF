package dyne.vkhack

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.recyclerview.widget.RecyclerView
import dyne.vkhack.model.Category
import kotlinx.android.synthetic.main.item_category.view.*

class CategoryAdapter (
    val courseList:MutableList<Category>
) :
    RecyclerView.Adapter<CategoryHolder>(){
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_category, parent, false)
        return CategoryHolder(view)
    }

    override fun getItemCount(): Int = courseList.size

    override fun onBindViewHolder(holder: CategoryHolder, position: Int) {
        holder.bind(courseList.get(position))
    }

}

class CategoryHolder(view: View) : RecyclerView.ViewHolder(view) {

    private lateinit var category: Category
    val categoryType = view.category_name_txt_view

    fun bind(category: Category) {
        val title = itemView.findViewById<TextView>(R.id.category_name_txt_view)
        title.text = category.title
        val image = itemView.findViewById<ConstraintLayout>(R.id.viewholder_inner)
        image.setBackgroundResource(category.image)

    }

}