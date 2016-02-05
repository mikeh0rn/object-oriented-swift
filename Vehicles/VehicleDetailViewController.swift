//
//  DetailViewController.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class VehicleDetailViewController: UIViewController {
  
  @IBOutlet weak var detailDescriptionLabel: UILabel!
  
  //Swift has a simple and classy solution called property observers, and it lets you execute code whenever a property has changed. To make them work, you need to declare your data type explicitly then use either didSet to execute code when a property has just been set, or willSet to execute code before a property has been set.
  var detailVehicle: Vehicle? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }

  func configureView() {
    // Update the user interface for the detail item.
    if let vehicle = detailVehicle {
      // TODO: Fill this in.
      title = vehicle.vehicleTitle
      detailDescriptionLabel?.text = vehicle.vehicleDetails
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  //The if let statement makes sure that vehicle exists, and if it does, creates an alert controller using your extension and presents it.
  
  @IBAction func goForward(sender: AnyObject) {
    // TODO: Fill this in.
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithTitle("Go Forward", message: vehicle.goForward(), preferredstyle: .Alert)
      presentViewController(controller, animated: true, completion: nil)
    }
  }
  
  @IBAction func goBackward(sender: AnyObject) {
    // TODO: Fill this in.
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithTitle("Go Backward", message: vehicle.goBackward(), preferredstyle: .Alert)
      presentViewController(controller, animated: true, completion: nil)
    }
  }
  
  @IBAction func stopMoving(sender: AnyObject) {
    // TODO: Fill this in.
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithTitle("Stop moving", message: vehicle.stopMoving(), preferredstyle: .Alert)
      presentViewController(controller, animated: true, completion: nil)
    }
  }
  
  @IBAction func turn(sender: AnyObject) {
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithNumberInput(title: "Turn", message: "Enter number of degrees to turn:", buttonTitle: "Go!") {
        integerValue in
        if let value = integerValue {
          let controller = UIAlertController.alertControllerWithTitle("Turn", message: vehicle.turn(value), preferredstyle: .Alert)
          self.presentViewController(controller, animated: true, completion: nil)
        }
      }
      presentViewController(controller, animated: true) {}
    }
  }
  
  @IBAction func makeNoise(sender: AnyObject) {
    // TODO: Fill this in.
  }
  
}
