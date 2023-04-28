//
//  Txt.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

/*
 
 
 //
 //  AuthorizationError.swift
 //  Meditation
 //
 //  Created by Лада on 02.04.2023.
 //
 //
 import Foundation
 import Combine

 enum AuthorizationError: Error {
     case unauthorized
 }

 protocol AuthorizationService {
     var isAuthorized: AnyPublisher<Bool, Never> { get }

     func signIn(login: String, password: String) async throws
     func signOut()
 }


 class MockAuthorizationService: AuthorizationService {
     static let shared: MockAuthorizationService = .init()

     private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(false)

     var isAuthorized: AnyPublisher<Bool, Never> {
         _isAuthorized
             .removeDuplicates()
             .eraseToAnyPublisher()
     }

     func signIn(login: String, password: String) async throws {
 //        try? await Task.sleep(for: .seconds(1))
         if !(login == "admin" && password == "qwerty") {
             _isAuthorized.value = false
             throw AuthorizationError.unauthorized
         } else {
             _isAuthorized.value = true
         }
     }

     func signOut() {
         _isAuthorized.value = false
     }
 }
 
 */


/*========./Presentation/Login===========*/

/*
 
 //
 //  AppCoordinator.swift
 //  Meditation
 //
 //  Created by Лада on 05.04.2023.
 //

 import UIKit
 import Combine

 @MainActor
 class AppCoordinator {
     weak var window: UIWindow?
     static let shared: AppCoordinator = .init()

 //    var authorizationService: AuthorizationService
 //        = MockAuthorizationService.shared

     var cancellables: Set<AnyCancellable> = []

 //    func start() {
 //        authorizationService.isAuthorized
 //            .receive(on: DispatchQueue.main)
 //            .sink { [weak self] authorized in
 //                guard let self else { return }
 //
 //                if authorized {
 //                    self.showAppContent()
 //                } else {
 //                    self.showAuthorization()
 //                }
 //            }
 //            .store(in: &cancellables)
 //    }

 //    func showAuthorization() {
 //        let controller = LoginViewController()
 //        let presenter = LoginPresenter()
 //        controller.presenter = presenter
 //        presenter.view = controller
 //        window?.rootViewController = controller
 //    }

 //    func showAppContent() {
 //        let tabBarCoordinator = MainTabBarCoordinator()
 //        window?.rootViewController = tabBarCoordinator.start()
 //    }
 }
 
 */


/*========./Presentation/Login===========*/
/*
 //
 //  MainTabBarCoordinator.swift
 //  Meditation
 //
 //  Created by Лада on 05.04.2023.
 //

 import UIKit

 class MainTabBarCoordinator: UITabBarController {
 //    weak var tabBarController: UITabBarController?
     override func viewDidLoad() {
         super.viewDidLoad()
         let login = LoginViewController()
         let authorization = AuthorizationViewController()
         
         self.setViewControllers([login, authorization], animated: false)
     }

 //    func start() -> UIViewController {
 //        let tabBarController = UITabBarController()
 //        self.tabBarController = tabBarController
 //        tabBarController.viewControllers = [
 //            profile(),
 //            main(),
 //
 //        ]
 //        return tabBarController
 //    }

 //    private let storyboard: UIStoryboard = .init(name: "Main", bundle: nil)

 //    private func main() {
 //        let controller = MainViewController()
 //        controller.tabBarItem = .init(
 //            title: "Main",
 //            image: .init(systemName: "star"),
 //            selectedImage: .init(systemName: "star.fill")
 //        )
 //        return controller
 //    }
 //
 //    private func profile() {
 //        let controller = ProfileViewController()
 //        controller.tabBarItem = .init(
 //            title: "Profile",
 //            image: .init(systemName: "person.circle"),
 //            selectedImage: .init(systemName: "person.circle.fill")
 //        )
 //        return controller
 //    }
 }

 */


/*========./Presentation/Login===========*/
/*
 //
 //  AuthorizationViewController.swift
 //  Meditation
 //
 //  Created by Лада on 06.04.2023.
 //

 import UIKit

 class AuthorizationViewController: UIViewController {
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .green
         let controller = AuthorizationViewController()
         controller.tabBarItem = .init(
             title: "Authorization",
             image: .init(systemName: "star.circle"),
             selectedImage: .init(systemName: "star.circle.fill")
         )
     }
 }

 
 */
