//
//  CountriesTableViewController.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    let toGetResources: Resources? = nil
    var countryName: String = ""

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for image bottom ------------
        let imgURL: NSURL? = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Canada.svg/135px-Flag_of_Canada.svg.png")
        if let url2 = imgURL {
         let imgData: NSData? = NSData(contentsOfURL: url2)
            if let url3 = imgData {
                myImage.image = UIImage(data: url3)
            }
        }
         //------------------------------
        
        //weblink for webView--------
        if let a = toGetResources {
        let requestURL = NSURL(string: a.urlWebView)
            if let b = requestURL {
                let request = NSURLRequest(URL: b)
                webView.loadRequest(request)
            }
        }
        //---------------------------
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return toGetResources.countriesArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AV", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = toGetResources.countriesArray[indexPath.row].name
        cell.imageView?.image = UIImage(named: toGetResources.countriesArray[indexPath.row].image)
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        countryName = toGetResources.countriesArray[indexPath.row].name // To catch the name of selected cell
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController: MoreInformation = segue.destinationViewController as! MoreInformation
        destViewController.countryName = countryName       // To cast the name to "More information" screen

    }
    
}
