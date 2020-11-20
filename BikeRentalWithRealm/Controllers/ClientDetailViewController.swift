//
//  ClientDetailViewController.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 22.10.2020.
//

import UIKit

class ClientDetailViewController: UIViewController {

    
    @IBOutlet weak var clientNameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passportNumberTextField: UITextField!
    
    @IBOutlet weak var dateOfRentalTextField: UITextField!
    
  //  @IBOutlet weak var datePicker: UIDatePicker!
    
    var clientCell = ClientsTableViewCell()
    var items = ClientsStore()
    var client = Clients()
    var validate = FieldsValidate()
    override func viewDidLoad() {
        super.viewDidLoad()
        items.printURL()
    }
    
//    override func viewWillAppear(_: Bool) {
//        super.viewWillAppear(true)
//        items.fetchAllClients()
//
//        clientsTable?.reloadData()   // ...and it is also visible here.
//    }
    
    let pickerView = UIDatePicker()
    
    @IBAction func addNewClientBtnTapped(_ sender: Any) {
        
        guard let name = clientNameTextField.text,
              let phone = phoneNumberTextField.text,
              let passport = passportNumberTextField.text,
              let rentalDate = dateOfRentalTextField.text,
              name != "",
              phone != "",
              passport != "",
              rentalDate != "",
             // validate.isValidPhoneNumber(phoneNumber: phone) == true,
              validateDate(date: rentalDate)
        else {
            return
        }
        
        if validate.isValidPhoneNumber(phoneNumber: phone) == true {
        let newClient = items.createNewClient(name, phone: phone, passport: passport, dateOfRental: pickerView.date)
        items.saveClient(newClient)
        }
        else {
            validate.showAlert(title: "Error", message: "Number is not correct")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func setDate(_ sender: Any) {
        createPickerView()
        
    }
    
    func createPickerView() {
        //pickerView.delegate = self
        view.addSubview(pickerView)
        dateOfRentalTextField.inputView = pickerView
        dismissPickerView()
    }
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.actionForDissmissPicker))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        dateOfRentalTextField.inputAccessoryView = toolBar

    }
    
    @objc func actionForDissmissPicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        dateOfRentalTextField.text = dateFormatter.string(from: (pickerView.date))
        dateOfRentalTextField.resignFirstResponder()
        
        view.endEditing(true)
    }
    
    
    
    func setupPicker() {
        dateOfRentalTextField.inputView = pickerView
        // This line prevents a crash related to using the date picker in place of the keyboard
        pickerView.removeFromSuperview()
        pickerView.minimumDate = NSDate() as Date
        pickerView.maximumDate = maximumDate
    }

    var maximumDate: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    }
    
    func validateDate(date: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        if let date = dateFormatter.date(from: date)
        {
            print("true date:\(date)")
            return true
        }
        else
        {
            print("wrong date")
            return false
        }
    }
    

}
