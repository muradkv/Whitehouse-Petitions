//
//  Petition.swift
//  Whitehouse Petitions
//
//  Created by murad on 07/05/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int 
}
