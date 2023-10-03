//
//  MyReservationViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 03.10.2023.
//

import UIKit

class MyReservationViewController: UIViewController {

    @IBOutlet weak var nameDefLabel: UILabel!
    @IBOutlet weak var dateDefLabel: UILabel!
    @IBOutlet weak var timeDefLabel: UILabel!
    @IBOutlet weak var numberPeopleDefLabel: UILabel!
    @IBOutlet weak var phoneNumberDefLabel: UILabel!
    
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var nameResLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var reservationBlockImage: UIImageView!
    
    var senderNameText: String = ""
    var senderButtonDate: String = ""
    var senderTimeText: String = ""
    var senderNumberPeopleText: String = ""
    var senderNumberPhoneText: String = ""
    var senderTable: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        senderNameText = UserDefaults.standard.string(forKey: "senderNameText") ?? ""
        senderButtonDate = UserDefaults.standard.string(forKey: "senderButtonDate") ?? ""
        senderTimeText = UserDefaults.standard.string(forKey: "senderTimeText") ?? ""
        senderNumberPeopleText = UserDefaults.standard.string(forKey: "senderNumberPeopleText") ?? ""
        senderNumberPhoneText = UserDefaults.standard.string(forKey: "senderNumberPhoneText") ?? ""
        senderTable = UserDefaults.standard.integer(forKey: "senderTable") 
        
        if senderNameText == "" {
            reservationBlockImage.isHidden = true
            cancelButton.isHidden = true
            nameDefLabel.isHidden = true
            dateDefLabel.isHidden = true
            timeDefLabel.isHidden = true
            numberPeopleDefLabel.isHidden = true
            phoneNumberDefLabel.isHidden = true
            tableNumberLabel.isHidden = true
            nameResLabel.isHidden = true
            dateLabel.isHidden = true
            timeLabel.isHidden = true
            numberOfPeopleLabel.isHidden = true
            phoneNumberLabel.isHidden = true
        } else {
            reservationBlockImage.isHidden = false
            cancelButton.isHidden = false
            nameDefLabel.isHidden = false
            dateDefLabel.isHidden = false
            timeDefLabel.isHidden = false
            numberPeopleDefLabel.isHidden = false
            phoneNumberDefLabel.isHidden = false
            tableNumberLabel.isHidden = false
            nameResLabel.isHidden = false
            dateLabel.isHidden = false
            timeLabel.isHidden = false
            numberOfPeopleLabel.isHidden = false
            phoneNumberLabel.isHidden = false

            tableNumberLabel.text = "Table #\(senderTable)"
            nameResLabel.text = senderNameText
            dateLabel.text = senderButtonDate
            timeLabel.text = senderTimeText
            numberOfPeopleLabel.text = senderNumberPeopleText
            phoneNumberLabel.text = senderNumberPhoneText
        }
    }
    
    @IBAction func onBackButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onCancelButtonClick(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "senderNameText")
        UserDefaults.standard.removeObject(forKey: "senderButtonDate")
        UserDefaults.standard.removeObject(forKey: "senderTimeText")
        UserDefaults.standard.removeObject(forKey: "senderNumberPeopleText")
        UserDefaults.standard.removeObject(forKey: "senderNumberPhoneText")
        UserDefaults.standard.removeObject(forKey: "senderTable")
        
        navigationController?.popViewController(animated: true)

    }
}
