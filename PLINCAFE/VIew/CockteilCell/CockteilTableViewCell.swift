//
//  CockteilTableViewCell.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 29.09.2023.
//

import UIKit

class CockteilTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var nameCockteilLabel: UILabel!
    @IBOutlet weak var comproundLabel: UILabel!
    @IBOutlet weak var cockteilImage: UIImageView!
    @IBOutlet weak var priceCockteilLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 40
        
    }

    @IBAction func onPriceButtonClick(_ sender: Any) {
        print("1")
    }
    
    @IBAction func onFavoriteButtonClick(_ sender: Any) {
        print("2")

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
