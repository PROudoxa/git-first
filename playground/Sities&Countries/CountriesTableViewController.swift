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
//    let url = "http://bm.img.com.ua/nxs/img/prikol/images/large/4/9/312294.jpg"
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myImage: UIImageView!
    
//    let countriesName: [String] = ["Ukraine", "USA", "United Kingdom", "Canada"]
//    let imagesName: [String] = ["ua", "us", "gb", "ca"]
    let countriesArray = [(name: "Ukraine", image: "ua"), (name: "USA", image: "us"), (name: "United Kingdom", image: "gb"), (name: "Canada", image: "ca")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for image
        let imgURL: NSURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Canada.svg/135px-Flag_of_Canada.svg.png")!
        let imgData: NSData = NSData(contentsOfURL: imgURL)!
        myImage.image = UIImage(data: imgData)
        
        //weblink for webView------
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        //-------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
