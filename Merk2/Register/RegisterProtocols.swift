//
//  RegisterProtocols.swift
//  Merk2
//
//  Created Adrian Jacobo on 07/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol RegisterWireframeProtocol: AnyObject {
}
//MARK: Presenter -
protocol RegisterPresenterProtocol: AnyObject {
    func register(user:String,name:String,phone:String,mail:String,pass:String)
    func registerSucces(message:String)
    func registerError(message:String)

}

//MARK: Interactor -
protocol RegisterInteractorProtocol: AnyObject {

  var presenter: RegisterPresenterProtocol?  { get set }
    func register(user:String,name:String,phone:String,mail:String,pass:String)
    
}

//MARK: View -
protocol RegisterViewProtocol: AnyObject {

  var presenter: RegisterPresenterProtocol?  { get set }
    func registerSucces(message:String)
    func registerError(message:String)
}
