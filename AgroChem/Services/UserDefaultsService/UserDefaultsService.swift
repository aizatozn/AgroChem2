//
//  UserDefaultsService.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Foundation

protocol UserDefaultsService {
    func set(_ value: Bool, forKey key: UserDefaultsServiceKeys)
    func setString(_ value: String, forKey key: UserDefaultsServiceKeys)
    func getString(_ key: UserDefaultsServiceKeys) -> String?
    func setData(_ value: Data, forKey key: UserDefaultsServiceKeys)
    func get(forKey key: UserDefaultsServiceKeys) -> Bool
    func removeObject(forKey key: UserDefaultsServiceKeys)
    func synchronize()
    func stringGet(forKey key: UserDefaultsServiceKeys) -> String
    func getData(_ key: UserDefaultsServiceKeys) -> Data?
    func setArray(_ value: [String], forKey key: UserDefaultsServiceKeys)
    func getArray(forKey key: UserDefaultsServiceKeys) -> [String]?
}

final class UserDefaultsServiceImpl: UserDefaultsService {

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    func set(_ value: Bool, forKey key: UserDefaultsServiceKeys) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func setString(_ value: String, forKey key: UserDefaultsServiceKeys) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }

    func setData(_ value: Data, forKey key: UserDefaultsServiceKeys) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func get(forKey key: UserDefaultsServiceKeys) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }

    func removeObject(forKey key: UserDefaultsServiceKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }

    func synchronize() {
        UserDefaults.standard.synchronize()
    }

    func stringGet(forKey key: UserDefaultsServiceKeys) -> String {
        return userDefaults.string(forKey: key.rawValue) ?? ""
    }

    func getData(_ key: UserDefaultsServiceKeys) -> Data? {
        userDefaults.data(forKey: key.rawValue)
    }

    func setArray(_ value: [String], forKey key: UserDefaultsServiceKeys) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }

    func getArray(forKey key: UserDefaultsServiceKeys) -> [String]? {
        userDefaults.stringArray(forKey: key.rawValue)
    }

    func getString(_ key: UserDefaultsServiceKeys) -> String? {
        userDefaults.string(forKey: key.rawValue)
    }

}
