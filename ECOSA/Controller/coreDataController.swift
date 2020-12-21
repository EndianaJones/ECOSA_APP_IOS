//
//  coreDataController.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 9/7/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//


// ISSUE: WRITE LOGICS FOR 3 LANGUAGES
// 

//import Foundation
import CoreData
import UIKit



class coreDataController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var WeekArray = [Week]()
    var DayArray = [Day]()
//    let new_item = Day(context: self.context)
   
    //FUNCTION Save what's in context to our permanent DB
    
    func save_item(){
        
        do {
            try context.save()
        } catch  {
            print("There was an error while trying to save item \(error)")
        }
    }
    
    // FETCH THE DATA FROM LOCAL DB
    func loadWeekData(){
        let request: NSFetchRequest<Week> = Week.fetchRequest()
        do{
            WeekArray = try context.fetch(request)
        } catch {
            print("Error Fetching Data \(error)")
        }
    }
    
    //WEEK DATA COUNT
    func weekDataCount()->Int{
        self.loadWeekData()
        //WeekArray.count
        return WeekArray.count
    }
    //UPDATE WEEK DATA IN LOCAL DB
    func updateWeekData(data: Week_Struct, idx: Int) {
        
        WeekArray[idx].lesson_num = data.lesson_num
        WeekArray[idx].wk_verse_text = data.wk_verse_text
        WeekArray[idx].language = data.language
        WeekArray[idx].wk_exp_date = data.wk_exp_date
        WeekArray[idx].wk_verse = data.wk_verse
        WeekArray[idx].wk_start_date = data.wk_start_date
        WeekArray[idx].wk_title = data.wk_title
        
    
        //print(WeekArray[0].wk_verse_text!)
        self.save_item()
        
    }
    
    //ADD WEEK DATA IN LOCAL DB
    
    func addWeekData(data: Week_Struct ) {
        
        let new_week = Week(context:self.context)
        new_week.wk_title = data.wk_title
        new_week.language = data.language
        new_week.lesson_num = data.lesson_num
        new_week.wk_exp_date = data.wk_exp_date
        new_week.wk_start_date = data.wk_start_date
        new_week.wk_verse = data.wk_verse
        new_week.wk_verse_text = data.wk_verse_text
        
        self.save_item()
        
        
    }
    
    
    func checkWeekData(data: Week_Struct ) {
        //Fetch Data
        self.loadWeekData()
        var idx: Int?
        for (index, element) in WeekArray.enumerated(){
            if element.language == data.language{
                idx = index
                
                
            }
        }
        
        if idx == nil{
           self.addWeekData(data: data)
        }else{
           self.updateWeekData(data: data, idx: idx ?? 0)
        }
        
        
        
        
        
        
        
        
    }
    
    
//------------------------------ DAY DATA ----------------------------
    
    //UPDATE DAY DATA IN LOCAL DB
    func updateDayData(data: Day_Struct, idx: Int) {
        
        DayArray[idx].d_date = data.D_Date
        DayArray[idx].d_day = data.D_Day
        DayArray[idx].d_lng = data.D_LNG
        DayArray[idx].d_text = data.D_Text
        DayArray[idx].d_title = data.D_Title
        
        
    
        //print(WeekArray[0].wk_verse_text!)
        self.save_item()
        
    }
    
    //ADD DAY DATA IN LOCAL DB
    
    func addDayData(data: Day_Struct ) {
        print("Adding Day Data")
        let new_day = Day(context:self.context)
        new_day.d_title = data.D_Title
        new_day.d_lng = data.D_LNG
        new_day.d_date = data.D_Date
        new_day.d_text = data.D_Text
        new_day.d_status = false
        new_day.d_day = data.D_Day
        //NEED TO ADD DAY VERSE TO PROPER TABLE
        
        self.save_item()
        
        
    }
    
    // FETCH THE DATA FROM LOCAL DB
    func loadDayData(){
        let request: NSFetchRequest<Day> = Day.fetchRequest()
        do{
            DayArray = try context.fetch(request)
        } catch {
            print("Error Fetching Data \(error)")
        }
        
        print( "THIS IS IT \n \(DayArray)")
    }
    
    func checkDayData(data: Day_Struct ) {
        //Fetch Data
        self.loadDayData()
       //print(data)
        var idx: Int?
        for (index, element) in DayArray.enumerated(){
            if element.d_lng == data.D_LNG && element.d_day == data.D_Day {
                idx = index
                
                
            }
        }
        
        if idx == nil{
           self.addDayData(data: data)
        }else{
           self.updateDayData(data: data, idx: idx ?? 0)
        }
        
        
        
    }
    
    
}
