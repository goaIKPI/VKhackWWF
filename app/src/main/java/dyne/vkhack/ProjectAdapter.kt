package dyne.vkhack

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import dyne.vkhack.model.Funds
import dyne.vkhack.model.News
import dyne.vkhack.model.Project

class ProjectsAdapter (
    val projList: MutableList<Project>
) :
        RecyclerView.Adapter<ProjectsHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProjectsHolder {
        return ProjectsHolder(LayoutInflater.from(parent.context).inflate(R.layout.item_projects, parent, false))
    }

    override fun getItemCount(): Int {
        return projList.size
    }

    override fun onBindViewHolder(holder: ProjectsHolder, position: Int) {
        holder.bind(projList[position])
    }
}

class ProjectsHolder(view: View): RecyclerView.ViewHolder(view){


    fun bind(project: Project){
        val image = itemView.findViewById<ImageView>(R.id.project_image_view)
        val title = itemView.findViewById<TextView>(R.id.project_name_text_view)
        val content = itemView.findViewById<TextView>(R.id.project_disciption_text_view)
        image.setBackgroundResource(project.photo)
        title.text = project.name
        content.text = project.desc
    }

}

class NewsAdapter (
    val newsList: MutableList<News>
) :
    RecyclerView.Adapter<NewsHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): NewsHolder {
        return NewsHolder(LayoutInflater.from(parent.context).inflate(R.layout.item_news, parent, false))
    }

    override fun getItemCount(): Int {
        return newsList.size
    }

    override fun onBindViewHolder(holder: NewsHolder, position: Int) {
        holder.bind(newsList.get(position))
    }
}

class NewsHolder(view: View): RecyclerView.ViewHolder(view){


    fun bind(news: News){

        val title = itemView.findViewById<TextView>(R.id.funds_name_text_view)
        val content = itemView.findViewById<TextView>(R.id.project_disciption_text_view)
        title.text = news.title
        content.text = news.content
    }

}

class FundsAdapter (
    val fundsList: MutableList<Funds>
) :
    RecyclerView.Adapter<FundsHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FundsHolder {
        return FundsHolder(LayoutInflater.from(parent.context).inflate(R.layout.item_funds, parent, false))
    }

    override fun getItemCount(): Int {
        return fundsList.size
    }

    override fun onBindViewHolder(holder: FundsHolder, position: Int) {
        holder.bind(fundsList.get(position))
    }
}

class FundsHolder(view: View): RecyclerView.ViewHolder(view){


    fun bind(funds: Funds){

        val title = itemView.findViewById<TextView>(R.id.funds_name_text_view)
        val content = itemView.findViewById<TextView>(R.id.project_disciption_text_view)
        title.text = funds.title
        content.text = funds.discr
    }

}