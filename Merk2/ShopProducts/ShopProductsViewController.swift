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
        tableShopProducts.register(UINib(nibName: "shopCart", bundle: nil), forCellReuseIdentifier: "shopCart")
        tableShopProducts.register(UINib(nibName: "TotalesTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalesTableViewCell")
        tableShopProducts.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getProducts()
    }
    func getProducts(){
        let userDefaults = UserDefaults.standard
        if let shoppingCartData = userDefaults.object(forKey: "shoppingCart") as? Data{
            if let shoppingCart = try? JSONDecoder().decode(ProductsCart.self, from: shoppingCartData){
                self.shoping = shoppingCart.cart
                if self.shoping.count != 0{
                    self.tableShopProducts.isHidden = false
                }else{
                    self.tableShopProducts.isHidden = true
                }
                tableShopProducts.reloadData()
            }
        }
    }
}
extension ShopProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return shoping.count
        }else if section == 1 {
            return 1
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            if let buys = tableShopProducts.dequeueReusableCell(withIdentifier: "shopCart") as? shopCart{
                buys.delegate = self
                buys.numOrdenCart.text = "No. de la orden: \(shoping[indexPath.row].id)"
                buys.descripShopCart.text = "Precio por orden: $\(shoping[indexPath.row].precio)"
                buys.productShopCart.text = shoping[indexPath.row].nombre
                buys.data = shoping[indexPath.row]
                if let shopProd = URL(string: shoping[indexPath.row].imagen){
                    buys.iconShoppingcart.af.setImage(withURL: shopProd)
                }
                buys.cantidadShopCart.text = "Cantidad"
                buys.descuentoShopCart.text = "Descuento: \(shoping[indexPath.row].descuento)%"
                buys.numCantShopCart.text = "\(shoping[indexPath.row].cantidad ?? 0)"
                let descuento = (shoping[indexPath.row].descuento as NSString).floatValue
                let cantidad = Float(shoping[indexPath.row].cantidad ?? 0)
                let precio = (shoping[indexPath.row].precio as NSString).floatValue
                let totalConDes = ( precio * (descuento / 100)) * cantidad
                let existencia = (shoping[indexPath.row].existencias as NSString).floatValue
                buys.totalShopping.text = "Descuento:"+" "+"$\(NSString(format: "%.2f",( totalConDes)))"
                if cantidad <= 1 {
                    buys.menosAddCart.backgroundColor = .gray
                    buys.menosAddCart.isEnabled = false
                }else{
                    buys.menosAddCart.backgroundColor = UIColor(displayP3Red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
                    buys.menosAddCart.isEnabled = true
                }
                if cantidad >= existencia {
                    buys.masAddCart.backgroundColor = .gray
                    buys.masAddCart.isEnabled = false
                    buys.menosAddCart.isEnabled = true
                }else{
                    buys.masAddCart.backgroundColor = UIColor(displayP3Red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
                    buys.masAddCart.isEnabled = true
                }
                return buys
            }
        case 1:
            if let totales = tableShopProducts.dequeueReusableCell(withIdentifier: "TotalesTableViewCell") as? TotalesTableViewCell{
                var subTotal:Float = 0
                for i in 0..<shoping.count{
                    let precio = (shoping[i].precio as NSString).floatValue
                    let cantidad = Float(shoping[i].cantidad ?? 0)
                    let descuento = (shoping[i].descuento as NSString).floatValue
                    subTotal += (precio - ( precio * (descuento / 100))) * cantidad
                }
                totales.subtotalCant.text = "$\(NSString(format: "%.2f",(subTotal)))"
                totales.totalCant.text = "$\(NSString(format: "%.2f",(subTotal+10)))"
                return totales
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tableView.beginUpdates()
            shoping.remove(at: indexPath.row)
            if self.shoping.count == 0 {
                self.tableShopProducts.isHidden = true
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            upDateProd()
            self.tableShopProducts.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Borrar"
    }
    func upDateProd(){
        let userDefaults = UserDefaults.standard
        let shoppinCart = ProductsCart(cart: shoping)
        if let encodeCart = try? JSONEncoder().encode(shoppinCart){
            userDefaults.set(encodeCart, forKey: "shoppingCart")
            if shoping.count == 0 {
                self.tabBarItem.badgeValue = nil
            }else{
                self.tabBarItem.badgeValue = "\(shoping.count)"
            }
        }
    }
}
extension ShopProductsViewController:ShopCartDelegate{
    func cleanProduct(cell: UITableViewCell) {
        self.tableShopProducts.indexPath(for: cell)
        if let indexPath = self.tableShopProducts.indexPath(for: cell){
            tableShopProducts.beginUpdates()
            shoping.remove(at: indexPath.row)
            if self.shoping.count == 0 {
                self.tableShopProducts.isHidden = true
            }
            tableShopProducts.deleteRows(at: [indexPath], with: .automatic)
            tableShopProducts.endUpdates()
            upDateProd()
            self.tableShopProducts.reloadData()
        }
    }
    func saveNewCant(_ newCantidad: Int, data: DataProducts?) {
        let userDefault = UserDefaults.standard
        guard let product = data else{
            return
        }
        if let newCant = userDefault.object(forKey: "shoppingCart") as? Data{
            if var newCellCant = try? JSONDecoder().decode(ProductsCart.self, from:newCant){
                for i in 0..<newCellCant.cart.count{
                    if newCellCant.cart[i].id == product.id{
                        print("Posicion pulsada \(i)")
                        newCellCant.cart[i].cantidad = newCantidad
                        break
                    }
                }
                self.shoping = newCellCant.cart
                if let encodeCart = try? JSONEncoder().encode(newCellCant){
                    userDefault.set(encodeCart, forKey: "shoppingCart")
                    tableShopProducts.reloadData()
                }else{
                    print("el carrito no se pudo guardar")
                }
            }else{
                print("no hay productos en el carrito")
            }
        }
    }
}
