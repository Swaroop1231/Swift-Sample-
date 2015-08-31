//
//  ManageObjects.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 20/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import UIKit

class ManageObjects: NSObject
{    static var instance: ManageObjects!
   var productsArray = NSMutableArray()
    var likesArray = NSMutableArray()

    class func sharedInstance() -> ManageObjects
    {
        self.instance = (self.instance ?? ManageObjects())
        return self.instance
    }
    
    func addRecordsToArray(dataDict : NSMutableDictionary)
    {
        productsArray.addObject(dataDict)
        
    }
    
    func addRecordsToLikesArray(dataDict : NSMutableDictionary)
    {
        
        likesArray.addObject(dataDict)
    }
    
}
