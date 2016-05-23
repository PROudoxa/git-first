//
//  CountriesTableViewController.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    let url = "http://apple.com"   //Link for webView on the main screen
    var countryName: String = ""

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myImage: UIImageView!
    
    //Arrey for countries and their pictures
    let countriesArray = [(name: "Ukraine", image: "ua"), (name: "USA", image: "us"), (name: "United Kingdom", image: "gb"), (name: "Canada", image: "ca")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //weblink for webView--------
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        //---------------------------
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.countriesArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AV", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = countriesArray[indexPath.row].name
        cell.imageView?.image = UIImage(named: countriesArray[indexPath.row].image)
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        countryName = countriesArray[indexPath.row].name
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController: MoreInformation = segue.destinationViewController as! MoreInformation
        destViewController.country = countryName
    }
    
}
