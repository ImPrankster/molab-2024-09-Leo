/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The main content view of the app.
*/

import PhotosUI
import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            ProfileForm()
        }
    }
}

struct ProfileForm: View {
    @StateObject var viewModel = ProfileModel()

    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    EditableCircularProfileImage(viewModel: viewModel)
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
            Section {
                TextField(
                    "First Name",
                    text: $viewModel.firstName,
                    prompt: Text("First Name"))
                TextField(
                    "Last Name",
                    text: $viewModel.lastName,
                    prompt: Text("Last Name"))
            }
            Section {
                TextField(
                    "About Me",
                    text: $viewModel.aboutMe,
                    prompt: Text("About Me"))
            }
        }
        .navigationTitle("Account Profile")
    }
}
