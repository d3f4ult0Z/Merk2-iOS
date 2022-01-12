//
//  shoppingCart.swift
//  Merk2
//
//  Created by Gerardo on 21/12/21.
//

import UIKit

protocol ShopCartDelegate:AnyObject{
    func saveNewCant(_ newCantidad:Int, data:DataProducts?)
    func cleanProduct(cell: UITableViewCell)
}

class shopCart: UITableViewCell {
    @IBOutlet weak var iconShoppingcart: UIImageView!
    @IBOutlet weak var numOrdenCart: UILabel!
    @IBOutlet weak var productShopCart: UILabel!
    @IBOutlet weak var descripShopCart: UILabel!
    @IBOutlet weak var descuentoShopCart: UILabel!
    @IBOutlet weak var cantidadShopCart: UILabel!
    @IBOutlet weak var menosAddCart: UIButton!
    @IBOutlet weak var masAddCart: UIButton!
    @IBOutlet weak var numCantShopCart: UITextField!
    @IBOutlet weak var totalShopping: UILabel!
    @IBOutlet weak var closeBotton: UIButton!
    
    var data : DataProducts?
    var delegate : ShopCartDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configBotons()
        numCantShopCart.isEnabled = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configBotons(){
        menosAddCart.layer.cornerRadius = menosAddCart.frame.height/2
        menosAddCart.backgroundColor = .gray
        menosAddCart.isEnabled = false
        masAddCart.layer.cornerRadius = masAddCart.frame.height/2
        masAddCart.backgroundColor = UIColor(displayP3Red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
        closeBotton.layer.cornerRadius = closeBotton.frame.height/2
        closeBotton.backgroundColor = UIColor(displayP3Red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
    }

    @IBAction func menosShopCartBotton(_ sender: Any) {
        var cantNewNum:Int = Int(numCantShopCart.text ?? "0") ?? 0
        cantNewNum -= 1
        if cantNewNum == 1 {
            menosAddCart.isEnabled = false
            menosAddCart.backgroundColor = .gray
        }else{
            masAddCart.isEnabled = true
            masAddCart.backgroundColor = UIColor(displayP3Red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
        }
        numCantShopCart.text = "\(cantNewNum)"
        self.delegate?.saveNewCant(cantNewNum, data: data)
    }
    
    
    @IBAction func masShopCartBotton(_ sender: Any) {
        let existen:Int = Int(data?.existencias ?? "0") ?? 0
        var cantNewNum:Int = Int(numCantShopCart.text ?? "0") ?? 0
        cantNewNum += 1
        if cantNewNum == existen {
            masAddCart.isEnabled = false
            masAddCart.backgroundColor = .gray
        }else{
            menosAddCart.isEnabled = true
            menosAddCart.backgroundColor = UIColor(displayP3Red: 5/255, green: 197/255, blue: 216/255, alpha: 1)
        }
        numCantShopCart.text = "\(cantNewNum)"
        self.delegate?.saveNewCant(cantNewNum, data: data)
    }
    @IBAction func closeBoton(_ sender: Any) {
        delegate?.cleanProduct(cell: self)
    }
}

