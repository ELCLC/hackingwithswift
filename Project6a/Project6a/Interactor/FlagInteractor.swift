//
//  FlagInteractor.swift
//  Project6a
//
//  Created by Emma Lee-Choon on 14/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import Foundation

protocol FlagInteractorProtocol: class {
    func getFlags() -> [String]
}

class FlagInteractor: FlagInteractorProtocol {
    func getFlags() -> [String] {
        var countries = [String]()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        return countries
    }
}
