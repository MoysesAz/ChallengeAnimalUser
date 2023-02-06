//
//  ViewController.swift
//  LIPEF
//
//  Created by Tales Valente on 11/10/22.
import UIKit
import CloudKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    var screen: LoginView?

    func loginView(_ loginView: LoginView, didTapOnLoginButton button: UIButton) {}

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    override func loadView() {
        self.screen = LoginView(frame: .zero, moveToShelter: self.moveToShelterView)
        self.screen?.delegate = self
        self.view = self.screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func moveToShelterView () -> Void {
        let repository = CKContainer(identifier: "iCloud.Mirazev.AnimalUser").publicCloudDatabase
        let cloudRepository = ICloudRepository(publishContainer: repository)
        let controller: UIViewController = ShelterViewController(cloudRepository: cloudRepository)
        navigationController?.pushViewController(controller, animated: true)
    }


}
