//
//  TitleCollectionViewCell.swift
//  AgroChem
//
//  Created by Abdulmajit Kubatbekov on 16/6/24.
//

import UIKit
//import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String){
        let url = URL(string: model)
        
        let data = try? Data(contentsOf: url!)
        posterImageView.image = UIImage(data: data!)
    }
}
