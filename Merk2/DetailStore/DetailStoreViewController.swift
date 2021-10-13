//
//  DetailStoreViewController.swift
//  Merk2
//
//  Created Gerardo on 12/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailStoreViewController: UIViewController, DetailStoreViewProtocol, UITableViewDelegate, UITableViewDataSource {
    var presenter: DetailStorePresenterProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let products = tableView.dequeueReusableCell(withIdentifier: "products") as? products{
            products.title.text = product[indexPath.row]
            products.content.text = subproduct[indexPath.row]
            products.price.text = "Abierto de:\(price[indexPath.row])"
            return products
        }
        return UITableViewCell()
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        TabDescripProcucts.delegate = self
        TabDescripProcucts.dataSource = self
        TabDescripProcucts.register(UINib(nibName: "products", bundle: nil), forCellReuseIdentifier: "products")
        TabDescripProcucts.reloadData()
        name.text = nombre
        clas.text = categoria
        time.text = horario
    }
    @IBAction func botonregresa(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var TabDescripProcucts: UITableView!
    var nombre: String?, categoria: String?,horario: String?
    let product:[String] = [
    "Cafeteria","Dulceria","Merceria","Panaderia","Cafeteria","Dulceria","Merceria","Panaderia","Cafeteria","Dulceria","Merceria","Panaderia","Cafeteria","Dulceria","Merceria","Panaderia"]
    let subproduct:[String] = ["Cafe,té, malteadas y más","Bollos, pan de dulce ,pasteles y más","Gomitas, chocolates, palomitas y más","Desechables, regalos juguetes y más","Cafe,té, malteadas y más","Bollos, pan de dulce ,pasteles y más","Gomitas, chocolates, palomitas y más","Desechables, regalos juguetes y más","Cafe,té, malteadas y más","Bollos, pan de dulce ,pasteles y más","Gomitas, chocolates, palomitas y más","Desechables, regalos juguetes y más","Cafe,té, malteadas y más","Bollos, pan de dulce ,pasteles y más","Gomitas, chocolates, palomitas y más","Desechables, regalos juguetes y más"]
    let price:[String] = [" 5 a 9"," 6 a 10"," 3 a 5"," 7 a 9"," 5 a 9"," 6 a 10"," 3 a 5"," 7 a 9"," 5 a 9"," 6 a 10"," 3 a 5"," 7 a 9"," 5 a 9"," 6 a 10"," 3 a 5"," 7 a 9"]
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var clas: UILabel!
    
    @IBOutlet weak var time: UILabel!
}
