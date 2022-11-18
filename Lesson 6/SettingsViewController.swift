import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var maximumValueTF: UITextField!
    @IBOutlet var minimumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = randomNumber.minimumValue.formatted()
        maximumValueTF.text = randomNumber.maximumValue.formatted()
        
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed() {
        view.endEditing(true)
        delegate.setNewValueLabel(for: randomNumber)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        if textField == minimumValueTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}
