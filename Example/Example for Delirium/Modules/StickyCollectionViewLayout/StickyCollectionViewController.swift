import Foundation
import UIKit
import Delirium

enum StickyCell: String {
    case stickyCell
}

class StickyCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

}

extension StickyCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .stickyCell, for: indexPath)
        return cell
    }

}

extension StickyCollectionViewController: UICollectionViewDelegate {


}

extension UICollectionView {

    func dequeueReusableCell(withReuseIdentifier identifier: StickyCell, for indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath)
    }
}
