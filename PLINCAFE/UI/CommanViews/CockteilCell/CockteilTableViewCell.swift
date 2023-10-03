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
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var priceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 40
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func refreshCockteils(model: Cockteil) {
        nameCockteilLabel.text = model.name
        comproundLabel.text = model.discName
        cockteilImage.image = UIImage(named: model.image)
        priceCockteilLabel.text = String(model.price)
    }
}
