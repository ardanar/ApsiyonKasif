//
//  Login.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 23.07.2024.
//

import Foundation

class Login: Codable{
    
    var email: String?
    var password: String?
    
    init(){
        
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
