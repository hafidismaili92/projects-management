<?php

namespace App\Http\Controllers\api;
use Illuminate\Auth\Events\Registered;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Actions\Fortify\CreateNewUser;

class AuthController extends Controller
{
      
   /**
    * login
    * if login request from SPA or app frontend we simply authenticate
    * else we create a user token and send it back to user
    * see the laravel sanctum documentation
    * @param  mixed $request
    * @return void
    */
   public function login(Request $request)
   {
    
      
        // Mobile app authentication logic (token-based)
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if (Auth::attempt($credentials)) {
        
            $user = Auth::user();
            $token = $user->createToken('mobile-app-token')->plainTextToken;
            return response()->json(['message' => 'Authenticated successfully', 'token' => $token]);
        }
        else
        {
            return response()->json(['message' => 'Authentication failed'], 401);
        }

        
        
    
   }

   public function logoutCurrentInstance(Request $request)
    {
        $user = $request->user();
        
        if ($user) {
            $user->currentAccessToken()->delete();
            return response()->json(['message' => 'Logged out from current instance successfully']);
        }
        
        return response()->json(['message' => 'User not found'], 404);
    }


    public function register(Request $request)
    {
        //we use CreateNewUser from fortify but we return tokens rather than login with session
        $creator = new CreateNewUser();
        $user = $creator->create($request->all());
        event(new Registered($user));
        $token = $user->createToken('registration-token')->plainTextToken;

        // Log the user in
        //Auth::login($user);

        return response()->json(['message' => 'Registration successful', 'token' => $token]);
    }
    
}
