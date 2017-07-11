//
//  AppExtension.swift
//  HorizontalCalenderWithCustomDate
//
//  Created by apple on 11/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var height:CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 5.0
        view.layer.borderColor  =  UIColor.clear.cgColor
        view.layer.borderWidth = 5.0
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor =  UIColor.lightGray.cgColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOffset = CGSize(width:5, height: 5)
        view.layer.masksToBounds = false
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
    }
    func setViewAnimted(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .showHideTransitionViews, animations: { _ in
            view.isHidden = hidden
        }, completion: nil)
    }
    
}

extension Date {
    func generateDates(startDate :Date?, addbyUnit:Calendar.Component, value : Int) -> [Date]
    {
        let calendar = Calendar.current
        var datesArray: [Date] =  [Date] ()
        
        for i in 0 ... value {
            if let newDate = calendar.date(byAdding: addbyUnit, value: i + 1, to: startDate!) {
                datesArray.append(newDate)
            }
        }
        
        return datesArray
    }
    
    func convertDatesArrayToStringFormat(dates : [Date]) ->[String]
    {
        var formattedArray =  [String]()
        
        var myString =  String()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        for i in 0 ... dates.count-1 {
            
            myString = dateFormatter.string(from: dates[i])
            
            formattedArray.append(myString)
            
        }
        
        return formattedArray
    }
    func getDateNumberArrayFromDates(dates : [Date]) -> [String]
    {
        
        var formattedArray =  [String]()
        var myString =  String()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        for i in 0 ... dates.count-1 {
            
            myString = dateFormatter.string(from: dates[i])
            
            formattedArray.append(myString)
            
        }
        return formattedArray
        
    }
    func getMonthArrayFromDates(dates : [Date]) -> [String]{
        
        var formattedArray =  [String]()
        var myString =  String()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        
        for i in 0 ... dates.count-1 {
            
            myString = dateFormatter.string(from: dates[i])
            
            formattedArray.append(myString)
            
        }
        return formattedArray
        
    }
    
    func getDayNameArrayFromDates(dates : [Date]) -> [String]{
        
        var formattedArray =  [String]()
        var myString =  String()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        for i in 0 ... dates.count-1 {
            
            myString = dateFormatter.string(from: dates[i])
            
            formattedArray.append(myString)
            
        }
        return formattedArray
        
    }
}
