//
//  LoginViewController.swift
//  Merk2
//
//  Created Adrian Jacobo on 06/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

	var presenter: LoginPresenterProtocol?
    
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        iconView.layer.cornerRadius = iconView.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let phoneStr = phoneTextField.text else{
            return
        }
        guard let passStr = passTextField.text else{
            return
        }
        
        if phoneStr == "" || passStr == ""{
            let alert = UIAlertController(title: "Error", message: "Favor de capturar usuario y contraseña", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }else if phoneStr.count != 10{
            let alert = UIAlertController(title: "Error", message: "El teléfono debe tener 10 dígitos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continua", style: .default, handler: nil))
            self.present(alert, animated: true, completion:nil )
        
        }
                    
        else{
            if let _ = Int(phoneStr){
                loginView.isHidden = false
                presenter?.login(phone: phoneStr, pass: passStr)
            }else{
                let alert = UIAlertController(title: "ERROR", message: "El teléfono debe contener solo numeros", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func newUserAction(_ sender: UIButton) {
        presenter?.navigateRegister()
    }
    
    func loginSucces(message:String){
        loginView.isHidden = true
        let alert = UIAlertController(title: "¡Exito!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: { _ in
            //ir a la siguiente vista
            if let phoneStr = self.phoneTextField.text{
                let def = UserDefaults.standard
                def.set(phoneStr, forKey: "phone")
            }
            self.presenter?.navigateHome()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginError(message:String){
        loginView.isHidden = true
        let alert = UIAlertController(title: "¡Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
