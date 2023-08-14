//
//  SwiftUIHelper.swift
//  MC Status
//
//  Created by Tomer Shemesh on 8/13/23.
//

import Foundation
import SwiftData

// random helper function
class SwiftUIHelper {
    static func getModelContainter() -> ModelContainer {
        let config = ModelConfiguration(nil, schema: Schema ([SavedMinecraftServer.self]), inMemory: false, readOnly: false, groupContainer: ModelConfiguration.GroupContainer.identifier("group.shemeshapps.MinecraftServerStatus"), cloudKitDatabase: ModelConfiguration.CloudKitDatabase.private("com.shemeshapps.mcstatus"))

        
        if (UserDefaultHelper.iCloudEnabled()) {
            do {
                return try ModelContainer(for: SavedMinecraftServer.self, config)
            } catch {
                // something broken with icloud? continue with local container without config.
                print("ERROR LOADING ICLOUD MODEL CONTAINTER: " + error.localizedDescription)
            }
        }
        
        // if this is broken then something is f'ed up. just crash
        return try! ModelContainer(for: SavedMinecraftServer.self)
    }
}











//@State private var isShowPhotoLibrary = false
//
//    .sheet(isPresented: $isShowPhotoLibrary) {
//        ImagePicker(sourceType: .photoLibrary)
//    }
//
//struct ImagePicker: UIViewControllerRepresentable {
//
//    var sourceType: UIImagePickerController.SourceType = .photoLibrary
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//
//        let imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = sourceType
//
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//
//    }
//}



//import WidgetKit
//
//extension WidgetCenter {
//    func currentConfigurations() async -> [WidgetInfo] {
//        try await withCheckedThrowingContinuation { continuation in
//            getCurrentConfigurations { result in
//                continuation.resume(with: result)
//            }
//        }
//    }
//}
