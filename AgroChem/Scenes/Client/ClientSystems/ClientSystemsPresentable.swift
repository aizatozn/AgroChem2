//
//  ClientSystemsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import UIKit
import SnapKit
import Combine

final class ClientSystemsPresentable: BaseView {

    var selectedSystem = CurrentValueSubject<String?, Never>(nil)
    private let data = [("8", "Бобовые"), ("9", "Зерновые"),
                        ("10", "Картофель"), ("11", "Кукуруза"),
                        ("12", "Лён"), ("13", "Подсолнечник"),
                        ("14", "Рапс"), ("15", "Свёкла")]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func onConfigureView() {
        backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 17, bottom: 10, right: 17)
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(ClientDirectoryCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(ClientSecondDirectoryCell.self, forCellWithReuseIdentifier: "Cell")
    }

    override func onAddSubviews() {
        view.addSubview(collectionView)
    }

    override func onSetupConstraints() {

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ClientSystemsPresentable: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell: ClientSystemsCell = collectionView.dequeue(for: indexPath)

        let (symbolName, text) = data[indexPath.item]
        cell.configure(symbolName: symbolName, text: text)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        selectedSystem.send(data[indexPath.row].1)
    }
}

extension ClientSystemsPresentable: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2.43, height: 80)
    }
}
