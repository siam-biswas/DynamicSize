//
//  DynamicViewController.swift
//  DynamicSize
//
//  Created by Siam Biswas on 19/8/19.
//  Copyright © 2019 Siam Biswas. All rights reserved.
//

import UIKit

class DynamicViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tableView.register(DynamicCell.self, forCellReuseIdentifier: "DynamicCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicCell") ?? DynamicCell(style: .subtitle, reuseIdentifier: "DynamicCell")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}


class DynamicCell:UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let view = DynamicView()
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor, constant: 20.dynamic()).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.dynamic()).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.dynamic()).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.dynamic()).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class DynamicView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.dynamic())
        label.textAlignment = .left
        return label
    }()
    
     private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.dynamic())
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var pictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
        setupLayout()
        setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func setupData() {

        
        self.titleLabel.text = "Dynamic Sizing Title"
        self.descriptionLabel.text = "Lets check some description for dynamic sizing and hope its work for the best."
        self.pictureView.image = UIImage(named: "sunset")
    }
    
    private func setupView() {
        
        layer.cornerRadius = 8.dynamic()
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.5
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(pictureView)
    }
    
    private func setupLayout() {
        
        pictureView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pictureView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pictureView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pictureView.heightAnchor.constraint(equalToConstant: 150.dynamic()).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 20.dynamic()).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.dynamic()).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.dynamic()).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.dynamic()).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.dynamic()).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.dynamic()).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.dynamic()).isActive = true
    }
    
}