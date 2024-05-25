//
//  ClientCatalogViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import Combine
import Foundation
import XCoordinator

struct ClientCatalogModel: Codable {
    let catalogName: String
    let image: String
    let name: String
    let subName: String
    let description: String
}

protocol ClientCatalogViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCatalogRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
    var selectedMedicine: CurrentValueSubject<ClientCatalogModel?, Never> { get set }
}

final class ClientCatalogViewModelImpl: BaseVM<UnownedRouter<ClientCatalogRoute>>,
                                        ClientCatalogViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<Int, Never>(0)
    var selectedMedicine = CurrentValueSubject<ClientCatalogModel?, Never>(nil)
    var agronika: [ClientCatalogDetailsModel] = []
    var arbalet: [ClientCatalogDetailsModel] = []
    var azoksit: [ClientCatalogDetailsModel] = []
    var akkord: [ClientCatalogDetailsModel] = []
    var agromin: [ClientCatalogDetailsModel] = []
    var vitalon: [ClientCatalogDetailsModel] = []
    var regolon: [ClientCatalogDetailsModel] = []
    var greff: [ClientCatalogDetailsModel] = []
    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
            self.networkManager = networkManager
            super.init()

            // Загрузка данных из Catalogs.plist
            if let path = Bundle.main.path(forResource: "AgronikaGrand", ofType: "plist"),
               let data = FileManager.default.contents(atPath: path) {
                do {
                    self.agronika = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data)
                } catch {
                    print("Error decoding Catalogs.plist: \(error)")
                }
            } else {
                print("Error loading Catalogs.plist file.")
            }

        // Загрузка данных из Catalogs2.plist
        if let path2 = Bundle.main.path(forResource: "Arbalet", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.arbalet = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }

        if let path2 = Bundle.main.path(forResource: "Azoksit", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.azoksit = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }
        if let path2 = Bundle.main.path(forResource: "Akkord", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.akkord = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }
        if let path2 = Bundle.main.path(forResource: "Agromin", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.agromin = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }
        if let path2 = Bundle.main.path(forResource: "Vitalon", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.vitalon = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }
        if let path2 = Bundle.main.path(forResource: "Regolon", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.regolon = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }
        if let path2 = Bundle.main.path(forResource: "Greff", ofType: "plist"),
           let data2 = FileManager.default.contents(atPath: path2) {
            do {
                self.greff = try PropertyListDecoder().decode([ClientCatalogDetailsModel].self, from: data2)
            } catch {
                print("Error decoding Catalogs2.plist: \(error)")
            }
        } else {
            print("Error loading Catalogs2.plist file.")
        }
        }

    override func onSubscribe() {
        nextRoute
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.router?.trigger(.next)
            }
            .store(in: &cancellables)

        selectedMedicine
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] object in
                guard let self = self,
                      let object = object else { return }
                switch object.name {
                case "Агроника Гранд":
                    self.router?.trigger(
                        .catalogDetails(title: object.name,
                                        catalogs: agronika))
                case "Арбалет®":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: arbalet))
                case "Азоксит®":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: azoksit))
                case "Аккорд®":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: akkord))
                case "АгроМинерал® Зерновые":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: agromin))
                case "Виталон":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: vitalon))
                case "Реголон":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: regolon))
                case "Грефф®":
                     self.router?.trigger(
                         .catalogDetails(title: object.name,
                                         catalogs: greff))
                default:
                    break
                }
        }.store(in: &cancellables)
    }
}
