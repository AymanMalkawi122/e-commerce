//
//  Configuration.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

struct AppConfiguration{
    static var mode: AppMode!
    
    static var repositoryInstance: Repository{
        get{
            switch mode{
                
            case .Default:
                return DefaultModule().provideRepository()
            case .Testing:
                return TestModule().provideRepository()
            case .none:
                fatalError("App Mode wasent provided")
            }
        }
    }
}

enum AppMode{
    case Default
    case Testing
}
