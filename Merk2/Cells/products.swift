//
//  products.swift
//  Merk2
//
//  Created by Gerardo on 11/10/21.
//

import UIKit

class products: UITableViewCell {
    @IBOutlet weak var imaproducts: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
