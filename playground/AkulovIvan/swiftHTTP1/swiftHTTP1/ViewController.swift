//
//  ViewController.swift
//  swiftHTTP1
//
//  Created by Alex Voronov on 05.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import SwiftHTTP
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        //HTTP.GET("https://google.com") { response in
//        HTTP.GET("http://jsonplaceholder.typicode.com/posts") { response in
//            if let err = response.error {
//                print("error: \(err.localizedDescription)")
//                return //also notify app of failure as needed
//            }
//            //print("opt finished: \(response.description)")
//            //print("data is: \(response.data)") //access the response of the data with response.data
//            let data = response.data
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                //print(json)
//            } catch {
//                print(error)
//            }
//        }
        for i in 1...100_000_00 {
            let n = [arc4random_uniform(999999)]
            if i % 100_000 == 0 { report_memory() }
        }
        print("done!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func report_memory() {
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_,
                          task_flavor_t(MACH_TASK_BASIC_INFO),
                          $0,
                          &count)
            }
        }
        
        if kerr == KERN_SUCCESS {
            print("Memory in use (in bytes): \(info.resident_size)")
        }
        else {
            print("Error with task_info(): " +
                (String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error"))
        }
    }
}

