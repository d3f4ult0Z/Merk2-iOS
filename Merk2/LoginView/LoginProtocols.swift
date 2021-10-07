//
//  LoginProtocols.swift
//  Merk2
//
//  Created Adrian Jacobo on 06/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: AnyObject {
    func navigateRegister()
    func navigateHome()
}
//MARK: Presenter -
protocol LoginPresenterProtocol: AnyObject {
    func login(phone:String, pass:String)
    func loginSucces(message:String)
    func loginError(message:String)
    func navigateRegister()
    func navigateHome()
}

//MARK: Interactor -
protocol LoginInteractorProtocol: AnyObject {

  var presenter: LoginPresenterProtocol?  { get set }
    func login(phone:String, pass:String)
}

//MARK: View -
protocol LoginViewProtocol: AnyObject {

  var presenter: LoginPresenterProtocol?  { get set }
    func loginSucces(message:String)
    func loginError(message:String)
}