//
//  MasterViewController.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class VehicleListTableViewController: UITableViewController {
  
  var vehicles:[Vehicle] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupVehicleArray()
    title = "Vehicles"
  }
  
  func setupVehicleArray() {
    //array is now empty but the capacity is kept at 4.
    vehicles.removeAll(keepCapacity: true)
    
    //Create car
    let mustang = Car()
    mustang.brandName = "Ford"
    mustang.modelName = "Mustang"
    mustang.modelYear = 1968
    mustang.isConvertible = true
    mustang.isHatchback = false
    mustang.hasSunroof = false
    mustang.numberOfDoor = 2
    mustang.powerSource = "gas engine"
    
    //add to the array
    vehicles.append(mustang)
    
    //Create another car.
    let outback = Car()
    outback.brandName = "Subaru"
    outback.modelName = "Outback"
    outback.modelYear = 1999
    outback.isConvertible = false
    outback.isHatchback = true
    outback.hasSunroof = false
    outback.numberOfDoor = 5
    outback.powerSource = "gas engine"
    
    vehicles.append(outback)
    
    //Create another car.
    let prius = Car()
    prius.brandName = "Totoya"
    prius.modelName = "Prius"
    prius.modelYear = 2002
    prius.isConvertible = true
    prius.isHatchback = false
    prius.hasSunroof = true
    prius.numberOfDoor = 4
    prius.powerSource = "hybrid engine"
    
    vehicles.append(prius)
    
    // Create a motorcycle
    let harley = Motorcycle()
    harley.brandName = "Harley-Davidson"
    harley.modelName = "Softail"
    harley.modelYear = 1979
    harley.engineNoise = "Vrrrrrrrroooooooooom!"
    
    // Add it to the array.
    vehicles.append(harley)
    
    // Create another motorcycle
    let kawasaki = Motorcycle()
    kawasaki.brandName = "Kawasaki"
    kawasaki.modelName = "Ninja"
    kawasaki.modelYear = 2005
    kawasaki.engineNoise = "Neeeeeeeeeeeeeeeeow!"
    
    // Add it to the array
    self.vehicles.append(kawasaki)
    
    // Create a truck
    let silverado = Truck()
    silverado.brandName = "Chevrolet"
    silverado.modelName = "Silverado"
    silverado.modelYear = 2011
    silverado.numberOfWheels = 4
    silverado.cargoCapacityCubicFeet = 53
    silverado.powerSource = "gas engine"
    
    // Add it to the array
    vehicles.append(silverado)
    
    // Create another truck
    let eighteenWheeler = Truck()
    eighteenWheeler.brandName = "Peterbilt"
    eighteenWheeler.modelName = "579"
    eighteenWheeler.modelYear = 2013
    eighteenWheeler.numberOfWheels = 18
    eighteenWheeler.cargoCapacityCubicFeet = 408
    eighteenWheeler.powerSource = "diesel engine"
    
    // Add it to the array
    vehicles.append(eighteenWheeler)
    
    //sort array by the model year
    vehicles.sortInPlace { $0.modelYear < $1.modelYear }
  }
  
  // MARK: - Segues
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let vehicle = vehicles[indexPath.row]
        (segue.destinationViewController as! VehicleDetailViewController).detailVehicle = vehicle
      }
    }
  }
  
  // MARK: - Table View
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vehicles.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
    
    let vehicle = vehicles[indexPath.row] as Vehicle
    cell.textLabel?.text = "\(vehicle.vehicleTitle)"
    return cell
  }
}

