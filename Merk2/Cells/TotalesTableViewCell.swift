//
//  TotalesTableViewCell.swift
//  Merk2
//
//  Created by Gerardo on 07/01/22.
//

import UIKit

class TotalesTableViewCell: UITableViewCell {
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var subtotalCant: UILabel!
    @IBOutlet weak var envio: UILabel!
    @IBOutlet weak var envioCant: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var totalCant: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
