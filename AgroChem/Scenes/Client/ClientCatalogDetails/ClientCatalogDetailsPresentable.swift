//
//  ClientCatalogDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 16/5/24.
//

import UIKit
import SnapKit

final class ClientCatalogDetailsPresentable: BaseView {

    // MARK: - Properties

    var catalogDetails: [ClientCatalogDetailsModel] = [] {
        didSet {
            filteredCatalogDetails = catalogDetails
            catalogCollectionView.reloadData()
        }
    }

    private let catalogCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 20, right: 0)
        return collectionView
    }()

    private var filteredCatalogDetails: [ClientCatalogDetailsModel] = []

    // MARK: - Lifecycle

    override func onConfigureView() {
        backgroundColor = .white
        catalogCollectionView.delegate = self
        catalogCollectionView.dataSource = self

        catalogCollectionView.register(ClientCatalogDetailsCell.self, forCellWithReuseIdentifier: "CatalogCellIdentifier")
    }

    override func onAddSubviews() {
        addSubviews(catalogCollectionView)
    }

    override func onSetupConstraints() {
        catalogCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ClientCatalogDetailsPresentable: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCatalogDetails.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCellIdentifier", for: indexPath) as? ClientCatalogDetailsCell else {
            fatalError("Unable to dequeue ClientCatalogDetailsCell")
        }
        cell.configure(model: filteredCatalogDetails[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 3.02)
    }
}
