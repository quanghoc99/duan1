<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class UserController extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function index(){
        $all_user = DB::table('tbl_customers')->get();
        return view('admin.all_user')->with('all_user',$all_user);
    }
    public function delete_user($customer_id){
        $this->AuthLogin();
        DB::table('tbl_customers')->where('customer_id',$customer_id)->delete();
        Session::put('message','Xóa user thành công');
        return Redirect::to('all-user');
        }
    public function edit_user($customer_id){
            $this->AuthLogin();

           $edit_user = DB::table('tbl_customers')->where('customer_id',$customer_id)->get();

           $manager_user  = view('admin.edit_user')->with('edit_user',$edit_user);

           return view('admin_layout')->with('admin.edit_user', $manager_user);
       }
    public function update_user(Request $request,$customer_id){
        $this->AuthLogin();
       $data = array();
       $data['customer_name'] = $request->customer_name;
       $data['customer_phone'] = $request->customer_phone;
       $data['customer_email'] = $request->customer_email;


       DB::table('tbl_customers')->where('customer_id',$customer_id)->update($data);
       Session::put('message','Cập nhật user thành công');
       return Redirect::to('all-user');
   }
   public function add_user()
    {
        $add_user = DB::table('tbl_customers')->orderby('customer_id','desc')->get();
        return view('admin.add_user')->with('add_user',$add_user);
    }
    public function save_user(Request $request){
        $this->AuthLogin();
       $data = array();
       $data['customer_name'] = $request->customer_name;
       $data['customer_phone'] = $request->customer_phone;
       $data['customer_email'] = $request->customer_email;
       $data['customer_password'] = $request->customer_password;

       DB::table('tbl_customers')->insert($data);
       Session::put('message','Thêm user thành công');
       return Redirect::to('all-user');
   }
   public function save_user_tt(Request $request){


    $this->AuthLogin();
   $data = array();
   

    if ($request->customer_name == '') {

        Session::put('namedangly','Name không được để trống');
        return Redirect::to('login-checkout');

    } elseif (is_numeric($request->customer_name)) {

        Session::put('namedangly','Name không thể để là số');
        return Redirect::to('login-checkout');


    } elseif (strlen($request->customer_name) < 3) {

        Session::put('namedangly','Name không được nhỏ hơn 3 kí tự');
        return Redirect::to('login-checkout');


    } else {

        $data['customer_name'] = $request->customer_name;
    }
    // vali phone
    if ($request->customer_phone == '') {

        Session::put('namedangly','SĐT không được để trống');
        return Redirect::to('login-checkout');

    } elseif (!is_numeric($request->customer_phone)) {

        Session::put('namedangly','SĐT phải là số');
        return Redirect::to('login-checkout');


    } elseif ( strlen($request->customer_phone) !== 10) {

        Session::put('namedangly','SĐT phai la 10 so');
        return Redirect::to('login-checkout');


    } else {

       $data['customer_phone'] = $request->customer_phone;
    }
    // vali mail
    if ($request->customer_email == '') {

        Session::put('namedangly','email không được để trống');
        return Redirect::to('login-checkout');

    } else {

        $data['customer_email'] = $request->customer_email;
    }
    // vali pass
    if ($request->customer_password == '') {

        Session::put('namedangly','password không được để trống');
        return Redirect::to('login-checkout');

    } elseif ( strlen($request->customer_password) < 6) {

        Session::put('namedangly','password phai lơn hơn 6 kí tự');
        return Redirect::to('login-checkout');


    } else {

        $data['customer_password'] = md5($request->customer_password);
    }
   DB::table('tbl_customers')->insert($data);
   Session::put('message','Thêm user thành công');
   return Redirect::to('/trang-chu');
}
}
