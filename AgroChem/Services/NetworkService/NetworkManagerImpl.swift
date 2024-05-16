//
//  NetworkManagerImpl.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Foundation
import Alamofire

final class NetworkManagerImpl: NetworkManager {

    private(set) var session: Alamofire.Session = configSession()

    init() {}

    private static func configSession() -> Alamofire.Session {

        let configuration = URLSessionConfiguration.default
        configuration.headers = [
            "Content-Type": "application/json"
        ]

        guard let userToken = UserDefaults.standard.string(forKey: "accessToken") else {
            return Alamofire.Session(configuration: configuration)
        }

        configuration.headers["Authorization"] = "Bearer \(userToken)"
        return Alamofire.Session(configuration: configuration)
    }

    func reconfigureSession() {
        session = Self.configSession()
    }
}

extension NetworkManagerImpl {

    func networkHandling(completion: @escaping (Bool) -> Void) {

        let reachabilityManager = NetworkReachabilityManager()

        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                completion(false)
            case .reachable(.cellular):
                completion(true)
            case .reachable(.ethernetOrWiFi):
                completion(true)
            case .unknown:
                completion(false)
            }
        }
    }
}
