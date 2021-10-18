//
//  SearchRouter.swift
//  Merk2
//
//  Created Adrian Jacobo on 13/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SearchRouter: SearchWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SearchViewController(nibName: nil, bundle: nil)
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
