//
//  ShopProductsViewController.swift
//  Merk2
//
//  Created Gerardo on 25/11/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import AlamofireImage

class ShopProductsViewController: UIViewController, ShopProductsViewProtocol {
	var presenter: ShopProductsPresenterProtocol?
    var shoping: [DataProducts] = []
    @IBOutlet weak var tableShopProducts: UITableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        tableShopProducts.delegate = self
        tableShopProducts.dataSource = self
        tableShopProducts.register(UINib(nibName: "Products", bundle: nil), forCellReuseIdentifier: "Products")
        tableShopProducts.reloadData()
    }
}
extension ShopProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoping.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let buys = tableShopProducts.dequeueReusableCell(withIdentifier: "products") as? products{
            buys.title.text = shoping[indexPath.row].nombre
            buys.content.text = shoping[indexPath.row].descripcion
            buys.price.text = shoping[indexPath.row].precio
            if let shopProd = URL(string: shoping[indexPath.row].imagen){
                buys.imaproducts.af.setImage(withURL: shopProd)
            }
            return buys
        }
        return UITableViewCell()
    }
}

