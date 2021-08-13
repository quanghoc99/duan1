@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Danh sách thông tin
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">

      </div>
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
          <th>Logo</th>
            <th>Địa Chỉ</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Map</th>

            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
          @foreach($diachi as $key => $pro)
          <tr>
          <td><img src="{{URL::to('frontend/images/'.$pro->logo)}}" height="100" width="100"></td>
            <td>{{ $pro->diachi }}</td>
            <td>{{ $pro->email }}</td>
            <td>{{ $pro->std }}</td>
            <td style="width: 300px;"><div style="overflow: scroll; width: 300px;">{{ $pro->map }}</div></td>
            <td>
              <a href="{{URL::to('/edit-lienhe/'.$pro->lienhe_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-pencil-square-o text-success text-active"></i></a>
              </a>
            </td>
          </tr>

          @endforeach
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">

        <div class="col-sm-5 text-center">
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection
