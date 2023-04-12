package com.example.proapplication02

import android.content.Context
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Rect
import android.graphics.drawable.Drawable
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.content.res.ResourcesCompat
import androidx.core.view.ViewCompat
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.proapplication02.databinding.FragmentOneBinding
import com.example.proapplication02.databinding.ItemRecyclerviewBinding

class MyViewHolder(val binding: ItemRecyclerviewBinding) : RecyclerView.ViewHolder(binding.root)
class MyAdapter(val datas: MutableList<String>) : RecyclerView.Adapter<RecyclerView.ViewHolder>(){
    override fun getItemCount(): Int {
        return datas.size
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder = MyViewHolder(ItemRecyclerviewBinding.inflate(
        LayoutInflater.from(parent.context), parent, false))

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        val binding=(holder as MyViewHolder).binding
        binding.itemData.text= datas[position]
    }
}

class Mydecoration(val context: Context): RecyclerView.ItemDecoration(){
    override fun onDrawOver(c: Canvas, parent: RecyclerView, state: RecyclerView.State) {
        super.onDrawOver(c, parent, state)
        val width = parent.width
        val height = parent.height
        val dr: Drawable? = ResourcesCompat.getDrawable(context.getResources(), R.drawable.kbo, null)
        val drWidth = dr?.intrinsicWidth
        val drHeight = dr?.intrinsicHeight
        val left = width / 2 - drWidth?.div(2) as Int
        val top = height / 2 - drHeight?.div(2) as Int
        c.drawBitmap(BitmapFactory.decodeResource(context.getResources(), R.drawable.kbo),
        left.toFloat(),
        top.toFloat(),
        null
        )
    }

    override fun getItemOffsets(
        outRect: Rect,
        view: View,
        parent: RecyclerView,
        state: RecyclerView.State
    ) {
        super.getItemOffsets(outRect, view, parent, state)
        val index = parent.getChildAdapterPosition(view) + 1
        if(index % 3 == 0)
            outRect.set(10,10,10,60)
        else
            outRect.set(10,10,10,0)
        view.setBackgroundColor(Color.parseColor("#28A0FF"))
        ViewCompat.setElevation(view,20.0f)
    }
}



/**
 * A simple [Fragment] subclass.
 * Use the [OneFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class OneFragment : Fragment() {
    // TODO: Rename and change types of parameters

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val binding = FragmentOneBinding.inflate(inflater, container,false)
        val datas = mutableListOf<String>()
        for(i in 1..9){
            datas.add("Item $i")
        }
        val layoutManager = LinearLayoutManager(activity)
        binding.recyclerView.layoutManager=layoutManager
        val adapter= MyAdapter(datas)
        binding.recyclerView.adapter=adapter
        binding.recyclerView.addItemDecoration(Mydecoration(activity as Context))
        return binding.root
    }
}