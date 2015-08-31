//
//  Products.swift
//  ProductsSample_Swift
//
//  Created by TEJA on 27/08/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

import Foundation
import CoreData
@objc(Products)
class Products: NSManagedObject {

    @NSManaged var companyname: String
    @NSManaged var liked: String
    @NSManaged var manufactuirnglocation: String
    @NSManaged var productdescription: String
    @NSManaged var productname: String

}
