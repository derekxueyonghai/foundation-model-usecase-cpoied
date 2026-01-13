//
//  ViewModel.swift
//  Tutorial
//
//  Created by Talal El Zeini on 10/25/25.
//

import FoundationModels
import Foundation
import Combine

@MainActor
class ViewModel: ObservableObject {
    @Published var userInput = ""
    @Published var output = ""
    @Published var isProcessing = false
    @Published var errorMessage: String?

    private let model = SystemLanguageModel.default

    func runModel() async {
        guard model.isAvailable else {
            errorMessage = "Model not available on this device"
            return
        }

        isProcessing = true
        errorMessage = nil

        let prompt = userInput.isEmpty ? "Hello!" : userInput
        let session = LanguageModelSession()

        do {
            let response = try await session.respond(to: prompt)
            output = response.content
        } catch {
            let nsError = error as NSError
            // Print full error details to the console for diagnostics
            print("LanguageModel error domain=\(nsError.domain) code=\(nsError.code) userInfo=\(nsError.userInfo)")

            // If the error looks like an entitlement/provisioning generation failure,
            // give an actionable error message pointing to the entitlements/capability.
            if nsError.code == -1 || nsError.domain.contains("GenerationError") || nsError.domain.contains("FoundationModels") {
                errorMessage = "The operation couldn't be completed. (FoundationModels.LanguageModelSession.GenerationError). This often means your app is missing the Foundation Models capability/entitlement. In Xcode open your target -> Signing & Capabilities -> add the entitlements file or add the 'Foundation Models' capability. Make sure Code Signing Entitlements is set and provisioning allows it."
            } else {
                errorMessage = error.localizedDescription
            }
        }

        isProcessing = false
    }

}
