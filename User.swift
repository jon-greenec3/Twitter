//
//  User.swift
//  Twitter2
//
//  Created by Jacob Hughes on 2/21/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: NSString?
    var screenname: NSString?
    var profileURL: NSURL?
    var tagLine: NSString?
    var bannerImageURL: NSURL?
    var followersCount: Int?
    var followingCount: Int?
    var tweetCount: Int?
    var dictionary: NSDictionary?
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        
        followersCount = dictionary["followers_count"] as? Int
        followingCount = dictionary["friends_count"] as? Int
        tweetCount = dictionary["statuses_count"] as? Int
        
        
        
        
        let profileURLString = dictionary["profile_image_url_https"] as? String
        if let profileURLString = profileURLString{
            profileURL = NSURL(string: profileURLString)
            
        } ;if let bannerURLString = dictionary["profile_banner_url"] as? String {
            bannerImageURL = NSURL(string: bannerURLString)
        }

        
        
        tagLine = dictionary["description"] as? String
    }
    static var _currentUser: User?
    class var currentUser: User? {
        get {
        if _currentUser == nil{
        let defaults = NSUserDefaults.standardUserDefaults()
        let userData = defaults.objectForKey("currentUserData") as? NSData
        
        if let userData = userData{
        let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
        _currentUser = User(dictionary: dictionary)
        
        }
        }
        
        return _currentUser
        
        }
        
        
        set (user){
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            if let user = user{
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            }
            else{
                defaults.setObject(nil, forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }
    
}
