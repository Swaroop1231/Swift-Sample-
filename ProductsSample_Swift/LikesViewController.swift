//
//  LikesViewController.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 24/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var likesTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManageObjects.sharedInstance().likesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("productsCell", forIndexPath: indexPath) as! ProductsTableViewCell

        let object: NSMutableDictionary! = ManageObjects.sharedInstance().likesArray[indexPath.row] as? NSMutableDictionary
        
        cell.productLabel?.text = object["name"] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
