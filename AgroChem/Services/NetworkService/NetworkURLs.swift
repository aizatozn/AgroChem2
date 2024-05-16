//
//  NetworkURLs.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Foundation

enum NetworkURLs {

    private static let commonUrl = "https://apple.com:8087"
    private static let apiUrl = commonUrl.appending("/api")
    private static let clients = apiUrl.appending("/clients")

    // MARK: common
    static let auth = commonUrl.appending("/auth")
    static let authLogin = auth.appending("/login")

    // MARK: client products
    static let clientsProducts = clients.appending("products")
}
