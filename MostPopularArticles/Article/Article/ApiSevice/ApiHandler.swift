//
//  ApiHandler.swift
//  Article
//
//  Created by Rakesh Kumar Sharma on 27/03/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import UIKit
import Alamofire

class ApiHandler : NSObject {
    
   static func getArticlesArrayFromResponse(success:@escaping (_ articleArray:[Article])-> Void, failure:@escaping (_ errorMessageCode:String) -> Void) {
        
        let requestUrlString = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=taB7ZYx9Nz74MEGCPxxL23qLY4wp81Nj"
   
        
        Alamofire.request(requestUrlString, method: .get).responseJSON { response in
            print(response.request as Any)
            print(response.response as Any)
            print(response.result.value as Any)
            
            if let JSON = response.result.value as? NSDictionary {
                let articleDataLayer = ArticlesDataLayer()
                let articleArray = articleDataLayer.getArticles(responseObject: JSON)
                success(articleArray)
            }
            else {
                failure((response.error?.localizedDescription)!)
            }
        }
       
    }

}
