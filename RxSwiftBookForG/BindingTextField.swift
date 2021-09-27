//
//  BindingTextField.swift
//  RxSwiftBookForG
//
//  Created by 石川大輔 on 2021/09/27.
//

import UIKit

//class BindingTextField: UITextField {
//
//    var textChangeClosure: (String) -> () = { _ in }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        CommonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        CommonInit()
//    }
//
//    fileprivate func CommonInit() {
//        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
//    }
//
//    func bind(callBack: @escaping (String) -> ()) {
//
//        self.textChangeClosure = callBack
//
//    }
//
//    @objc func textFieldChange(_ sender: UITextField) {
//        if let text = sender.text {
//            textChangeClosure(text)
//        }
//    }
//
//}


protocol BindingTextFieldDelegate {
    
    func textFieldDidChange(text: String)
    
}

class BindingTextField: UITextField {
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
    
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
    
        private func commonInit() {
            self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        }
    
    
        @objc func textFieldChange(_ textField: UITextField) {
            
            
            
        }
}

