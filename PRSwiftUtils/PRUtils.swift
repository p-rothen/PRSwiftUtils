//
//  Utils.swift
//  RelayRace
//
//  Created by Pedro on 17-08-16.
//  Copyright © 2016 Dreamsit. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import Alamofire
import SwiftyJSON

public class PRUtils {
    static let dateTimeFormat = "dd-MM-yyyy HH:mm"
    static let dateFormat = "dd-MM-yyyy"
    static let timeFormat = "HH:mm"
    
    public static func getProgressView(view:UIView)->MBProgressHUD {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        return MBProgressHUD.showHUDAddedTo(view, animated: true)
    }
    
    public static func logResponse(response: Response<AnyObject, NSError>) {
        print(response.request)  // original URL request
        print(response.response) // URL response
        //print(response.data)     // server data
        
        if let data = response.request?.HTTPBody {
            print(JSON(data : data))
        }
        
        if let data = response.data {
            print(JSON(data : data))
        }
        
        print(response.result)   // result of response serialization
    }
    
    public static func endRequest(progressView: MBProgressHUD) {
        progressView.hideAnimated(true)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    public static func activityIndicator(viewParent:UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        var center = viewParent.center
        center.x = center.x - 0
        activityIndicator.center = center
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    public static func stringFromNSDate(date: NSDate)->String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = self.dateTimeFormat
        return dateFormatter.stringFromDate(date)
    }
    
    public static func dateFromString(string:String) -> NSDate? {
        let formatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.locale = enUSPosixLocale
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.dateFromString(string)
    }
    
    public static func stringFromDate(string:String?, dateFormat: String) ->String{
        if let string = string {
            let formatter = NSDateFormatter()
            let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
            formatter.locale = enUSPosixLocale
            formatter.dateFormat = dateFormat
            return formatter.stringFromDate(self.dateFromString(string)!)
        } else {
            return "Missing value"
        }
    }
    
    public static func localStringDate(string: String) ->String {
        return self.stringFromDate(string, dateFormat: self.dateFormat)
    }
    
    public static func localStringTime(string: String) ->String {
        return self.stringFromDate(string, dateFormat: self.timeFormat)
    }
    
    public static func toggleNetworkActivityInidicator(visible: Bool) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = visible
    }
}