//
//  DirectoryDetailsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/5/24.
//

import UIKit

final class DirectoryDetailsController: VMController<DirectoryDetailsPresentable,
                                              DirectoryDetailsViewModel> {
    
    override func onBindViewModel() {
        viewModel.model
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                guard let self = self, let model = model else { return }
                self.content.nameLabel.text = model.name
                self.content.subNameLabel.text = model.nameInEnglish
                self.content.photoImageView.image = UIImage(named: model.image)
            }
            .store(in: &viewModel.cancellables)
    }
}
