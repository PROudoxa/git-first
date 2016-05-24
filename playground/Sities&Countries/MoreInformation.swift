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
    let toGetResources: Resources = Resources()   // object to get data from resources
    var countryName: String = ""
        
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "about \(countryName)"
        
        let urlWiki = NSURL (string: toGetResources.changeURL(countryName))
        webView.loadRequest(NSURLRequest(URL: urlWiki!))  // Shows the link for countries "more information"
    }
}
