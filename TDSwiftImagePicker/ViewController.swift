import UIKit

class ViewController: UIViewController {
    var imagePicker: TDSwiftImagePicker!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func pickImageBtnClicked(_ sender: UIButton) { imagePicker.present() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init picker
        self.imagePicker = TDSwiftImagePicker(presentOn: self, rectCropping: true, mediaTypes: [.publicImage, .publicMovie])
        self.imagePicker.delegate = self
    }
}

extension ViewController: TDSwiftImagePickerDelegate {
    func didSelect(mediaInfo: [UIImagePickerController.InfoKey : Any]) {
        self.imageView.image = mediaInfo[.editedImage] as? UIImage
    }
    
    func didCancel() {
        // Cancel alert
        let canceledAlert = UIAlertController(title: "Image Picker", message: "User canceled", preferredStyle: .alert)
        canceledAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Present alert
        self.present(canceledAlert, animated: true, completion: nil)
    }
}
