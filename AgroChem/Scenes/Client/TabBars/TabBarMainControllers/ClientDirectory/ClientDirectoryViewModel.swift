//
//  ClientDirectoryViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import Combine
import Foundation
import XCoordinator
import FirebaseStorage

protocol ClientDirectoryViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientDirectoryRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
    var selectedDirectory: CurrentValueSubject<String?, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

final class ClientExamsViewModelImpl: BaseVM<UnownedRouter<ClientDirectoryRoute>>, ClientDirectoryViewModel {
    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<Int, Never>(0)
    var selectedDirectory = CurrentValueSubject<String?, Never>(nil)
    private var networkManager: NetworkManager
    private var storage: Storage!

    // Additional properties for ActiveSubstances and Terms
    var activeSubstances: [ClientSecondDirectoryModel] = []
    var terms: [ClientThirdDirectoryModel] = []

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        self.storage = Storage.storage()
        super.init()
    }

    override func onSubscribe() {
        nextRoute
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.router?.trigger(.next)
            }
            .store(in: &cancellables)

        selectedDirectory
            .receive(on: DispatchQueue.main)
            .sink { [weak self] directory in
                guard let self = self, let directory = directory else { return }
                print("--- \(directory)")
                self.processDirectory(directory)
            }
            .store(in: &cancellables)
    }

    private func processDirectory(_ directory: String) {
        guard let plistURL = Bundle.main.url(forResource: "DirectoriesData", withExtension: "plist"),
              let data = try? Data(contentsOf: plistURL),
              let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            print("Ошибка при загрузке данных из plist файла")
            return
        }

        switch directory {
        case "Сорные растения":
            processDirectories(plistDictionary, key: "sorniyeDirectories")
        case "Болезни культур":
            processDirectories(plistDictionary, key: "bolezniDirectories")
        case "Вредители":
            processDirectories(plistDictionary, key: "vrediteliDirectories")
        case "Культурные растения":
            processDirectories(plistDictionary, key: "cultureDirectories")
        case "Действующие вещества":
            processActiveSubstances(plistDictionary, key: "deistDirectories")
        case "Термины":
            processTerms(plistDictionary, key: "terminDirectories")
        default:
            break
        }
    }

    private func processDirectories(_ plistDictionary: [String: Any], key: String) {
        guard let directoriesData = plistDictionary[key] as? [[String: Any]] else { return }
        let directories = directoriesData.compactMap { dictionary -> ClientDirectoryModel? in
            return ClientDirectoryModel(image: dictionary["image"] as? String ?? "",
                                          name: dictionary["name"] as? String ?? "",
                                          nameInEnglish: dictionary["nameInEnglish"] as? String ?? "",
                                          name1: dictionary["name1"] as? String ?? "",
                                          subName1: dictionary["subName1"] as? String ?? "",
                                          name2: dictionary["name2"] as? String ?? "",
                                          subName2: dictionary["subName2"] as? String ?? "",
                                          name3: dictionary["name3"] as? String ?? "",
                                          subName3: dictionary["subName3"] as? String ?? "",
                                          name4: dictionary["name4"] as? String ?? "",
                                          subName4: dictionary["subName4"] as? String ?? "",
                                          name5: dictionary["name5"] as? String ?? "",
                                          subName5: dictionary["subName5"] as? String ?? "",
                                          name6: dictionary["name6"] as? String ?? "",
                                          subName6: dictionary["subName6"] as? String ?? "",
                                          name7: dictionary["name7"] as? String ?? "",
                                          subName7: dictionary["subName7"] as? String ?? "",
                                          name8: dictionary["name8"] as? String ?? "",
                                          subName8: dictionary["subName8"] as? String ?? "",
                                          name9: dictionary["name9"] as? String ?? "",
                                          subName9: dictionary["subName9"] as? String ?? "")
        }
        self.router?.trigger(.directoryDetails(title: key, directories: directories))
    }

    private func processActiveSubstances(_ plistDictionary: [String: Any], key: String) {
        guard let activeSubstancesData = plistDictionary[key] as? [[String: Any]] else { return }
        self.activeSubstances = activeSubstancesData.compactMap { dictionary -> ClientSecondDirectoryModel? in
            return ClientSecondDirectoryModel(name: dictionary["name"] as? String ?? "",
                                              nameInEnglish: dictionary["nameInEnglish"] as? String ?? "",
                                              content: dictionary["content"] as? String ?? "",
                                              description: dictionary["description"] as? String ?? "")
        }
        self.router?.trigger(.activeSubstances(activeSubstances))
    }

    private func processTerms(_ plistDictionary: [String: Any], key: String) {
        guard let termsData = plistDictionary[key] as? [[String: Any]] else { return }
        self.terms = termsData.compactMap { dictionary -> ClientThirdDirectoryModel? in
            return ClientThirdDirectoryModel(name: dictionary["name"] as? String ?? "",
                                              nameInEnglish: dictionary["nameInEnglish"] as? String ?? "",
                                              description: dictionary["description"] as? String ?? "")
        }
        self.router?.trigger(.terms(terms))
    }
}
