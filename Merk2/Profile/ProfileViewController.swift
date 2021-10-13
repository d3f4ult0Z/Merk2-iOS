//
//  ProfileViewController.swift
//  Merk2
//
//  Created Adrian Jacobo on 13/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewProtocol {
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var close: UIButton!
    
    
	var presenter: ProfilePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    @IBAction func close(_ sender: Any) {
        presenter?.navigateGoToLogin()
        let det = UserDefaults.standard
        det.set(nil, forKey: "phone")
        }
        
    func configUI(){
        imagen.layer.cornerRadius = imagen.frame.height / 2
        close.layer.cornerRadius = close.frame.height / 2
    }
}
