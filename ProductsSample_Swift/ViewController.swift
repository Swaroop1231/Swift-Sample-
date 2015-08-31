//
//  ViewController.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 20/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var productsTableView: UITableView!
      let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
      var productsArray: NSMutableArray = []


    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // self.productsTableView.registerNib(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.title = "Products"
        setNavigationBarColor()
        setNavigationButtons()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        productsArray.removeAllObjects()
        getResults()

        self.productsTableView.reloadData()
    }
    
    func setNavigationBarColor()
    {
        //191.f/255.f green:63.f/255.f blue:58.f/255.f alpha:1
        
        let backgroundColor = UIColor(red: 191.0/255.0, green: 63.0/255.0, blue: 58.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.barTintColor = backgroundColor
        self.navigationController!.navigationBar.translucent = false
    
    }
    
    func setNavigationButtons()
    {
        let rgt_button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        rgt_button.setImage(UIImage(named: "add_button.png"), forState: UIControlState.Normal)
        rgt_button.addTarget(self, action: "addButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        rgt_button.frame = CGRectMake(0, 0, 20, 20)
        
        let barRightButton = UIBarButtonItem(customView: rgt_button)
        self.navigationItem.rightBarButtonItem = barRightButton
        
        
        
        let left_button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        left_button.setImage(UIImage(named: "heart_black.png"), forState: UIControlState.Normal)
        left_button.addTarget(self, action: "likesButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        left_button.frame = CGRectMake(0, 0, 25, 25)
        
        let barLeftButton = UIBarButtonItem(customView: left_button)
        self.navigationItem.leftBarButtonItem = barLeftButton

    }
    
    
    func getResults()
    {
        
        let fetchRequest = NSFetchRequest(entityName:"Products")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        self.managedObjectContext!.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults
        {
            for var i=0; i<results.count; i++
            {
                let match = results[i] as NSManagedObject
               // print(match.valueForKey("productname") as! String)

                productsArray.addObject(match)
            }
         }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }

        
    }
    
    
    
    
    func addButtonAction()
    {
        
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("addproducts") as! UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func likesButtonAction()
    {
        if ManageObjects.sharedInstance().likesArray.count > 0
        {
            
            
            
        }
        else
        {
            generateAlert("There are no items to disply.")
            
        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return productsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("productsCell", forIndexPath: indexPath) as! ProductsTableViewCell
    
        var productsobj = productsArray.objectAtIndex(indexPath.row) as! NSManagedObject
        cell.productLabel?.text =  productsobj.valueForKey("productname") as? String

        
        cell.accessoryType = UITableViewCellAccessoryType.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        performSegueWithIdentifier("detailview", sender: indexPath)
    }
    
    func generateAlert(msg : NSString)
    {
        
        var alert = UIAlertController(title: "Alert", message: msg as String, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "detailview")
        {
            // initialize new view controller and cast it as your view controller
            var detailViewController = segue.destinationViewController as! ProductDetailViewController
            var indexxxPath : NSIndexPath = sender as! NSIndexPath
            
            print(indexxxPath.row)
            detailViewController.detailDict =   productsArray.objectAtIndex(indexxxPath.row) as! NSManagedObject
            
            // your new view controller should have property that will store passed value
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

