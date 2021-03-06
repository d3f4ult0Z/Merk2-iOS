//
//  ProfileInteractor.swift
//  Merk2
//
//  Created Adrian Jacobo on 13/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ProfileInteractor: ProfileInteractorProtocol {

    weak var presenter: ProfilePresenterProtocol?
    func profile(){
        let def = UserDefaults.standard
        guard let phoneString = def.string(forKey: "phone") else{
            return
        }
        let url = "https://api.latitudmegalopolis.com/functions/test.php"
        let complement = "?keycode=DETAILUSER"
        let params = ["phone" : phoneString]
        
        Services().request(url, complemet: complement, method: .post, params: params, model: ProfileUser.self){response, error in
            if let responseData = response{
                if responseData.success{
                    if let data = responseData.data.first{
                        self.presenter?.profileSucces(data: data, phone: phoneString)
                    }else{
                        self.presenter?.profileError(message: "No se encontraron datos de este perfil")
                    }
                }else{
                    self.presenter?.profileError(message: "No se encontraron datos de este perfil")
                }
            }else{
                self.presenter?.profileError(message: "El servidor no respondio correctamente")
            }
        }
    }
}
