//
//  GCD.swift
//  GrokJSON
//
//  Created by Fernando Augusto de Marins on 02/05/16.
//  Copyright © 2016 FernandoMarins. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(updates: () -> Void) {
    dispatch_async(dispatch_get_main_queue()) {
        updates()
    }
}