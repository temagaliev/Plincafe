//
//  CocktailsViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 28.09.2023.
//

import UIKit

class CocktailsViewController: UIViewController {
    
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
        label.text = "Alcoholic"
        label.font = UIFont(name: "RacingSansOne-Regular", size: 23)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: NameImage.backButton.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cocktailTableView = UITableView(frame: view.frame, style: .plain)
        cocktailTableView.register(UINib(nibName: "CockteilTableViewCell", bundle: nil), forCellReuseIdentifier: "cockteil")
        cocktailTableView.translatesAutoresizingMaskIntoConstraints = false
        self.cocktailTableView.delegate = self
        self.cocktailTableView.dataSource = self
        
        cocktailTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        cocktailTableView.backgroundColor = .clear
        
        backButton.addTarget(self, action: #selector(onBackButtonClick), for: .touchUpInside)
        
        view.addSubview(imageBackground)
        view.addSubview(cocktailTableView)
        view.addSubview(viewCustom)
        viewCustom.addSubview(nameLabel)
        viewCustom.addSubview(backButton)
        
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
        
        backButton.leftAnchor.constraint(equalTo: viewCustom.leftAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 8).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 16).isActive = true
    }
    
    @objc func onBackButtonClick() {
        navigationController?.popViewController(animated: true)
    }
}

extension CocktailsViewController: UITableViewDataSource, UITableViewDelegate {
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
