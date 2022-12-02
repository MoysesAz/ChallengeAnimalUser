//
//  ImagesFormTableViewController.swift
//  ChallengeAnimalUser
//
//  Created by Robson Lima Lopes on 01/12/22.
//

import UIKit
import Photos
import PhotosUI

class ImagesFormTableViewController: ModelFormTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (form == .rgData) ? 2 : 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell")
                as? ImageFormTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")

        }
        cell.button.tag = indexPath.row
        cell.delegate = self
        cell.configure(
            image: viewModel.getImageFromModel(
                form: self.form!,
                buttonTag: cell.button.tag
            ),
            isHorizontal: form == .rgData ? true : false
        )

        return cell
    }

}

extension ImagesFormTableViewController: ImageCellDelegate {

    func chooseImageAction(buttonTag: Int) {

        tableView.tag = buttonTag

        let alertVC = UIAlertController(
            title: "Escolha uma imagem",
            message: "Escolha uma imagem da biblioteca ou câmera",
            preferredStyle: .actionSheet
        )

        let cameraAction: UIAlertAction = buildCameraAction()
        let libraryAction: UIAlertAction = buildLibraryAction()
        let cancelAction = UIAlertAction(
            title: "Cancelar",
            style: .cancel
        )

        alertVC.addAction(cameraAction)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)

        self.present(alertVC, animated: true)

    }

    func buildCameraAction() -> UIAlertAction {
        let cameraAction = UIAlertAction(
            title: "Câmera",
            style: .default
        ) { [weak self] (_) in
            guard let self = self else {return}

            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self

            self.present(imagePickerController, animated: true)

        }
        return cameraAction
    }

    func buildLibraryAction() -> UIAlertAction {
        let libraryAction = UIAlertAction(
            title: "Galeria",
            style: .default
        ) { [weak self] (_) in
            guard let self = self else {return}

            let phPickerViewController = PHPickerViewController(
                configuration: self.libraryImagePickerConfiguration()
            )

            phPickerViewController.delegate = self

            self.present(phPickerViewController, animated: true)
        }
        return libraryAction
    }

    func libraryImagePickerConfiguration() -> PHPickerConfiguration {
        var pickerConfiguration = PHPickerConfiguration(photoLibrary: .shared())
        pickerConfiguration.selectionLimit = 1
        pickerConfiguration.filter = PHPickerFilter.any(of: [.images, .livePhotos])
        return pickerConfiguration
    }

    func changeImage(_ image: UIImage) {
        let indexPath = IndexPath(row: tableView.tag, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageFormTableViewCell else {
            fatalError("Could not convert TableViewCell in IMageTableViewCell")
        }
        cell.image.image = image
        viewModel.saveImage(
            image: image,
            tableViewTag: tableView.tag,
            form: form!
        )
        tableView.reloadData()
    }
}

extension ImagesFormTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Could not load image from CameraPicker")
        }
        changeImage(image)
        self.dismiss(animated: true)
    }
}

extension ImagesFormTableViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
         picker.dismiss(animated: true, completion: .none)
         results.forEach { result in
               result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
               guard let image = reading as? UIImage, error == nil else { return }
               DispatchQueue.main.async {
                   self.changeImage(image)
               }
          }
       }
  }
}

protocol ImageCellDelegate: AnyObject {
    func chooseImageAction(buttonTag: Int)
}

protocol PushButtonFormDelegate: AnyObject {
    func goToNextView()
}
