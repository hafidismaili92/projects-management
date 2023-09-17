<?php

namespace App\Http\Controllers\api;

use App\Models\Plan;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PlanController extends Controller
{
    public $maxPlansPerRequest = 6;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $plans = $user->plans()->paginate($this->maxPlansPerRequest);
        return response()->json(["data"=>array_values($plans->items()),"total"=>$plans->total()]);
        //return response()->json($plans, 200);
       
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $user = Auth::user();
        $validate = $request->validate([
            'title'=>'required|max:500',
            'description'=>'max:1000'
        ]);
        $request->title;
        $request->description;
        $project = new Plan();
        $project->title = $request->title;
        $project->description = $request->description;
        $user->plans()->save($project);
       /* $user->plans()->create([
            'title'=>$request->title,
            'description'=>$request->description
        ]);*/
        return response()->json(['success'=>true,'project'=>$project]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Plan $plan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Plan $plan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Plan $plan)
    {
        //
    }
}
