//
//  CurrentWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 22.02.2024.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    private let tempLabel : UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 62,weight: .medium)
        return label
    }()
    
    private let conditionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .regular)
        return label
        
    }()
    
    private let icon : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(tempLabel)
        contentView.addSubview(icon)
        contentView.addSubview(conditionLabel)
        
        addConstraint()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        conditionLabel.text = nil
        tempLabel.text = nil
        icon.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func addConstraint(){
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tempLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            icon.heightAnchor.constraint(equalToConstant: 55),
            icon.widthAnchor.constraint(equalToConstant: 55),
            icon.topAnchor.constraint(equalTo: tempLabel.bottomAnchor ),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            conditionLabel.leftAnchor.constraint(equalTo: icon.rightAnchor,constant: 10),
            conditionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            conditionLabel.heightAnchor.constraint(equalToConstant: 80),
            conditionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: 20),
            conditionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
        
        
        ])
    }
    public func configure(with viewModel : CurrentWeatherCollectionViewCellViewModel){
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        conditionLabel.text = viewModel.condition
    }
}
