//
//  DetailStorePresenter.swift
//  Merk2
//
//  Created Gerardo on 12/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailStorePresenter: DetailStorePresenterProtocol {

    weak private var view: DetailStoreViewProtocol?
    var interactor: DetailStoreInteractorProtocol?
    private let router: DetailStoreWireframeProtocol

    init(interface: DetailStoreViewProtocol, interactor: DetailStoreInteractorProtocol?, router: DetailStoreWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
