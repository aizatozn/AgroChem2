//
//  ClientDirectoryDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import SnapKit

final class ClientDirectoryDetailsPresentable: BaseView, UISearchBarDelegate {

    var firstDirectories: [ClientDirectoryModel] = [] {
        didSet {
            filteredDirectories0 = firstDirectories
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

    private var filteredDirectories0: [ClientDirectoryModel] = []

    override func onConfigureView() {
        backgroundColor = .white
        directoryCollectionView.delegate = self
        directoryCollectionView.dataSource = self

        searchBar.backgroundImage = UIImage()
    }

    override func onAddSubviews() {
        addSubviews(directoryCollectionView, searchBar)
        directoryCollectionView.register(ClientDirectoryDetailsCell.self,
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
            filteredDirectories0 = firstDirectories
        } else {
            filteredDirectories0 = firstDirectories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        directoryCollectionView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}

extension ClientDirectoryDetailsPresentable: UICollectionViewDelegate,
                                             UICollectionViewDataSource,
                                             UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        filteredDirectories0.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ClientDirectoryDetailsCell = collectionView.dequeue(for: indexPath)
        cell.configure(model: filteredDirectories0[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 30, height: 150)
    }
}
