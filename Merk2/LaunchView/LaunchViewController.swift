//
//  LaunchViewController.swift
//  Merk2
//
//  Created Adrian Jacobo on 06/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LaunchViewController: UIViewController, LaunchViewProtocol {

	var presenter: LaunchPresenterProtocol?
    
    @IBOutlet weak var iconLauncher: UIImageView!
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.iconLauncher.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }, completion: {_ in
            self.presenter?.goToHome()
//        }, completion: { _ in
//            let def = UserDefaults.standard
//            if let _ = def.string(forKey: "phone"){
//                self.presenter?.goToHome()
//            }else{
//                self.presenter?.goToLogin()
//            }
        })
    }
}
  
