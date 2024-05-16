//
//  GreetingController.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import Combine

final class GreetingController: VMController<GreetingPresentable,
                                GreetingViewModel> {

    override func onBindViewModel() {

        viewModel.counter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
            self?.content.greetingLabel.text = "\(value)"
        }.store(in: &viewModel.cancellables)
    }

    override func onConfigureActions() {

        content.greetingButton.addTarget(self,
                                         action: #selector(greetingButtonAction),
                                         for: .touchDown)

        content.nextButton.addTarget(self,
                                     action: #selector(nextButtonAction),
                                     for: .touchDown)
    }
}

private extension GreetingController {

    @objc private func greetingButtonAction() {
        let count = viewModel.counter.value
        viewModel.counter.send(count + 1)
    }

    @objc private func nextButtonAction() {
        viewModel.nextRoute.send()
    }
}
