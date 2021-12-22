//
//  Logger.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 14.12.2021.
//

import Foundation

class Logger {

    func log(_ debug: String = "", fileName: String = #file, function: String =  #function, line: Int = #line) {
        let time = Date()
        let file = URL(fileURLWithPath: fileName).lastPathComponent
        print("┌──────────────┬────────────────────────────────────────────────")
        print("│ Debbug \(time) \(file) │ line: \(line) \(function) \n|\(debug)")
        print("└──────────────┴────────────────────────────────────────────────")
    }
}
