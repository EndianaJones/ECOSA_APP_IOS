//
//  ViewController.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 9/5/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let db = FirebaseController()
        let cd = coreDataController()
        //print("Hello World \n")
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
       //db.getWeekENG()
        db.AllDays()
        
        //db.getWeekFR()
      
      //  db.getWeekSPH()
//        db.getWeekENG()
//        var timeS = Date(timeIntervalSince1970: 1593234000)
//        var timeE = Date(timeIntervalSince1970: 1593838800)
        /// //Users/gerve-endypluviose/Library/Developer/CoreSimulator/Devices/5BB72E92-AC82-496B-AB59-EE37E2556FC0/data/Containers/Data/Application/01109511-7FC7-48A6-808C-105D2D526DE0/Documents/
        
        
    }


}

