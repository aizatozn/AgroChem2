//
//  Swinjectable.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Foundation
import Swinject
import SwinjectAutoregistration

enum Swinjectable {
    static var container: Container = .init()
    static var assembler: Assembler = .init(container: container)
}

extension Container {

    static var container: Container {
        return Swinjectable.container
    }

    func assemble(assembly: Assembly) {
        assembly.assemble(container: self)
    }
}
