//
//  InventarioViewController.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 3/4/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import MessageUI

class InventarioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CNContactPickerDelegate, MFMessageComposeViewControllerDelegate {
    
    var timerREST: Timer!
    var itemsDisponibles: [ItemTienda] = []
    var itemsComprados: [ItemTienda] = []
    var currentItems: [ItemTienda] = []
    
    let contactPicker: CNContactPickerViewController = CNContactPickerViewController()
    
    @IBOutlet weak var tablaDeItems: UITableView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var tipoInventario: UISegmentedControl!
    @IBAction func cambiarTipoInventario(_ sender: Any) {
        congelarTiempo()
    }
    @IBAction func compartir(_ sender: Any) {
        self.present(contactPicker, animated: true, completion: nil)
    }
    @IBAction func compartirWhatsapp(_ sender: Any) {
        let msg = "Mensaje de Prueba Whatsapp"
        let url = "whatsapp://send?text=\(msg)"
        if let url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: url) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.open(whatsappURL, options: [:], completionHandler: {(completed: Bool) in
                    })
                } else {
                    print("No se puede abrir whatsapp, quizá no está instalado")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: ViewDidLoad")
        contactPicker.delegate = self
        prepareData()
        congelarTiempo()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("ViewController: DidReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }
    
    func prepareData () {
        self.itemsDisponibles = GlobalVariables.sharedInstance.itemsDisponibles
        self.itemsComprados = GlobalVariables.sharedInstance.itemsComprados
        currentItems = itemsDisponibles
    }
    
    func congelarTiempo() {
        loadingSpinner.startAnimating()
        timerREST = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(reDrawTable), userInfo: nil, repeats: false)
    }
    
    func reDrawTable() {
        loadingSpinner.stopAnimating()
        if tipoInventario.selectedSegmentIndex == ConstantsSegmented().Disponible {
            currentItems = itemsDisponibles
        } else if tipoInventario.selectedSegmentIndex == ConstantsSegmented().Comprado {
            currentItems = itemsComprados
        }
        self.tablaDeItems.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = nil
        if currentItems[indexPath.row].imagen != nil {
            imageView.image = currentItems[indexPath.row].imagen!
        }
        
        let labelNombre: UILabel = cell.viewWithTag(2) as! UILabel
        labelNombre.text = currentItems[indexPath.row].nombre!
        
        let labelPrecio: UILabel = cell.viewWithTag(3) as! UILabel
        labelPrecio.text = currentItems[indexPath.row].precio!
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        picker.dismiss(animated: true) {
            self.sendSMS(contact: contact)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case  .sent:
            print ("Message Sent")
        case .failed:
            print("Message Failed")
        case .cancelled:
            print("Message Cancelled")
        }
        self.dismiss(animated: true)
    }
    
    func sendSMS(contact: CNContact) {
        if !MFMessageComposeViewController.canSendText() {
            print("No es posible enviar mensajes desde este dispositivo")
            self.showAlert(title: "Error", message: "No es posible enviar mensajes desde este dispositivo", closeButtonTitle: "Aceptar")
            return
        }
        if contact.phoneNumbers.count > 0 {
            let recipients: [String] = [contact.phoneNumbers[0].value.stringValue]
            let messageController: MFMessageComposeViewController = MFMessageComposeViewController()
            messageController.messageComposeDelegate = self
            messageController.recipients = recipients
            messageController.body = "Mensaje de prueba"
            
            self.present(messageController, animated: true, completion: nil)
        } else {
            print("El contacto no tiene números telefónicos")
        }
    }
    
    func showAlert(title:String, message:String, closeButtonTitle:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: closeButtonTitle, style: .default) { (action: UIAlertAction) in
            //Ejecutar algún código al pulsar esta opción.
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true) { }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
