//
//  ModelFormTableViewController.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit

class ModelFormTableViewController: UITableViewController {

    var viewModel = FormViewModel()
    var form: Form?

    init(form: Form) {
        self.form = form
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let cancelItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancelForm)
        )
        navigationItem.rightBarButtonItem = cancelItem
        navigationItem.title = viewModel.setTitle(form: form!)

        tableView = FormTableView()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterFormTableView()
        footer.delegate = self
        return footer
    }

    @objc func cancelForm(sender: UIButton!) {
        FormModel.instance.resetAll()
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ModelFormTableViewController: PushButtonFormDelegate {
    func goToNextView() {
        if (self.form == .rgData) {
            let viewController = ImagesFormTableViewController(form: .residenceProof)
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            if (form == .residenceProof) {
                let viewController = ImagesFormTableViewController(form: .petLocal)
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
