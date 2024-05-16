//
//  ClientHelpAndSupportController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import UIKit
import Combine

final class ClientHelpAndSupportController: VMController<ClientHelpAndSupportPresentable,
                                            ClientHelpAndSupportViewModel> {

    override func onConfigureActions() {
        content.telegramButton.addTarget(self,
                                         action: #selector(telegramButtonTapped),
                                         for: .touchUpInside)
    }

    override func onConfigureController() {
        title = "Help and Support"
    }
}

private extension ClientHelpAndSupportController {

    @objc private func telegramButtonTapped() {
        guard let url = URL(string: "https://t.me/aizatozn") else { return }
        UIApplication.shared.open(url)
    }
}
