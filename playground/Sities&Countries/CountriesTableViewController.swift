//
//  CountriesTableViewController.swift
//  Sities&Countries
//
//  Created by Алексей on 19.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit


class CountriesTableViewController: UITableViewController {

    let url = "http://apple.com"
    var countryName: String = ""

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myImage: UIImageView!
    
//    let countriesName: [String] = ["Ukraine", "USA", "United Kingdom", "Canada"]
//    let imagesName: [String] = ["ua", "us", "gb", "ca"]
    let countriesArray = [(name: "Ukraine", image: "ua"), (name: "USA", image: "us"), (name: "United Kingdom", image: "gb"), (name: "Canada", image: "ca")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*// for image bottom ------------
        let imgURL: NSURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Canada.svg/135px-Flag_of_Canada.svg.png")!
        let imgData: NSData = NSData(contentsOfURL: imgURL)!
        myImage.image = UIImage(data: imgData)
        //------------------------------ */
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
        // Configure the cell...
        return cell
    }
    //
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        //let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
        countryName = countriesArray[indexPath!.row].name
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
        //let country = countriesArray[indexPath.row].name
        let destViewController: MoreInformation = segue.destinationViewController as! MoreInformation
        destViewController.country = countryName
    }
    


}
