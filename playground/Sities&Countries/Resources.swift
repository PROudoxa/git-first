//
//  Resources.swift
//  Sities&Countries
//
//  Created by Алексей on 23.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class Resources: NSObject {

    var url: String = "https://ru.wikipedia.org"  // Default link for screen "moreInformation"
    var urlWebView: String = "http://apple.com"   // Link for webView on the main screen
    
    // Array for countries and their pictures
    let countriesArray = [
        (name: "Ukraine",        image: "ua"),
        (name: "USA",            image: "us"),
        (name: "United Kingdom", image: "gb"),
        (name: "Canada",         image: "ca")
    ]
    
    // Dictionary of links of countries
    let countriesWikiURL: [String: String] = [
        "Ukraine":          "https://ru.wikipedia.org/wiki/%D0%A3%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B0",
        "United Kingdom":   "https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BB%D0%B8%D0%BA%D0%BE%D0%B1%D1%80%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F",
        "Canada":           "https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BD%D0%B0%D0%B4%D0%B0",
        "USA":              "https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%91%D0%BD%D0%BD%D1%8B%D0%B5_%D0%A8%D1%82%D0%B0%D1%82%D1%8B_%D0%90%D0%BC%D0%B5%D1%80%D0%B8%D0%BA%D0%B8"
    ]
    
    func changeURL(country: String) -> String {
        switch country {
            case "Ukraine":        url = countriesWikiURL["Ukraine"]!
            case "USA":            url = countriesWikiURL["USA"]!
            case "United Kingdom": url = countriesWikiURL["United Kingdom"]!
            case "Canada":         url = countriesWikiURL["Canada"]!
            default:               break
        }
        return  url
    }
    
}
