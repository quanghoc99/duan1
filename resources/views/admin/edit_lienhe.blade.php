@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Cập nhật thông tin
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
                                @foreach($edit_lienhe as $key => $pro)
                                <form role="form" action="{{URL::to('/update-lienhe/'.$pro->lienhe_id)}}" method="post" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                <div class="form-group">
                                    <label for="exampleInputEmail1">SĐT</label>
                                    <input type="text" name="lienhe_std" class="form-control" id="exampleInputEmail1" value="{{$pro->std}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Địa chỉ</label>
                                    <input type="text" name="diachi" class="form-control" id="exampleInputEmail1" value="{{$pro->diachi}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên slide</label>
                                    <input type="email" name="lienhe_email" class="form-control" id="exampleInputEmail1" value="{{$pro->email}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Logo</label>
                                    <input type="file" name="logo" class="form-control" id="exampleInputEmail1">
                                    <img src="{{URL::to('frontend/images/'.$pro->logo)}}" height="100" width="100">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">map</label>
                                    <input type="text" name="lienhe_map" class="form-control" id="exampleInputEmail1" value="{{$pro->map}}">
                                </div>
                                <button type="submit" name="add_slide" class="btn btn-info">Cập nhật</button>
                                </form>
                                @endforeach
                            </div>

                        </div>
                    </section>

            </div>
@endsection
