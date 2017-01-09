import UIKit

public class ShadowCornerView: UIView {

	public var corners: UIRectCorner = .allCorners

	private var cornerView: UIView!

	override public init(frame: CGRect) {
		super.init(frame: frame)
		addCornerView()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		addCornerView()
	}

	override public func awakeFromNib() {
		super.awakeFromNib()
		addCornerView()
	}

	override public var backgroundColor: UIColor? {
		set {
			cornerView.backgroundColor = newValue
		}
		get {
			return cornerView.backgroundColor
		}
	}

	private func addCornerView() {
		cornerView = UIView()
		cornerView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(cornerView)
		cornerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		cornerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
		cornerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		cornerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	}

	override public func layoutSubviews() {
		super.layoutSubviews()

		let shadowPath = UIBezierPath(rect: self.bounds)
		self.layer.masksToBounds = false
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOffset = CGSize(width: -2, height: -2)
		self.layer.shadowOpacity = 0.50
		self.layer.shadowRadius = 4
		self.layer.shadowPath = shadowPath.cgPath

		let cornerPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 4.0, height: 4.0))
		let maskLayer = CAShapeLayer()
		maskLayer.path = cornerPath.cgPath
		cornerView.layer.mask = maskLayer
	}
	
}
