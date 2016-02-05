//
//  Car.swift
//  Vehicles
//
//  Created by Mike Horn on 2/4/16.
//  Copyright © 2016 Razeware, LLC. All rights reserved.
//

import Foundation

class Car: Vehicle {
  
  let isConvertible: Bool
  let isHatchback: Bool
  let hasSunroof: Bool
  let numberOfDoors: Int
  
  //in the initializer you first initialize the properties that the Car class introduces.
  init(brandName: String, modelName: String, modelYear: Int, powerSource: String,
    isConvertible: Bool, isHatchback: Bool, hasSunroof: Bool, numberOfDoors: Int) {
      
      self.isConvertible = isConvertible
      self.isHatchback = isHatchback
      self.hasSunroof = hasSunroof
      self.numberOfDoors = numberOfDoors
      
      // Then you call the superclass’s designated initializer.
      super.init(brandName: brandName, modelName: modelName, modelYear: modelYear,
        powerSource: powerSource, numberOfWheels: 4)
  }
  
  override var vehicleDetails: String {
    //Get basic details from superclass
    let basicDetails = super.vehicleDetails
    
    //Initialize mutable string
    var carDetailsBuilder = "\n\nCar-Specific Details:\n\n"
    
    let yes = "Yes\n"
    let no = "No\n"
    
    //Add info about car-specific features.
    carDetailsBuilder += "Has sunrood: "
    carDetailsBuilder += hasSunroof ? yes : no
    
    carDetailsBuilder += "Is Hatchback: "
    carDetailsBuilder += isHatchback ? yes : no
    
    carDetailsBuilder += "Is Convertible: "
    carDetailsBuilder += isConvertible ? yes : no
    
    carDetailsBuilder += "Number of doors: \(numberOfDoors)"
    
    // Create the final string by combining basic and car-specific details.
    let carDetails = basicDetails + carDetailsBuilder
    
    return carDetails
    
  }
  
  override func goForward() -> String {
    return String(format: "%@ %@ Then depress gas pedal.", start(), changeGears("Forward"))
  }
  
  override func goBackward() -> String {
    return String(format: "%@ %@ Check your rear view mirror. THen depress gas pedal.", start(), changeGears("Reverse"))
  }
  
  override func stopMoving() -> String {
    return String(format: "Depress brake pedal. %@", changeGears("Park"))
  }
  
  override func makeNoise() -> String {
    return "Beep beep!"
  }
  
  
  //use the access control keyword "private" to express the fact that this method should not be used outside of this file.
  //If you use private, access is limited to the file. If you use public, you can access from anywhere, including outside the module. This is useful if you are building a framework, to be used by other projects, for example.
  
  private func start() -> String {
    return String(format: "Start power source %@.", powerSource)
  }
}
