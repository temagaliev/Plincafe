//
//  FavoriteViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 29.09.2023.
//

import UIKit

class FavoriteViewController: UIViewController {

    var cocktailTableView = UITableView()
    
    let viewCustom: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: NameImage.bg.rawValue)
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorites"
        label.font = UIFont(name: "RacingSansOne-Regular", size: 23)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        self.cocktailTableView = UITableView(frame: view.frame, style: .plain)
        cocktailTableView.register(UINib(nibName: "CockteilTableViewCell", bundle: nil), forCellReuseIdentifier: "cockteil")
        cocktailTableView.translatesAutoresizingMaskIntoConstraints = false
        self.cocktailTableView.delegate = self
        self.cocktailTableView.dataSource = self
        
        cocktailTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        cocktailTableView.backgroundColor = .clear
        
        view.addSubview(imageBackground)
        view.addSubview(cocktailTableView)
        view.addSubview(viewCustom)
        viewCustom.addSubview(nameLabel)
        
        imageBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageBackground.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        imageBackground.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        viewCustom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewCustom.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewCustom.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewCustom.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        cocktailTableView.topAnchor.constraint(equalTo: viewCustom.bottomAnchor).isActive = true
        cocktailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cocktailTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cocktailTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 16).isActive = true
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cockteil", for: indexPath) as? CockteilTableViewCell {
            cell.backgroundColor = .clear
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
