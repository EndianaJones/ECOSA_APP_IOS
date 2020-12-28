//
//  ViewController.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 9/5/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//

import UIKit
import CoreData
import MBCircularProgressBar


class ViewController: UIViewController {
    @IBOutlet var VOTW_card: UIView!
    @IBOutlet var VOTW_test: UILabel!
    
    @IBOutlet var VOTW_ref: UILabel!
    
    @IBOutlet weak var progressViewBar: MBCircularProgressBarView!
    @IBOutlet var weeklyProcess: UILabel!
    @IBOutlet var streak: UILabel!
    @IBOutlet var VOTW_verse: UILabel!
    @IBOutlet var day_stk: UILabel!
    @IBOutlet var greeting: UILabel!
    var WeekArray = [Week]()

    @IBOutlet weak var image_view: UIView!
    
    
    //GreetingView
    @IBOutlet var lesson_no: UILabel!
    @IBOutlet var lesson_text: UILabel!
    
    @IBOutlet var lesson_title_text: UILabel!
    
    @IBOutlet var Image_card: UIImageView!
    override func viewDidLoad() {
       
        // Do any additional setup after loading the view.
        let db = FirebaseController()
        let cd = coreDataController()
        db.AllWeek()
        VOTW_card.layer.cornerRadius = 15
        VOTW_card.layer.shadowRadius = 15
        VOTW_card.layer.shadowOpacity = 0.2
        
        Image_card.layer.cornerRadius = 15
        Image_card.layer.shadowRadius = 15
        Image_card.layer.shadowOpacity = 0.2
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { // Change
            //super.viewDidLoad()
            
            
            self.WeekArray = cd.getWeek()
            print("Hello World \n")
            print(self.WeekArray.count)
            self.VOTW_test.text = "VERSE OF THE WEEK"
            self.VOTW_test.font = UIFont(name: "Poppins-Bold", size: 20)
            
            self.lesson_text.font = UIFont(name: "OpenSansCondensed-LightItalic", size: 20)
            
            self.lesson_no.text = String(self.WeekArray[0].lesson_num)
            self.lesson_no.font =  UIFont(name: "Poppins-Bold", size: 100)
            
            self.VOTW_verse.text = self.WeekArray[0].wk_verse_text!
            self.VOTW_verse.font = UIFont(name: "Poppins-Light", size: 18)
            
            self.VOTW_ref.text = self.WeekArray[0].wk_verse!
            self.VOTW_ref.font = UIFont(name: "Poppins-Bold", size: 18)
            
            self.greeting.font = UIFont(name: "Poppins-Bold", size: 38)
            
            self.day_stk.font = UIFont(name: "Poppins-Light", size: 18)
            
            
            self.lesson_title_text.font = UIFont(name: "Poppins-Bold", size: 20)
            self.lesson_title_text.text = self.WeekArray[0].wk_title
            
            
            super.viewDidLoad()
        }
        //print(self.WeekArray[0].language!)
        //VERSE OF THE WEEK
        
        
        
        
        
        
        
        //print("Hello World \n")
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
       //Users/gerve-endypluviose/Library/Developer/CoreSimulator/Devices/5BB72E92-AC82-496B-AB59-EE37E2556FC0/data/Containers/Data/Application/01109511-7FC7-48A6-808C-105D2D526DE0/Documents/
        
        
    }
    
    
    //Progress bar
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0){
            self.progressViewBar.value = 3
        }
    }


}

