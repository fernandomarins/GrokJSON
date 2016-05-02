//
//  MainViewController.swift
//  GrokJSON
//
//  Created by Fernando Augusto de Marins on 02/05/16.
//  Copyright © 2016 FernandoMarins. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = NSURL(string: Constants().todoEndpoint) else {
            
            performUIUpdatesOnMain() {
                self.alertViewWithTitle("Error!", message: "Cannot create URL.")
            }
            
            return
        }
        
        let urlRequest = NSURLRequest(URL: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) in
            
            // check for any errors
            guard error == nil else {
                
                performUIUpdatesOnMain() {
                    self.alertViewWithTitle("Error!", message: "It was not possible to call GET on /todos/1")
                }
                
                print(error)
                return
            }
            
            // make sure we got data
            guard let responseData = data else {
                
                performUIUpdatesOnMain() {
                    self.alertViewWithTitle("Error!", message: "Did not receive data.")
                }
                
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let todo = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as? [String: AnyObject] else {
                    
                    performUIUpdatesOnMain() {
                        self.alertViewWithTitle("Error!", message: "Cannot convert data to JSON.")
                    }
                    
                    return
                }
                
                // now we have the todo, let's just print it to prove we can access it
                print("The todo is: " + todo.description)
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                guard let todoTitle = todo["title"] as? String else {
                    performUIUpdatesOnMain() {
                        self.alertViewWithTitle("Error!", message: "Could not get todo title from JSON.")
                    }

                    return
                }
                
                print("The title is: " + todoTitle)
                
            } catch  {
                performUIUpdatesOnMain() {
                    self.alertViewWithTitle("Error!", message: "Cannot convert data to JSON.")
                }
                
                return
            }
        }
        
        task.resume()
        
    }
    
    
    
    
}

