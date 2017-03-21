//
//  ViewController.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 12/02/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBAction func gotoTestView(_ sender: UIButton) {
        //checkUserCredentials()
        redirectSegue(name: "Diego")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: ViewDidLoad")

        self.textUsername.delegate = self;
        self.textPassword.delegate = self
        closeKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("ViewController: DidReceiveMemoryWarning")
    }
    
    func checkUserCredentials() {
//        manager.get("/login", parameters: nil, progress: { (progress) in }, success: { (task: URLSessionDataTask, response) in
//            let arrayResponse: NSArray = response! as! NSArray
//            self.validateLoginInfo(array: arrayResponse)
//        }) { (task: URLSessionDataTask?, error: Error) in
//            self.showAlert(title: "Error inesperado", message: "Ha ocurrido un error validando la información de autenticación. Por favor intente nuevamente", closeButtonTitle: "Aceptar")
//        }
    }
    
    func validateLoginInfo(array: NSArray) {
        for item in array {
            let currentUser: Usuario = Usuario(item as! Dictionary<String, AnyObject>)
            if currentUser.username == textUsername.text && currentUser.password == textPassword.text{
                redirectSegue(name: currentUser.nombre!)
                break
            }
        }
        showAlert(title: "Error de autenticación", message: "Usuario y/o contraseña incorrectos. Intente nuevamente", closeButtonTitle: "Aceptar")
    }
    
    func redirectSegue(name: String) {
        performSegue(withIdentifier: "gotoTestView", sender: name)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoTestView" {
            let navDestination = segue.destination as! UINavigationController
            let controller: TestViewController = navDestination.topViewController as! TestViewController
            controller.texto = sender as? String
        }
    }
    
    
    //----Error Modal----
    func showAlert(title:String, message:String, closeButtonTitle:String) {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: closeButtonTitle, style: .default) { (action: UIAlertAction) in
            //Ejecutar algún código al pulsar esta opción.
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true) { }
    }
    
    //----Keyboard dismissing----
    func closeKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField.tag == 1 {
            checkUserCredentials()
        }
        return false
    }
    
}

