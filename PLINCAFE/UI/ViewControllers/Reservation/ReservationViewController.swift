//
//  ReservationViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 29.09.2023.
//

import UIKit

class ReservationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var senderNameText: String = ""
    var senderButtonDate: String = ""
    var senderTimeText: String = ""
    var senderNumberPeopleText: String = ""
    var senderNumberPhoneText: String = ""
    var senderTable: Int = 0

    
    private var datePicker: UIDatePicker?
    weak var previousButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        hideKeyBoardWhenTappedAround()
        settingsDateTextField()
    }

    @IBAction func onReservationListButtonClick(_ sender: Any) {
        navigationController?.pushViewController(MyReservationViewController(), animated: true)
    }
    

    @IBAction func onResrveButtonClick(_ sender: Any) {
        if let nameText = nameTextField.text {
            senderNameText = nameText
        }
        if let nameText = timeTextField.text {
            senderTimeText = nameText
        }
        if let nameText = numberOfPeopleTextField.text {
            senderNumberPeopleText = nameText
        }
        if let nameText = phoneNumberTextField.text {
            senderNumberPhoneText = nameText
        }
        
        if senderNameText == "" || senderTimeText == "" || senderButtonDate == "" || senderNumberPeopleText == "" || senderNumberPhoneText == "" || senderTable == 0 {
            callAlertController(textAlert: "Fill in the field.")
        } else {
            callAlertController(textAlert: "The table has been successfully brooked")
            UserDefaults.standard.setValue(senderNameText, forKey: "senderNameText")
            UserDefaults.standard.setValue(senderButtonDate, forKey: "senderButtonDate")
            UserDefaults.standard.setValue(senderTimeText, forKey: "senderTimeText")
            UserDefaults.standard.setValue(senderNumberPeopleText, forKey: "senderNumberPeopleText")
            UserDefaults.standard.setValue(senderNumberPhoneText, forKey: "senderNumberPhoneText")
            UserDefaults.standard.setValue(senderTable, forKey: "senderTable")
        }
    }
    
    
    @IBAction func onReserveTableButtonClick(_ sender: UIButton) {
        if previousButton != nil {
            previousButton?.setImage(UIImage(named: NameImage.tableReservation.rawValue), for: .normal)
        }
        sender.setImage(UIImage(named: NameImage.tableReservationActive.rawValue), for: .normal)
        senderTable = sender.tag
        previousButton = sender
    }
    
    //MARK: -  Реализация  DatePicker и TextField
    //Настройки DatePicker
    func settingsDateTextField() {
        datePicker = UIDatePicker()
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.locale = Locale.init(identifier: "en")
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        
        dateTextField.inputView = datePicker
    }
    
    //@objc методы
    // Метод обновления даты
    @objc func dateChange(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        senderButtonDate = dateFormatter.string(from: datePicker.date)
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    //MARK: - AlertController для предупреждений
    func callAlertController(textAlert: String) {
        let alertController = UIAlertController(title: textAlert, message: "", preferredStyle: .alert)
        
        let alertButton = UIAlertAction(title: "OK", style: .default) { (alert) in
            print("alert is cloused")
        }
        
        alertController.addAction(alertButton)
        self.present(alertController, animated: true, completion: nil)
    }

    
    // скрытие клавиатуры
    private func hideKeyBoardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


}
