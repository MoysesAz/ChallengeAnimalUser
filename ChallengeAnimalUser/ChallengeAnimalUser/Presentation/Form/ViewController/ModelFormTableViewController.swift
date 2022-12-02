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

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderFormTableView()
        header.configure(form: self.form!)
        return header
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterFormTableView()
        footer.delegate = self
        return footer
    }

    @objc func cancelForm(sender: UIButton!) {
        viewModel.cleanData()
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ModelFormTableViewController: PushButtonFormDelegate {

    func goToNextView() {
        switch self.form {

        case .rgData:
            pushImageViewController(form: .residenceProof)
        case .residenceProof:
            pushImageViewController(form: .petLocal)
        case .petLocal:
            pushTextFieldViewController(form: .userContact)
        case .userContact:
            pushTextFieldViewController(form: .textToONG)
        case .textToONG:
            self.navigationController?.popToRootViewController(animated: false)
        case .none:
            fatalError("form is none")
        }
    }

    private func pushImageViewController(form: Form) {
        let viewController = ImagesFormTableViewController(form: form)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    private func pushTextFieldViewController(form: Form) {
        let viewController = TextFieldFormTableViewController(form: form)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
