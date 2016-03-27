//
//  DataServices.swift
//  DevslopeShowcase
//
//  Created by SEBASTIEN MONTIBELLER on 27/03/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://facebooklikeapp.firebaseio.com")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}