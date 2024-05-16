//
//  ClientThirdDirectoryDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 27/4/24.
//

import UIKit
import SnapKit

final class ClientThirdDirectoryDetailsPresentable: BaseView, UISearchBarDelegate {

    var directories: [ClientThirdDirectoryModel] = [] {
        didSet {
            filteredDirectories = directories
            directoryCollectionView.reloadData()
        }
    }

    private let directoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 20, right: 0)
        return collectionView
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()

    private var filteredDirectories: [ClientThirdDirectoryModel] = []

    override func onConfigureView() {
       super.onConfigureView()
       backgroundColor = .white
       directoryCollectionView.delegate = self
       directoryCollectionView.dataSource = self

       searchBar.backgroundImage = UIImage()
    }

    override func onAddSubviews() {
        addSubviews(directoryCollectionView, searchBar)
        directoryCollectionView.register(ClientThirdDirectoryDetailsCell.self,
                                         forCellWithReuseIdentifier: "CellIdentifier")
    }

    override func onSetupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        directoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    // MARK: - UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredDirectories = directories
        } else {
            filteredDirectories = directories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        directoryCollectionView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ClientThirdDirectoryDetailsPresentable: UICollectionViewDelegate,
                                             UICollectionViewDataSource,
                                             UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return filteredDirectories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier",
                                                            for: indexPath) as? ClientThirdDirectoryDetailsCell else {
            fatalError("Unable to dequeue ClientThirdDirectoryDetailsCell")
        }
        cell.configure(model: filteredDirectories[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = filteredDirectories[indexPath.item]
        let expectedWidth = collectionView.frame.width - 30

        let cell = ClientThirdDirectoryDetailsCell(frame: .zero)
        cell.configure(model: model)

        cell.layoutIfNeeded()
        let size = cell.systemLayoutSizeFitting(
            CGSize(width: expectedWidth,
                   height: CGFloat.greatestFiniteMagnitude), withHorizontalFittingPriority: .required,
                        verticalFittingPriority: .fittingSizeLevel)

        let height = size.height + 10

        return CGSize(width: expectedWidth, height: height)
    }
}
