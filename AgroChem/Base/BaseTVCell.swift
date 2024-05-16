//
//  BaseTVCell.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Combine
import UIKit

class BaseTVCell: UITableViewCell, ReusableView {

    var cancellables: Set<AnyCancellable> = []

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        onCreate()
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
