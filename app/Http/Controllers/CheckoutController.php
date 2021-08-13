<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use Cart;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class CheckoutController extends Controller
{
     public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function view_order($orderId){
        $this->AuthLogin();
        $customer =  DB::table('tbl_order_details')->where('order_id',$orderId)->get();
        $order_by_id = DB::table('tbl_order')
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
        ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
        ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
        ->select('tbl_order.*','tbl_customers.*','tbl_shipping.*','tbl_order_details.*')
        ->where('tbl_order_details.order_id',$orderId)->first();
        $manager_order_by_id  = view('admin.view_order')->with('order_by_id',$order_by_id)->with('customer',$customer);
        return view('admin_layout')->with('admin.view_order', $manager_order_by_id);

    }
    public function login_checkout(){

    	$cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();
        $diachi = DB::table('tbl_lienhe')->get();
    	return view('pages.checkout.login_checkout')->with('category',$cate_product)->with('brand',$brand_product)->with('diachi',$diachi);
    }
    public function add_customer(Request $request){

    	$data = array();
    	$data['customer_name'] = $request->customer_name;
    	$data['customer_phone'] = $request->customer_phone;
    	$data['customer_email'] = $request->customer_email;
    	$data['customer_password'] = md5($request->customer_password);

    	$customer_id = DB::table('tbl_customers')->insertGetId($data);

    	Session::put('customer_id',$customer_id);
    	Session::put('customer_name',$request->customer_name);
    	return Redirect::to('/checkout');


    }
    public function checkout(){
    	$cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        $diachi = DB::table('tbl_lienhe')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();
        $all_slide = DB::table('tbl_slide')->where('slide_status','0')->orderby('slide_id','desc')->limit(4)->get();
    	return view('pages.checkout.show_checkout')->with('diachi',$diachi)->with('category',$cate_product)->with('brand',$brand_product)->with('all_slide',$all_slide);
    }
    public function save_checkout_customer(Request $request){
    	$data = array();
        if ($request->shipping_name == '') {

            Session::put('nameshipping','Name không được để trống');
            return Redirect::to('/checkout');
    
        } elseif (is_numeric($request->shipping_name)) {
    
            Session::put('nameshipping','Name không thể để là số');
            return Redirect::to('/checkout');
    
    
        } elseif (strlen($request->shipping_name) < 3) {
    
            Session::put('nameshipping','Name không được nhỏ hơn 3 kí tự');
            return Redirect::to('/checkout');
    
    
        } else {
    
            $data['shipping_name'] = $request->shipping_name;
        }
    	// vali phone
    if ($request->shipping_phone == '') {

        Session::put('nameshipping','SĐT không được để trống');
        return Redirect::to('/checkout');

    } elseif (!is_numeric($request->shipping_phone)) {

        Session::put('nameshipping','SĐT phải là số');
        return Redirect::to('/checkout');


    } elseif ( strlen($request->shipping_phone) !== 10) {

        Session::put('nameshipping','SĐT phai la 10 so');
        return Redirect::to('/checkout');


    } else {

        $data['shipping_phone'] = $request->shipping_phone;
    }
    // vali mail
    if ($request->shipping_email == '') {

        Session::put('nameshipping','email không được để trống');
        return Redirect::to('/checkout');

    } else {

        $data['shipping_email'] = $request->shipping_email;
    }
    	// note
        if ($request->shipping_notes == '') {

            Session::put('nameshipping','địa chỉ không được để trống');
            return Redirect::to('/checkout');
    
        } elseif (is_numeric($request->shipping_notes)) {
    
            Session::put('nameshipping','địa chỉ không thể để là số');
            return Redirect::to('/checkout');
    
    
        } elseif (strlen($request->shipping_notes) < 5) {
    
            Session::put('nameshipping','vui lòng nhập địa chỉ cụ thể');
            return Redirect::to('/checkout');
    
    
        } else {
    
            $data['shipping_notes'] = $request->shipping_notes;
        }

    	$data['shipping_address'] = $request->shipping_address;

    	$shipping_id = DB::table('tbl_shipping')->insertGetId($data);

    	Session::put('shipping_id',$shipping_id);

    	return Redirect::to('/payment');
    }
    public function payment(){
        $all_slide = DB::table('tbl_slide')->where('slide_status','0')->orderby('slide_id','desc')->limit(4)->get();
        $diachi = DB::table('tbl_lienhe')->get();
        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();
        return view('pages.checkout.payment')->with('category',$cate_product)->with('brand',$brand_product)->with('all_slide',$all_slide)->with('diachi',$diachi);

    }
    public function order_place(Request $request){
        //insert payment_method

        $data = array();
        
        if($request->payment_option == ''){
            $request->payment_option = 2;
        }
        $data['payment_method'] = $request->payment_option;
        $data['payment_status'] = 'Đang chờ xử lý';
        $payment_id = DB::table('tbl_payment')->insertGetId($data);

        //insert order
        $order_data = array();
        if(Session::get('customer_id')!==null){
        $order_data['customer_id'] = Session::get('customer_id');
        }else{
            $order_data['customer_id'] = 9;
        }
        $order_data['shipping_id'] = Session::get('shipping_id');
        $order_data['payment_id'] = $payment_id;
        if(Cart::total() != 0.00){
            $order_data['order_total'] = Cart::total();
        }else{
            Session::put('giasp','không có sản phẩm nào được chọn');
            return Redirect::to('/payment');
        }
        
        $order_data['order_status'] = 'Đang chờ xử lý';
        $order_id = DB::table('tbl_order')->insertGetId($order_data);

        //insert order_details
        $content = Cart::content();
        foreach($content as $v_content){
            $order_d_data['order_id'] = $order_id;
            $order_d_data['product_id'] = $v_content->id;
            $order_d_data['product_name'] = $v_content->name;
            $order_d_data['product_price'] = $v_content->price;
            $order_d_data['product_sales_quantity'] = $v_content->qty;
            DB::table('tbl_order_details')->insert($order_d_data);
        }
        if($data['payment_method']==1){

            echo 'Thanh toán thẻ ATM';

        }elseif($data['payment_method']==2){
            Cart::destroy();
            $diachi = DB::table('tbl_lienhe')->get();
            $all_slide = DB::table('tbl_slide')->where('slide_status','0')->orderby('slide_id','desc')->limit(4)->get();
            $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
            $brand_product = DB::table('tbl_brand')->where('brand_status','0')->orderby('brand_id','desc')->get();
            return view('pages.checkout.handcash')->with('category',$cate_product)->with('brand',$brand_product)->with('diachi',$diachi)->with('all_slide',$all_slide);

        }else{
            echo 'Thẻ ghi nợ';

        }

        return Redirect::to('/payment');
    }
    public function logout_checkout(){
    	Session::flush();
    	return Redirect::to('/login-checkout');
    }
    public function login_customer(Request $request){
    	$email = $request->email_account;
    	$password = md5($request->password_account);
    	$result = DB::table('tbl_customers')->where('customer_email',$email)->where('customer_password',$password)->first();


    	if($result){
    		Session::put('customer_id',$result->customer_id);
            Session::put('customer_name',$result->customer_name);
            Session::put('customer_email',$result->customer_email);
            Session::put('customer_phone',$result->customer_phone);
    		return Redirect::to('/checkout');
    	}else{
            Session::put('message','Mật khẩu hoặc tài khoản bị sai.Làm ơn nhập lại');
    		return Redirect::to('/login-checkout');
    	}




    }
    public function delete_order($order_id){
        $this->AuthLogin();
        DB::table('tbl_order')->where('order_id',$order_id)->delete();
        Session::put('message','Xóa thành công');
        return Redirect::to('/manage-order');
    }
    public function manage_order(){

        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
        ->join('tbl_customers','tbl_customers.customer_id','=','tbl_order.customer_id')
        ->join('tbl_order_details','tbl_order_details.order_id','=','tbl_order.order_id')
        ->select('*')
        ->orderby('tbl_order.order_id','desc')->get();
        $manager_order  = view('admin.manage_order')->with('all_order',$all_order);
        return view('admin_layout')->with('admin.manage_order', $manager_order);
    }
}
