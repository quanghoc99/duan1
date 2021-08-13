<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Cart;
session_start();

class HomeController extends Controller
{
    public function index(){

    	$cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        $brand = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();

        // $all_product = DB::table('tbl_product')
        // ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        // ->join('tbl_brand','tbl_brand.brand_id','=','tbl_product.brand_id')
        // ->orderby('tbl_product.product_id','desc')->get();
        $all_product = DB::table('tbl_product')->where('product_status','0')->orderby('product_id','desc')->limit(9)->get();
        $all_slide = DB::table('tbl_slide')->where('slide_status','0')->orderby('slide_id','desc')->limit(4)->get();
        $diachi = DB::table('tbl_lienhe')->get();
    	return view('pages.home')->with('category',$cate_product)->with('brand',$brand)->with('all_product',$all_product)->with('all_slide',$all_slide)->with('diachi',$diachi);
    }
    public function search(Request $request){

        $keywords = $request->keywords_submit;

        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();

        $search_product = DB::table('tbl_product')->where('product_name','like','%'.$keywords.'%')->get();


        return view('pages.sanpham.search')->with('category',$cate_product)->with('brand',$brand_product)->with('search_product',$search_product);

    }
    public function muahang($product_id){
        $product_muahang = DB::table('tbl_product')->where('product_id',$product_id)->first();
        $all_product = DB::table('tbl_product')->where('product_status','0')->orderby('product_id','desc')->limit(9)->get();
        $brand = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();
        $diachi = DB::table('tbl_lienhe')->get();
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        Cart::add(array('id'=>$product_id, 'name'=>$product_muahang->product_name,'qty'=>1,'price'=>$product_muahang->product_price,'weight'=>$product_muahang->product_price,'options'=>array('image'=>$product_muahang->product_image)));
        $content = Cart::content();
        return view('pages.cart.show_cart')->with('all_product',$all_product)->with('category',$cate_product)->with('brand',$brand)->with('all_product',$all_product)->with('diachi',$diachi);
    }
}
