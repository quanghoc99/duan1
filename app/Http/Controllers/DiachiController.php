<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class DiachiController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function index()
    {
        $diachi = DB::table('tbl_lienhe')->get();
        return view('admin.all_lienhe')->with('diachi',$diachi);
    }

    public function edit_lienhe($lienhe_id){
        $this->AuthLogin();

       $edit_lienhe = DB::table('tbl_lienhe')->where('lienhe_id',$lienhe_id)->get();

       $manager_lienhe  = view('admin.edit_lienhe')->with('edit_lienhe',$edit_lienhe);

       return view('admin_layout')->with('admin.edit_lienhe', $manager_lienhe);
   }
   public function update_lienhe(Request $request,$lienhe_id){
        $this->AuthLogin();
       $data = array();
       $data['std'] = $request->lienhe_std;
       $data['diachi'] = $request->diachi;
       $data['email'] = $request->lienhe_email;
       $data['map'] = $request->lienhe_map;
       $get_image = $request->file('logo');

       if($get_image){
                   $get_name_image = $get_image->getClientOriginalName();
                   $name_image = current(explode('.',$get_name_image));
                   $new_image =  $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
                   $get_image->move('frontend/images',$new_image);
                   $data['logo'] = $new_image;
                   DB::table('tbl_lienhe')->where('lienhe_id',$lienhe_id)->update($data);
                   Session::put('message','Cập nhật  thành công');
                   return Redirect::to('all-lienhe');
       }

       DB::table('tbl_lienhe')->where('lienhe_id',$lienhe_id)->update($data);
       Session::put('message','Cập nhật  thành công');
       return Redirect::to('all-lienhe');
   }
}
