//
//  ClientHomeController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine
import FirebaseAuth

final class ClientHomeController: VMController<ClientHomePresentable,
                                  ClientHomeViewModel> {

    override func onBindViewModel() {

        content.catalogCollectionSelected
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] index in
                guard let self = self else { return }
                self.viewModel.catalogCollectionSelected.send(index)
                if index == 0 {
                    navigationController?.tabBarController?.selectedIndex = 1
                }
            }
            .store(in: &viewModel.cancellables)
    }

    override func onConfigureController() {
        title = "AgroChem"
        validateAuth()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: LoginViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
}
