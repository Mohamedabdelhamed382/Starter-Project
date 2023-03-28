//
//  Constant.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 27/03/2023.
//

import Foundation
enum Constant {
    case baseURl
    
    var url: String {
        switch self {
        case .baseURl:
            return "https://api.unsplash.com/photos/?client_id=Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
        }
    }
}
