//
//  FormOnboardingViewController.swift
//  ChallengeAnimalUser
//
//  Created by Pedro Muniz on 06/12/22.
//

import UIKit

class FormOnboardingViewController: UIViewController {

    let customView = FormOnboardingView()

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cadastro para adoção"
        navigationController?.navigationBar.prefersLargeTitles = true
        let nextController = ImagesFormTableViewController(form: .rgData)
        customView.didTapButton = {
            self.navigationController?.pushViewController(nextController, animated: true)
        }
      //  ImageFromTableViewController(form: .rgdata)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
