import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValueLabel(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getRundomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRundomNumberButton.layer.cornerRadius = 10
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
    @IBAction func getRandomButtonTapped() {
        randomValueLabel.text = randomNumber.getRandom.formatted()
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewValueLabel(for randomNumber: RandomNumber) {
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
        self.randomNumber = randomNumber
    }
}
