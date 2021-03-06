//
//  DependenciesApplicationService.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import NetworkLayer

class DependenciesApplicationService: ApplicationService {
    private let dependencies = Dependencies {
        Module { NetworkModule() as NetworkModuleType }
    }

    func initialize() {
        dependencies.build()
        print("dependencies.build")
    }
}
