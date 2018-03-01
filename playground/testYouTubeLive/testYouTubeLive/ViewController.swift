//
//  ViewController.swift
//  testYouTubeLive
//
//  Created by Alex Voronov on 05.02.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   //let loginUrl = "https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=AIzaSyBvRLPHdh6kRs-5o1oY-8Jj95E7uYEa59U"
   let loginUrl = "http://www.kaleidosblog.com/tutorial/login/api/Login"
   let checkSessionUrl = "http://www.kaleidosblog.com/tutorial/login/api/CheckSession"
   
   @IBOutlet weak var _username: UITextField!
   @IBOutlet weak var _password: UITextField!
   @IBOutlet weak var _login_button: UIButton!
   
   var loginSession:String = ""

   override func viewDidLoad() {
      super.viewDidLoad()
      
      _username.text = "try@me.com"
      _password.text = "test"
      
      let preferences = UserDefaults.standard
      
      if (preferences.object(forKey: "session") != nil) {
         loginSession = preferences.object(forKey: "session") as! String
         checkSession()
      } else {
         LoginToDo()
      }
      
   }
   
   @IBAction func LoginButton(_ sender: Any) {
      
      let username = _username.text
      let password = _password.text
      
      if (username == "" || password == "") {
         _username.text = Bundle.main.bundleIdentifier
         return
      }

      if (_login_button.titleLabel?.text == "Logout") {
         let preferences = UserDefaults.standard
         preferences.removeObject(forKey: "session")
         
         LoginToDo()
      } else {
         loginNow(username: _username.text!, password: _password.text!)
      }
   }
   
   func loginNow(username:String, password:String) {
      let postData: NSDictionary = NSMutableDictionary()
      
      postData.setValue(username, forKey: "username")
      postData.setValue(password, forKey: "password")
      
      let url:URL = URL(string: loginUrl)!
      let session = URLSession.shared
      
      let request = NSMutableURLRequest(url: url)
      request.httpMethod = "POST"
      request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
      
      var paramString = ""
      
      
      for (key, value) in postData {
         paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
      }
      
      request.httpBody = paramString.data(using: String.Encoding.utf8)
      
      let task = session.dataTask(with: request as URLRequest, completionHandler: {
         (data, response, error) in
         
         guard let _:Data = data, let _:URLResponse = response  , error == nil else {
            return
         }
         
         let json: Any?
         
         do {
            json = try JSONSerialization.jsonObject(with: data!, options: [])
         }
         catch {
            return
         }
         
         guard let serverResponse = json as? NSDictionary else {
            return
         }
         
         
         if let dataBlock = serverResponse["data"] as? NSDictionary {
            if let sessionData = dataBlock["session"] as? String {
               self.loginSession = sessionData
               
               let preferences = UserDefaults.standard
               preferences.set(sessionData, forKey: "session")
               
               DispatchQueue.main.async(execute: self.LoginDone)
            }
         }
      })
      
      task.resume()
   }
   
   
   func checkSession() {
      
      let postData: NSDictionary = NSMutableDictionary()
      postData.setValue(loginSession, forKey: "session")
      
      let url:URL = URL(string: checkSessionUrl)!

      let session = URLSession.shared
      let request = NSMutableURLRequest(url: url)
      request.httpMethod = "POST"
      request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData

      var paramString = ""

      for (key, value) in postData {
         paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
      }
      
      request.httpBody = paramString.data(using: String.Encoding.utf8)
      
      let task = session.dataTask(with: request as URLRequest, completionHandler:{
      (data, response, error) in
         guard let _:Data = data, let _:URLResponse = response, error == nil else {
            return
         }
         
         let json:Any?
         do {
            json = try JSONSerialization.jsonObject(with: data!, options: [])
         }
         catch {
            return
         }
         
         guard let serverResponse = json as? NSDictionary else {
            return
         }
         
         if let responseCode = serverResponse["response_code"] as? Int {
            if(responseCode == 200)
            {
               DispatchQueue.main.async(execute: self.LoginDone)
               
               
            }
            else
            {
               DispatchQueue.main.async(execute: self.LoginToDo)
            }
         }
         
      })
      
      task.resume()
   }
   
   func LoginToDo() {
      _username.isEnabled = true
      _password.isEnabled = true
      
      _login_button.setTitle("Login", for: .normal)
   }
   
   func LoginDone() {
      _username.isEnabled = false
      _password.isEnabled = false
      
      _login_button.setTitle("Logout", for: .normal)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
}

