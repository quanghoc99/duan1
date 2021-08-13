<?php

namespace App\Http\Controllers;
use DB;
use Session;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class ContactController extends Controller
{
    public function contact()
    {
        $diachi = DB::table('tbl_lienhe')->get();
        return view ('pages.contact.contact')->with('diachi',$diachi);
    }
}
