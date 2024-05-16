//
//  BaseController.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit

class BaseController<View: BaseView>: UIViewController {

    var content: View {
        view as? View ?? View()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func loadView() {
        super.loadView()
        view = View()

        onConfigureController()
        onConfigureActions()
        onBindViewModel()
    }

    func onConfigureController() {}

    func onConfigureActions() {}

    func onBindViewModel() {}
}

class VMController<View: BaseView, VMInput>: BaseController<View> {
    lazy var viewModel: VMInput = Swinjectable.container.resolve(VMInput.self)!
}
