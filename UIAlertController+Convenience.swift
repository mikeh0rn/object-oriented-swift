//
//  UIAlertController+Convenience.swift
//  Vehicles
//
//  Created by Mike Horn on 2/5/16.
//  Copyright © 2016 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

//The format [Component]+[Extension Name] borrows a page from Objective-C category file naming conventions. 

extension UIAlertController {
  class func alertControllerWithTitle(title:String, message:String, preferredstyle:UIAlertControllerStyle) -> UIAlertController {
    let controller = UIAlertController(title: title, message: message, preferredStyle: preferredstyle)
    controller.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    return controller
  }
  
  class func alertControllerWithNumberInput(title title:String, message:String, buttonTitle:String, handler:(Int?)->Void) -> UIAlertController {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    
    controller.addTextFieldWithConfigurationHandler { $0.keyboardType = .NumberPad }
    
    controller.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    
    controller.addAction(UIAlertAction(title: buttonTitle, style: .Default) { action in
      let textFields = controller.textFields! as [UITextField]
      let value = Int(textFields[0].text!)
      handler(value)
      } )
    
    return controller
  }
}




//Bonus: In addition to using the Decorator pattern by adding functionality to UIAlertController you are also implementing what is called the Factory pattern. The Factory pattern returns an initialized instance configured in a particular way. You might say this is a Decorated Factory.