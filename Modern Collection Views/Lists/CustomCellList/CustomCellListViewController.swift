/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A compositional list layout using custom cells
*/

import UIKit

private enum Section: Hashable {
    case main
}

class CustomCellListViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    private(set) var collectionView: UICollectionView! = nil
    lazy var items: [Item] = Item.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationItem.title = "List with Custom Cells"
      
        configureHierarchy()
        configureDataSource()
    }
}

extension CustomCellListViewController {
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension CustomCellListViewController {
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
  
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<CustomListCell, Item> { (cell, indexPath, item) in
            cell.updateWithItem(item)
            cell.accessories = [.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension CustomCellListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
