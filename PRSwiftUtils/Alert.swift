//
//  Alert.swift
//  SVTIMovil
//
//  Created by Pedro on 27-05-16.
//  Copyright © 2016 SVTI. All rights reserved.
//

import Foundation
import UIKit

public class Alert {
    public static func showAlertController(context:UIViewController, title: String, message: String, retryHandler: ((UIAlertAction) -> Void)?, acceptHandler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Accept", style: .Default, handler: acceptHandler))
        
        if retryHandler != nil {
            alertController.addAction(UIAlertAction(title: "Retry", style: .Default, handler: retryHandler))
        }
        //Utils.getAppDelegate().currentAlertController = alertController
        context.presentViewController(alertController, animated: true, completion: nil)
    }
    
    public static func showErrorAlertController(context:UIViewController, message: String) {
        showAlertController(context, title: "Error", message: message, retryHandler: nil, acceptHandler: nil)
    }
    
    public static func showInfoAlertController(context:UIViewController,  title: String, message: String) {
        showAlertController(context, title: title, message: message, retryHandler: nil, acceptHandler: nil)
    }
    
    public static func showInfoAlertControllerWithDismissCompletionHandler(context:UIViewController,  title: String, message: String, acceptHandler: ((UIAlertAction) -> Void)?) {
        showAlertController(context, title: title, message: message, retryHandler: nil, acceptHandler: acceptHandler)
    }
    
    public static func presentError(context:UIViewController, message: String?, retryHandler: ((UIAlertAction) -> Void)?, acceptHandler: ((UIAlertAction) -> Void)?) {
        let displayMessage:String
        if (message != nil) {
            displayMessage = message!
        }
        else {
            displayMessage = "Something went wrong"
        }
        showAlertController(context, title: "Error", message: displayMessage, retryHandler: retryHandler, acceptHandler: acceptHandler)
    }
    
    public static func presentUnknownError(context:UIViewController) {
        Alert.presentError(context, message: nil, retryHandler: nil, acceptHandler: nil)
    }
}
