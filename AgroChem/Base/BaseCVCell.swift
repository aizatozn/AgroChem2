//
//  BaseCVCell.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Combine
import UIKit

class BaseCVCell: UICollectionViewCell, ReusableView {

    var cancellables: Set<AnyCancellable> = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        onCreate()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    func onCreate() {}

    override func prepareForReuse() {
        super.prepareForReuse()
        cancellables.removeAll()
    }

    deinit {
        cancellables.removeAll()
    }
}
