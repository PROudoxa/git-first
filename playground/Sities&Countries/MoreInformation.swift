//
//  MoreInformation.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class MoreInformation: UIViewController {
    
    var toGetResources: Resources? = nil   // object to get data from resources
    var countryName: String = ""
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var emblemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "about \(countryName)"
        
        // Shows the link for countries "more information" ----
        let r: String? = toGetResources?.changeURL(countryName)
        if let a = r {
            let urlWiki = NSURL (string: a)
            if let c = urlWiki {
                webView.loadRequest(NSURLRequest(URL: c))
            }
        }// ----------------------------------------------------
        
        // Shows emblem image -----------
        let url: String? = toGetResources?.changeURLEmblem(countryName) // is waiting for the url from Resources
        if let a = url {
            let imgURL: NSURL? = NSURL(string: a)
            if let url2 = imgURL {
                let imgData: NSData? = NSData(contentsOfURL: url2)
                if let url3 = imgData {
                    emblemImage.image = UIImage(data: url3)
                }
            }
        } // ----------------------------
    }
}