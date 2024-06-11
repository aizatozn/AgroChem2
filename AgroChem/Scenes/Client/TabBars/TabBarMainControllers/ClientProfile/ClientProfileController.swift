//
//  ClientProfileController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine
import GoogleSignIn
import Firebase
final class ClientProfileController: VMController<ClientProfilePresentable,
                                  ClientProfileViewModel> {

    override func onConfigureActions() {

        content.nextButton.addTarget(self,
                                     action: #selector(nextButtonAction),
                                     for: .touchDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDef = UserDefaultsServiceImpl()
        content.userEmailLabel.text = "Your email: \(userDef.getString(.userEmail) ?? "")"
    }
}

private extension ClientProfileController {

    @objc private func clientProfileButtonAction() {
        let count = viewModel.counter.value
        viewModel.counter.send(count + 1)
    }

    @objc private func nextButtonAction() {
        GIDSignIn.sharedInstance()?.signOut()
        try? Auth.auth().signOut()
        validateAuth()
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: LoginViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
}
