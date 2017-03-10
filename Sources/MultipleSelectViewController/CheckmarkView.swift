import UIKit

public class CheckmarkView: UIView {
	public var action: ((Bool) -> ())?
	public var checked: Bool = false {
		didSet {
			imageView?.isHidden = !checked
		}
	}

	@IBOutlet public weak var imageView: UIImageView? {
		didSet {
			imageView?.isHidden = true
			imageView?.isUserInteractionEnabled = false
		}
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.gray.cgColor
		self.layer.cornerRadius = 4
		let tap = UITapGestureRecognizer(target: self, action: #selector(self.toggle))
		addGestureRecognizer(tap)
	}

	public func toggle() {
		checked = !checked
		imageView?.isHidden = !checked
		guard let action = action else {
			return
		}
		action(checked)
	}

}
