//
//  OnboardingViewController.swift
//  ChallengeAnimalUser
//
//  Created by Joan Wilson Oliveira on 02/12/22.
//

import UIKit
import AuthenticationServices
import CloudKit

class OnboardingViewController: UIViewController {

    var contentView: OnboardingView = OnboardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        self.view = contentView

    }

}

extension OnboardingViewController: OnboardingViewDelegate {
    func handleLogInWithAppleId() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])

        controller.delegate = self
        controller.presentationContextProvider = self

        controller.performRequests()
    }
}


extension OnboardingViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user

            let defaults = UserDefaults.standard
            defaults.set(userIdentifier, forKey: "userIdentifier1")

            let repository = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase
            let cloudRepository = ICloudRepository(publishContainer: repository)

            let shelterViewController = ShelterViewController(cloudRepository: cloudRepository)
            navigationController?.pushViewController(shelterViewController, animated: true)

            // MARKk:- Tratar
            // Save the UserIdentifier somewhere in your server/database
//            let vc = OnboardingViewController()
//            vc.userID = userIdentifier
//            self.present(UINavigationController(rootViewController: vc), animated: true)
        default:
            print("default")
        }
    }
}

extension OnboardingViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
           return self.view.window!
    }
}
