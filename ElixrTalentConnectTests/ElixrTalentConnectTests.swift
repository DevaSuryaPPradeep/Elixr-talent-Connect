//
//  ElixrTalentConnectTests.swift
//  ElixrTalentConnectTests
//
//  Created by Devasurya on 10/01/24.
//

import XCTest
@testable import ElixrTalentConnect

final class ElixrTalentConnectTests: XCTestCase {
    
    /// Variable of type loginViewModel
    var loginViewModel :LoginViewModel?
    
    /// setUp()  method is called in every Test Cases
        override func setUp() {
                loginViewModel = LoginViewModel()
        }
    /// Provides an opportunity to perform cleanup and to throw errors after each test method in a test case ends.
    override func tearDownWithError() throws {
        loginViewModel = nil
    }
    
    /// Test case  validations.
    func testValidateCredentials() throws {
            //Invalid email
        var testModel = UserModel(userName: "invalid", passwordValue: "validPassword")
            let viewModel = try XCTUnwrap(loginViewModel)
            var validationResult = viewModel.validateCredentials(model: testModel)
            XCTAssertFalse(validationResult.isValid, "validation result should not be false")
            //Invalid password
        testModel = UserModel(userName: "validEmail@example.com", passwordValue: "short")
            validationResult = viewModel.validateCredentials(model: testModel)
            XCTAssertFalse(validationResult.isValid)
            //Valid details
        testModel = UserModel(userName: "validEmail@example.com", passwordValue: "passsword1234")
            validationResult = viewModel.validateCredentials(model: testModel)
            XCTAssertTrue(validationResult.isValid)
        }
}
