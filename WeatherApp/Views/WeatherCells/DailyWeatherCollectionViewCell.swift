//
//  DailyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 22.02.2024.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    
    
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
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
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
        contentView.backgroundColor = .tertiarySystemBackground
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(iconImage)
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        tempLabel.text = nil
        timeLabel.text = nil
        iconImage.image = nil
        
    }
    public func configure(with viewModel : DailyWeatherCollectionViewCellViewModel){
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.day
        iconImage.image = UIImage(systemName: viewModel.iconName)
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
        
            
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.leftAnchor.constraint(equalTo: timeLabel.rightAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 32),
            iconImage.widthAnchor.constraint(equalToConstant: 30),
            
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor,constant: 10),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            
        
        
        ])
    }
}
