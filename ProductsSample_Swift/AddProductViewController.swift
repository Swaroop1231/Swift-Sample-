//
//  AddProductViewController.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 20/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import UIKit
import CoreData

class AddProductViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate
{

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var manufactureLocationTextField: UITextField!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        for subview in view.subviews as! [UIView]
        {
            var textFieldcolor : UIColor  = UIColor(red: 191.0/255.0, green: 63.0/255.0, blue: 58.0/255.0, alpha: 1.0)

            if let textFieldView = subview as? UITextField
            {
                textFieldView.layer.borderColor = textFieldcolor.CGColor
                textFieldView.layer.borderWidth = 1.0
            }
            
            if let textView = subview as? UITextView
            {
                textView.layer.borderColor = textFieldcolor.CGColor
                textView.layer.borderWidth = 1.0
            }
        }
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject)
    {
        
        self .dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func saveButtonAction(sender: AnyObject)
    {
    
        if self.nameTextField.text == ""
        {
            generateAlert("Name should not be empty")
        }
       else if self.companyTextField.text == ""
        {
            generateAlert("Company Name should not be empty")

        }
        else if self.manufactureLocationTextField.text == ""
        {
            generateAlert("Manufacturing Location should not be empty")

        }
        else if self.descriptionTextView.text == ""
        {
            generateAlert("Description should not be empty")

        }
        else
        {
          /*
            var valesObjects = NSArray(objects:self.nameTextField.text, self.companyTextField.text, self.manufactureLocationTextField.text,self.descriptionTextView.text)
            var keyObjects = NSArray(objects:"name","company","manufacture","description")
            let keychainQuery = NSMutableDictionary(objects: valesObjects as [AnyObject], forKeys: keyObjects as [AnyObject])
            
            ManageObjects.sharedInstance().addRecordsToArray(keychainQuery)
            */
            
            
            
         //   getResults()
            
            
 
          //let newItem = NSEntityDescription.insertNewObjectForEntityForName("Products", inManagedObjectContext: managedObjectContext!) as! Products
            
            let newItem = NSEntityDescription.insertNewObjectForEntityForName("Products", inManagedObjectContext: self.managedObjectContext!) as! Products
            
           newItem.productname = self.nameTextField.text
           newItem.productdescription = self.descriptionTextView.text
           newItem.companyname = self.companyTextField.text
           newItem.manufactuirnglocation =  self.manufactureLocationTextField.text
           
            var error1: NSError?
            if !managedObjectContext!.save(&error1)
            {
                println("Could not save \(error1), \(error1?.userInfo)")
            }
            else
            {
                self.dismissViewControllerAnimated(true, completion: nil)
 
            }
            
            
            
        }

    }
    
   /*
    
    func getResults() -> Int64
    {
        
        let fetchRequest = NSFetchRequest(entityName:"Products")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        self.managedObjectContext!.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults
        {
            if results.count>0
            {
                let match = results[results.count-1] as NSManagedObject
                //print(match.valueForKey("productId") as! NSNumber)
                return match.valueForKey("productId") as! NSNumber

            }
            return 0
            
        }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        return 0
    }

    */
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }
    
     func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool
    {
        if(text == "\n")
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        moveSideBarToXposition(-100)

        return true
    }
    
    
    
    func textViewDidEndEditing(textView: UITextView)
    {
        moveSideBarToXposition(0)
    }
    
        func moveSideBarToXposition(iYposition: Float)
        {
            let convertedYposition = CGFloat(iYposition)
            UIView.animateWithDuration(0.5, delay: 0.1, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                
                self.view.frame = CGRectMake(0, convertedYposition, self.view.frame.size.width, self.view.frame.size.height)
                
                }, completion: { (finished: Bool) -> Void in
                    
                    // you can do this in a shorter, more concise way by setting the value to its opposite, NOT value
           })
        }
  
   
     
    func generateAlert(msg : NSString)
    {
        
        var alert = UIAlertController(title: "Alert", message: msg as String, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
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
