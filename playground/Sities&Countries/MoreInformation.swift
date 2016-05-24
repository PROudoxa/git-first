//
//  MoreInformation.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class MoreInformation: UIViewController {
    
    // @IBOutlet weak var scrollView1: UIScrollView!
    var toGetResources: Resources? = nil   // object to get data from resources
    var countryName: String = ""
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "about \(countryName)"
        
//        if let b: Resources = toGetResources {
//                let urlWiki = NSURL (string: b.changeURL(countryName))
//            if let c = urlWiki {
//                webView.loadRequest(NSURLRequest(URL: c))  // Shows the link for countries "more information"
//            }
//        }
        
            let r: String? = toGetResources?.changeURL(countryName)
                if let a = r {
                   let urlWiki = NSURL (string: a)
                   if let c = urlWiki {
                       webView.loadRequest(NSURLRequest(URL: c))  // Shows the link for countries "more information"
                   }
                }
    }
}
