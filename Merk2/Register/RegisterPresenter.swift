//
//  RegisterPresenter.swift
//  Merk2
//
//  Created Adrian Jacobo on 07/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RegisterPresenter: RegisterPresenterProtocol {
    func register(user: String, name: String, phone: String, mail: String,pass: String) {
        interactor?.register(user: user, name: name, phone: phone, mail: mail, pass: pass)
    }
    
    func registerSucces(message: String) {
        view?.registerSucces(message: message)
    }
    
    func registerError(message: String) {
        view?.registerError(message: message)
    }
    

    weak private var view: RegisterViewProtocol?
    var interactor: RegisterInteractorProtocol?
    private let router: RegisterWireframeProtocol

    init(interface: RegisterViewProtocol, interactor: RegisterInteractorProtocol?, router: RegisterWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}