import Foundation
import UIKit
import Delirium

enum StickyCellIdentifier: String {
    case stickyCell
}

class StickyCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var stickyCollectionViewLayout: StickyCollectionViewLayout!

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        stickyCollectionViewLayout.preferredItemSize = CGSize(width: 150, height: 150)
    }
}

extension StickyCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Row(rawValue: section) else {
            return 0
        }

        return viewModel.rows(in: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .stickyCell, for: indexPath) as! StickyCell

        let row = Row(rawValue: indexPath.section)!
        let column = viewModel.row(in: row)[indexPath.row]
        cell.label.text = "\(row): \(column)"

        if indexPath.row  == 0 {
            cell.backgroundColor = UIColor.darkGray
            cell.label.textColor = UIColor.white

        } else if indexPath.section == 0 {
            cell.backgroundColor = UIColor.gray
            cell.label.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.white
            cell.label.textColor = UIColor.gray
        }

        return cell
    }

}

extension StickyCollectionViewController: UICollectionViewDelegate {


}

extension UICollectionView {

    func dequeueReusableCell(withReuseIdentifier identifier: StickyCellIdentifier, for indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath)
    }
}
