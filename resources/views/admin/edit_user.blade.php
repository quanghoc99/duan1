@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Cập nhật user
                        </header>
                         <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
                        <div class="panel-body">

                            <div class="position-center">
                                @foreach($edit_user as $key => $pro)
                                <form role="form" action="{{URL::to('/update-user/'.$pro->customer_id)}}" method="post" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên user</label>
                                    <input type="text" name="customer_name" class="form-control" id="exampleInputEmail1" value="{{$pro->customer_name}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">sđt</label>
                                    <input type="text" name="customer_phone" class="form-control" id="exampleInputEmail1" value="{{$pro->customer_phone}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">sđt</label>
                                    <input type="text" name="customer_email" class="form-control" id="exampleInputEmail1" value="{{$pro->customer_email}}">
                                </div>
                                <button type="submit" name="add_slide" class="btn btn-info">Cập nhật user</button>
                                </form>
                                @endforeach
                            </div>

                        </div>
                    </section>

            </div>
@endsection
