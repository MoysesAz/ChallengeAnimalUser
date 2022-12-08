//
//  ViewController.swift
//  LIPEF
//
//  Created by Tales Valente on 11/10/22.
import UIKit
import Foundation

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    var screen: LoginView?

    func loginView(_ loginView: LoginView, didTapOnLoginButton button: UIButton) {}

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    override func loadView() {
        self.screen = LoginView()
        self.screen?.delegate = self
        self.view = self.screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
