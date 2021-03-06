//
//  DetailStoreRouter.swift
//  Merk2
//
//  Created Gerardo on 12/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailStoreRouter: DetailStoreWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(data: StoreData) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = DetailStoreViewController(nibName: nil, bundle: nil)
        let interactor = DetailStoreInteractor()
        let router = DetailStoreRouter()
        let presenter = DetailStorePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        view.data = data
        
        return view
    }
    func navigateDetProd(data: DataProducts){
        let detProduct = DetailProductRouter.createModule(data: data)
        viewController?.navigationController?.pushViewController(detProduct, animated: true)
    }
}
