
import UIKit

class LocationCell: UITableViewCell {

  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let selectionView = UIView(frame: CGRect.zero)
    selectionView.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
    selectedBackgroundView = selectionView
    backgroundColor = UIColor.black
    descriptionLabel.textColor = UIColor.white
    descriptionLabel.highlightedTextColor = descriptionLabel.textColor
    addressLabel.textColor = UIColor(white: 1.0, alpha: 0.4)
    addressLabel.highlightedTextColor = addressLabel.textColor
    photoImageView.layer.cornerRadius = photoImageView.bounds.size.width / 2
    photoImageView.clipsToBounds = true
    separatorInset = UIEdgeInsets(top: 0, left: 82, bottom: 0, right: 0)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

  func configure(for location: Location) {
    if location.locationDescription.isEmpty {
      descriptionLabel.text = "(No Description)"
    } else {
      descriptionLabel.text = location.locationDescription
    }
    
    if let placemark = location.placemark {
      var line = ""
      
      line.add(text: placemark.subThoroughfare)
      line.add(text: placemark.thoroughfare, separatedBy: " ")
      line.add(text: placemark.locality, separatedBy: ", ")
      
      addressLabel.text = line
    } else {
      addressLabel.text = String(format: "Lat: &.8f, Long %.8f",
                                 location.latitude, location.longitude)
    }
    photoImageView.contentMode = .scaleAspectFill
    photoImageView.clipsToBounds = true
    photoImageView.image = thumbnail(for: location)
  }
  
  func thumbnail(for location: Location) -> UIImage {
    if location.hasPhoto, let image = location.photoImage {
      return image.resizedImage(withBounds: CGSize(width: 52, height: 52))
    }
    return UIImage(named: "No Photo")!
  }
}
