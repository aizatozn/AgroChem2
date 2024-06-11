//
//  AppDelegate.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 23/1/24.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else{
            if let error = error {
                _ = "Failed to sign in with Google: \(error)"
//                print("Failed to sign in with Google: \(error)")
            }
            return
        }
        
        guard let user = user else{
            return
        }
        
        guard let authentication = user.authentication else{
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        FirebaseAuth.Auth.auth().signIn(with: credential, completion: { authResults, error in
            guard authResults != nil, error == nil else{
//                print("failed to log in with google credential")
                _ = "failed to log in with google credential"
                return
            }
//            print("Successfully signed in with Google cred.")
            _ = "Successfully signed in with Google cred."
            NotificationCenter.default.post(name: .didLogInNotification, object: nil)

            NotificationCenter.default.post(
                   name: Notification.Name("SuccessfulSignInNotification"), object: nil, userInfo: nil)
        })
        
    }
    

    private lazy var mainWindow = UIWindow()
    private lazy var router = AppCoordinator().strongRouter
    private lazy var services: [UIApplicationDelegate] = [
        SwinjectServices()
    ]

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        FirebaseApp.configure()
        
        mainWindow.overrideUserInterfaceStyle = .light
        services.forEach {
            _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        router.setRoot(for: mainWindow)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }
}
extension Notification.Name {
    static let didLogInNotification = Notification.Name("didLogInNotification")
}
