//
//  ClientHelpAndSupportViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientHelpAndSupportViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientHomeRoute>? { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

final class ClientHelpAndSupportViewModelImpl: BaseVM<UnownedRouter<ClientHomeRoute>>,
                                               ClientHelpAndSupportViewModel {

}
