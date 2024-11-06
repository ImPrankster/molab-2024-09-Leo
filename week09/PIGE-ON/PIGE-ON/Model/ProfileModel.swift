/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An observable state object that contains profile details.
*/

import CoreTransferable
import PhotosUI
import SwiftUI

@MainActor
class ProfileModel: ObservableObject {

    let pigeonDetector = ObjectDetector()

    // MARK: - Profile Details

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var aboutMe: String = ""

    // MARK: - Profile Image

    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }

    enum TransferError: Error {
        case importFailed
    }

    struct ProfileImage: Transferable {
        let image: Image
        let uIImage: UIImage

        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return ProfileImage(image: image, uIImage: uiImage)
            }
        }
    }

    @Published private(set) var imageState: ImageState = .empty

    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }

    // MARK: - Private Methods

    private func loadTransferable(from imageSelection: PhotosPickerItem)
        -> Progress
    {
        return imageSelection.loadTransferable(type: ProfileImage.self) {
            result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let profileImage?):
                    self.checkImageValid(from: profileImage.uIImage)
                    self.imageState = .success(profileImage.image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }

    private func checkImageValid(from image: UIImage) {
        do {
            try pigeonDetector.makePredictions(
                for: image,
                completionHandler: {
                    p in
                    //                    if !(p?.first.debugDescription
                    //                        .localizedCaseInsensitiveContains("pigeon") ?? false)
                    //                    {
                    //                        self.imageState = .failure(AppError.NotPigeonError)
                    //                    }
                    print(p?.first ?? "")
                }
            )
        } catch {
            print("Can not make Image prediction")
        }
    }
}
