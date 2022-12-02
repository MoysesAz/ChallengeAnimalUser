//
//  TextFieldFormTableViewController.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 02/12/22.
//

import UIKit

class TextFieldFormTableViewController: ModelFormTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        form == .userContact ? 2 : 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell")
                as? TextFieldFormTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")

        }
        cell.configure(form: form!, indexPath: indexPath)
        cell.textField.delegate = self
        return cell
    }
}

extension TextFieldFormTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let maxLength = 20
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}
