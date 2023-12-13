//
//  Module.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import Foundation

protocol DependancyModule{
    func provideRepository()-> Repository
}
