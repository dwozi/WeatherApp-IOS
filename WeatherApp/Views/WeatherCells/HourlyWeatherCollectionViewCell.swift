//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 22.02.2024.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    private let tempLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private let timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        
        return label
    }()
    private let iconImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(iconImage)
        addConstraints()
        
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
        contentView.backgroundColor = .secondarySystemBackground
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImage.image = nil
        tempLabel.text = nil
        timeLabel.text = nil
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        
            
            iconImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            iconImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            iconImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            
            tempLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tempLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    public func configure(with viewModel : HourlyWeatherCollectionViewCellViewModel){
        iconImage.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.hour
    }
}
