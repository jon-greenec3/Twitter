//
//  User.swift
//  TwitterDemo
//
//  Created by Windell Greene on 2/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    
    var dictionary: NSDictionary?
    
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["name"] as? String
        
        let profileUrlString = dictionary["name"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        
        tagline = dictionary["name"] as? String
    }
    static let userDidLogoutNotification = "UserDidLogout"
    
    static var _currentUser: User?
    class var currentUser: User? {
        get {
            if _currentUser == nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let userData = defaults.objectForKey("currentUserData") as? NSData
        
            if let userData = userData {
                let dictionary = try! NSJSONSerialization.dataWithJSONObject(userData, options: []) as! NSDictionary
                _currentUser = User(dictionary: dictionary)
                }
                
                
            }
            
            return _currentUser
        
        }
        set(user) {
            let defaults = NSUserDefaults.standardUserDefaults()
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            
            defaults.setObject(user, forKey: "currentUser")
            
            defaults.synchronize()
        }

                
        
        
        }
    

}
