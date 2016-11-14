//
//  LoginService.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

protocol LoginService {

    func login(user: String, password: String, success: ((LoginResponse) -> Void), failure: ((NSError?) -> Void))
}