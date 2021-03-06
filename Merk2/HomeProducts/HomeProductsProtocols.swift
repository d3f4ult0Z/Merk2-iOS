//
//  HomeProductsProtocols.swift
//  Merk2
//
//  Created Adrian Jacobo on 07/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol HomeProductsWireframeProtocol: AnyObject {
    func navigateDetailStore(data:StoreData)
}
//MARK: Presenter -
protocol HomeProductsPresenterProtocol: AnyObject {
    func navigateDetailStore(data:StoreData)
    func DataProducts()
    func StoreProducts(arreglo:[StoreData])
    func StoreProductserror(message:String)
}

//MARK: Interactor -
protocol HomeProductsInteractorProtocol: AnyObject {

    var presenter: HomeProductsPresenterProtocol?  { get set }
    func DataProducts()
}

//MARK: View -
protocol HomeProductsViewProtocol: AnyObject {

    var presenter: HomeProductsPresenterProtocol?  { get set }
    func StoreProducts(arreglo:[StoreData])
    func StoreProductserror(message:String)
}

