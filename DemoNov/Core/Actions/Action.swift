//
//  Action.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

/**
 Generic protocol to handle actions
 */
protocol Action {

    /**
     Execute action
     */
    func execute()
    
    /**
     Check if the action can be executed
     */
    func canBeExecuted() -> Bool
}
