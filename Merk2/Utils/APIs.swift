//
//  APIs.swift
//  Merk2
//
//  Created by Adrian Jacobo on 28/10/21.
//

import Foundation

class APIs{
    
    static var enviroment:Enviroment = .prod
    
    enum Enviroment{
        case dev
        case prod
    }
    enum URLService{
        case general
        case login
    }

    func getURL(type:URLService) -> String{
        if APIs.enviroment == .dev{
            switch type {
            case .general:
                return "https://api.latitudmgalopolis.com/functions/test.php"
            case .login:
                return "?keycode=LOGINPOST"
            }
        }else{
            switch type {
            case .general:
                return "https://api.merk2.com/functions/test.php"
            case .login:
                return "?keycode=LOGINPOST"
            }
        }
    }
}
