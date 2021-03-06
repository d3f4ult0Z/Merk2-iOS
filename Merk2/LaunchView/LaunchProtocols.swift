//
//  LaunchProtocols.swift
//  Merk2
//
//  Created Adrian Jacobo on 06/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LaunchWireframeProtocol: AnyObject {
    func goToLogin()
    func goToHome()
}
//MARK: Presenter -
protocol LaunchPresenterProtocol: AnyObject {
    func goToLogin()
    func goToHome()
}

//MARK: Interactor -
protocol LaunchInteractorProtocol: AnyObject {

  var presenter: LaunchPresenterProtocol?  { get set }
}

//MARK: View -
protocol LaunchViewProtocol: AnyObject {

  var presenter: LaunchPresenterProtocol?  { get set }
}
