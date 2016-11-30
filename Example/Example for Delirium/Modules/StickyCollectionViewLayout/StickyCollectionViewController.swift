import Foundation
import UIKit
import Delirium

enum StickyCellIdentifier: String {
    case stickyCell
}
enum Section: Int {
    case section1, section2, section3, section4
}

enum Row: Int {
    case A, B, C, D, E, F, G, H, last
}

class ViewModel {
    private var model: [Section: [Row]]

    init(_ model: [Section: [Row]]) {
        self.model = model
    }

    var numberOfSection: Int {
        return model.count
    }

    func rows(in section: Section) -> Int {
        guard let rows = model[section] else {
            return 0
        }
        return rows.count
    }
}

class StickyCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let row1: [Row] = [.A, .B, .C, .D, .E, .F, .G, .H, .last]
        let row2 = row1
        let row3 = row1
        viewModel = ViewModel([.section1:row1, .section2:row2, .section3:row3])
    }
}

extension StickyCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }

        return viewModel.rows(in: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .stickyCell, for: indexPath) as! StickyCell

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
