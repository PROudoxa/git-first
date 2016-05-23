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
    
    @IBOutlet weak var webView: UIWebView!
    
    // dictionary of links for countries
    let countriesWikiURL: [String: String] = [
        "Ukraine":  "https://ru.wikipedia.org/wiki/%D0%A3%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B0",
        "USA":      "https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%91%D0%BD%D0%BD%D1%8B%D0%B5_%D0%A8%D1%82%D0%B0%D1%82%D1%8B_%D0%90%D0%BC%D0%B5%D1%80%D0%B8%D0%BA%D0%B8",
        "United Kingdom":       "https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BB%D0%B8%D0%BA%D0%BE%D0%B1%D1%80%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F",
        "Canada":   "https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BD%D0%B0%D0%B4%D0%B0"
    ]
    
    var url: String = "https://ru.wikipedia.org"
    
    func  makeUrl (country: String) -> String {
        if country == "Ukraine" {
            url = countriesWikiURL["Ukraine"]!
        } else if country == "USA" {
            url = countriesWikiURL["USA"]!
        } else if country == "United Kingdom" {
            url = countriesWikiURL["United Kingdom"]!
        } else if country == "Canada" {
            url = countriesWikiURL["Canada"]!
        }
        return url
    }
   
    func makeUrlSwitch(country: String) -> String {
        switch country {
        case "Ukraine":        url = countriesWikiURL["Ukraine"]!
        case "USA":            url = countriesWikiURL["USA"]!
        case "United Kingdom": url = countriesWikiURL["United Kingdom"]!
        case "Canada":         url = countriesWikiURL["Canada"]!
        default:               url = "https://ru.wikipedia.org"
        }
        return url
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        url = makeUrl(country)
        let request = NSURLRequest(URL: NSURL(string:url)!)
        webView.loadRequest(request)
    }
}
