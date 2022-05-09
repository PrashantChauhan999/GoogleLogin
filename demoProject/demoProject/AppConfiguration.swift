//
//  AppConfiguration.swift
//  demoProject
//
//  Created by prashant on 09/05/22.
//

import Foundation
/*
 Open your Project Build Settings and search for “Swift Compiler – Custom Flags” … “Other Swift Flags”.
 Add “-DDEVELOPMENT” to the Debug section
 Add “-DPRODUCTION” to the Release section
 */
enum Environment: String {
    case development
    case production

    var title: String {
        switch self {
        case .production: return "Production"
        case .development: return "Development"
        }
    }
    
    /**
     Returns application selected build configuration/environment

     - returns: An application selected build configuration/environment. Default is Development.
     */
    static func currentEnvironment() -> Environment {
        #if PRODUCTION
            return Environment.production
        #else // Default configuration - DEVELOPMENT
            return Environment.development
        #endif

        /* let environment = Bundle.main.infoDictionary?["ActiveConfiguration"] as? String
         return environment */
    }
}

final class AppConfiguration {
    /**
     * Application Configuration
     */
    struct Configuration {
        var environment: Environment
        var apiEndPoint: String
        
        fileprivate static func debugConfiguration() -> Configuration {
            return Configuration(environment: .development,
                                 apiEndPoint: "developmentURL")
        }

        fileprivate static func productionConfiguration() -> Configuration {
            return Configuration(environment: .production,
                                 apiEndPoint: "ProductionURL")
        }
    }

    // MARK: - Singleton Instance
    class var shared: AppConfiguration {
        struct Singleton {
            static let instance = AppConfiguration()
        }
        return Singleton.instance
    }

    public private(set) var activeConfiguration: Configuration!

    private init() {
        // Load application selected environment and its configuration
        activeConfiguration = configurationForEnvironment(Environment.currentEnvironment())
    }

    /**
     Returns application active configuration

     - parameter environment: An application selected environment

     - returns: An application configuration structure based on selected environment
     */
    private func configurationForEnvironment(_ environment: Environment) -> Configuration {

        switch environment {
        case .development:
            return Configuration.debugConfiguration()
        case .production:
            return Configuration.productionConfiguration()
        }
    }
}

extension AppConfiguration {

    func applicationEnvironment() -> String {
        return activeConfiguration.environment.rawValue
    }

    func applicationEndPoint() -> String {
        return activeConfiguration.apiEndPoint
    }
}
