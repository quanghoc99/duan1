@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">

  <div class="panel panel-default">
    <div class="panel-heading">
     Thông tin khách hàng
    </div>


    <div class="table-responsive">
                      <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>

            <th>Tên khách hàng</th>
            <th>địa chỉ</th>
            <th>Số điện thoại</th>


            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>

          <tr>

            <td>{{$order_by_id->customer_name}}</td>
            <td>{{$order_by_id->shipping_address}}</td>
            <td>{{$order_by_id->shipping_phone}}</td>


          </tr>

        </tbody>
      </table>

    </div>

  </div>
</div>
<br>
<br><br>
<div class="table-agile-info">

  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê chi tiết đơn hàng
    </div>


    <div class="table-responsive">

      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tổng tiền theo thuế</th>

            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
@foreach($customer as $key => $item)
          <tr>
            <td>{{$item->product_name}}</td>
            <td>{{$item->product_sales_quantity}}</td>
            <td>{{$item->product_price}}</td>
            <td>{{($item->product_price/100*21)+$item->product_price}}</td>
                        </tr>
@endforeach
<tr>
            <td>Tổng tiền : {{$order_by_id->order_total}}</td>
            <td></td>
</tr>
        </tbody>
      </table>

    </div>
  </div>
</div>
@endsection
