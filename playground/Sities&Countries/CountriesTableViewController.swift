//
//  CountriesTableViewController.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    var viewFromResources: Resources? { get{ return linkToGetHeader?.toGetResources ?? ResourcesAmerica() } }
    
    var countryName: String = ""
    var linkToGetHeader: HeaderSegment? = nil
    let headerView = HeaderSegment.instanceFromNib()

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for image in the bottom ----------
        let imgURL: NSURL? = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Canada.svg/135px-Flag_of_Canada.svg.png")
        //let imgURL: NSURL? = NSURL(string: "https://images.unsplash.com/photo-1463123081488-789f998ac9c4?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=6d1a6d1c5a7eb63d0c411b1d019f0b30")
        if let url2 = imgURL {
         let imgData: NSData? = NSData(contentsOfURL: url2)
            if let url3 = imgData {
                myImage.image = UIImage(data: url3)
            }
        }
         //----------------------------------
        //weblink for webView--------
        if let a = viewFromResources {
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
        if let a = viewFromResources {
            return a.countriesArrayWithPicture.count
        } else { return 1 }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AV", forIndexPath: indexPath) as UITableViewCell
        if let a = viewFromResources {
            cell.textLabel?.text = a.countriesArrayWithPicture[indexPath.row].name
            cell.imageView?.image = UIImage(named: a.countriesArrayWithPicture[indexPath.row].image)
        }
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if let a = viewFromResources {
            countryName = a.countriesArrayWithPicture[indexPath.row].name // To catch the name of selected cell
        }
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController: MoreInformation = segue.destinationViewController as! MoreInformation
        destViewController.countryName = countryName             // To cast the name to "More information" screen
        destViewController.toGetResources = viewFromResources       // To cast the object link to "More information" screen
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        linkToGetHeader = headerView as? HeaderSegment
        linkToGetHeader?.referanceOnTableView = tableView

        return headerView
    }
    
}
