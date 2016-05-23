//
//  MoreInformation.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class MoreInformation: UIViewController {
    
    var country: String = ""
    
    var fromResources: Resources? = nil
        
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromResources = Resources()
        webView.loadRequest(fromResources!.changeURL(fromResources!.country))
        //webView.loadRequest(fromResources!.requestForMoreInfo)
    }
}
