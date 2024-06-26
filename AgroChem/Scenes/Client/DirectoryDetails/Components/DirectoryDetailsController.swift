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
                self.content.name1Label.text = model.name1
                self.content.subName1Label.text = model.subName1
                self.content.name2Label.text = model.name2
                self.content.subName2Label.text = model.subName2
                self.content.name3Label.text = model.name3
                self.content.subName3Label.text = model.subName3
                self.content.name4Label.text = model.name4
                self.content.subName4Label.text = model.subName4
                self.content.name5Label.text = model.name5
                self.content.subName5Label.text = model.subName5
                self.content.name6Label.text = model.name6
                self.content.subName6Label.text = model.subName6
                self.content.name7Label.text = model.name7
                self.content.subName7Label.text = model.subName7
                self.content.name8Label.text = model.name8
                self.content.subName8Label.text = model.subName8
                self.content.name9Label.text = model.name9
                self.content.subName9Label.text = model.subName9
            }
            .store(in: &viewModel.cancellables)
    }
}
