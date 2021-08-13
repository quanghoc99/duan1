@extends('layout')
@section('content')

<section id="cart_items">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="{{URL::to('/')}}">Trang chủ</a></li>
				  <li class="active">Thanh toán giỏ hàng</li>
				</ol>
			</div>

			<div class="register-req">
				<p>Làm ơn xem lại thông tin mua hàng</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-12 clearfix">
						<div class="bill-to">
							<p>Điền thông tin gửi hàng</p>
							<div class="form-one">
                            <?php
                        $customer_name = Session::get('customer_name');
                        $customer_email = Session::get('customer_email');
                        $customer_phone = Session::get('customer_phone');
                        ?>
								<form action="{{URL::to('/save-checkout-customer')}}" method="POST">
									{{csrf_field()}}
									<input type="text" name="shipping_email" value="{{$customer_email}}" placeholder="Email">
									<input type="text" name="shipping_name" value="{{$customer_name}}" placeholder="Họ và tên">
									<input type="text" name="shipping_address" placeholder="Địa chỉ">
									<input type="number" name="shipping_phone" value="{{$customer_phone}}" placeholder="Phone">
                                    <textarea name="shipping_notes" value="không có ghi chú" placeholder="Ghi chú đơn hàng của bạn" rows="10">Ghi chú</textarea>
									<input type="submit" value="Gửi" name="send_order" class="btn btn-primary btn-sm">
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="review-payment">
				<h2><a href="{{URL::to('/show-cart')}}">Xem lại giỏ hàng</a></h2>
			</div>
	</section> <!--/#cart_items-->

@endsection
