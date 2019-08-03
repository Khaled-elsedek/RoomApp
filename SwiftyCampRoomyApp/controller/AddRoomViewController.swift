//
//  AddRoomVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/20/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class AddRoomViewController : UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleTxtField: UITextField!
    @IBOutlet private weak var placeTxtField: UITextField!
    @IBOutlet private weak var priceTxtField: UITextField!
    @IBOutlet private weak var descriptionTxtField: UITextField!
    
    var pickerImage: UIImage?{
        didSet{
            imageView.image = pickerImage
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(msgerror:String = "complete all fields"){
        let alert = UIAlertController(title: "error", message: msgerror, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func addImageBtnWasPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction private func addRoomBtnWasPRessed(_ sender: Any) {
        guard let title = titleTxtField.text , titleTxtField.text != "" else { showAlert(); return}
        guard let place = placeTxtField.text , placeTxtField.text != "" else {return showAlert()}
        guard let price = priceTxtField.text , priceTxtField.text != "" else {return showAlert()}
        guard let description = descriptionTxtField.text , descriptionTxtField.text != "" else {return showAlert()}
        AddRooms.addRoom(title: title, price: price, place: place, description: description) { (error, success, errormsg) in
            if success {
                if errormsg != "" {
                    self.showAlert(msgerror: errormsg)
                } else if errormsg == ""{
                    let st = UIStoryboard(name: "Main", bundle: nil)
                    let vc = st.instantiateViewController(withIdentifier: "HomeScreen")
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                self.showAlert(msgerror: "connection failed unaple to add the room please try again")
            }
        }
    }
}

extension AddRoomViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.pickerImage = editedImage
        }else if let  originalImage = info[UIImagePickerController.InfoKey.originalImage]as? UIImage {
            self.pickerImage = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

