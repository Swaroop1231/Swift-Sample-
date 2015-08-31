//
//  ProductDetailViewController.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 24/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import UIKit
import CoreData

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var manufactureLabel: UILabel!
    
    var detailDict : NSManagedObject!

    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameLabel?.text =  detailDict.valueForKey("productname") as? String
        companyLabel?.text =  detailDict.valueForKey("companyname") as? String
        manufactureLabel?.text =  detailDict.valueForKey("manufactuirnglocation") as? String
        descriptionLabel?.text =  detailDict.valueForKey("productdescription") as? String
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
