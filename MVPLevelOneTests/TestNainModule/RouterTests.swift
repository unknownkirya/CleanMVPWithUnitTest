//
//  RouterTests.swift
//  MVPLevelOneTests
//
//  Created by Кирилл Бережной on 13.04.2023.
//

import XCTest
@testable import MVPLevelOne

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTests: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController =  MockNavigationController()
    let assembly = AssemblyBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }


}
