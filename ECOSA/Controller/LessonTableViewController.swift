//
//  LessonTableViewController.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 1/29/21.
//  Copyright © 2021 Gerve-Endy Pluviose. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import MBCircularProgressBar


class LessonTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7 //DayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coreData = coreDataController()
        let dayArr = coreData.getFrenchDay()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LessonTableViewCell
        cell.ViewCell.layer.cornerRadius = 15
        cell.ViewCell.layer.shadowRadius = 15
        cell.ViewCell.layer.shadowOpacity = 0.2
        
        
        print("dataArr \(dayArr[indexPath.row].d_date)")
        cell.DayCell.text = dayArr[indexPath.row].d_day
        cell.DayCell.font = UIFont(name: "OpenSansCondensed-LightItalic", size: 15)
        
        cell.TitleCell.text = dayArr[indexPath.row].d_title
        //cell.DateCell.text = String(dayArr[indexPath.row].d_date)
        
        //print(DayArray[0].d_title ??  "value")
        
        //cell.DayCell.text = "DOn't"//DayArray[indexPath.row].d_title
        //cell.DayCell.font = UIFont(name: "Poppins-Regular", size: 18)
        
        return cell
        
    }
    
    

    
    
    
    
    
    override func viewDidLoad() {
       
       
       // print(DayArray)
        
            super.viewDidLoad()
    }
       
        
        
    
    
    
   
    


 
}
