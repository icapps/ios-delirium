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
        stickyCollectionViewLayout.preferredItemSize = CGSize(width: 150, height: 44)
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

        cell.backgroundColor = #colorLiteral(red: 0.9749236703, green: 0.9814293981, blue: 0.9876012206, alpha: 1)
        cell.label.textColor = #colorLiteral(red: 0.5588112473, green: 0.5820820928, blue: 0.610796988, alpha: 1)
        if indexPath.row  == 0 {
           cell.label.font = UIFont.boldSystemFont(ofSize: 20)
        } else if indexPath.section == 0 {
            cell.label.font = UIFont.boldSystemFont(ofSize: 20)
        } else {
            cell.label.font = UIFont.italicSystemFont(ofSize: 16)
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
