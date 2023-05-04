//
//  HomeViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setCompositionLayout())
    private var movieModel: [MovieModel] = MovieModel.moviedummyData()

    // MARK: - Properties

    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setRegister()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .clear
        
        homeCollectionView.do {
            $0.showsVerticalScrollIndicator = true
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(homeCollectionView)
        
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func setRegister() {
        homeCollectionView.registerCell(MovieCollectionViewCell.self)
    }
    
    private func setCompositionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemFractionalWidthFraction: CGFloat = 1.0 / 1.0
                let groupFractionalHeightFraction: CGFloat = 1.0 / 1.4
                let itemInset: CGFloat = 0
                
                let section = self.getNSCollectionLayoutSection(fractionalWidth: itemFractionalWidthFraction, fractionalHeight: groupFractionalHeightFraction, itemInset: itemInset, leadingInset: 0, bottomInset: 0, absoluteHeaderHeightOf: 0, orthogonalBehavior: .paging)
                
                return section
            default:
                let itemFractionalWidthFraction = 1.0 / 5.0
                let groupFractionalHeightFraction = 1.0 / 4.0
                let itemInset: CGFloat = 0

                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(groupFractionalHeightFraction)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
            }
        }
    }
    
    private func getNSCollectionLayoutSection(fractionalWidth: CGFloat, fractionalHeight: CGFloat, itemInset: CGFloat, leadingInset: CGFloat = 15, topInset: CGFloat = 4, bottomInset: CGFloat = 0, absoluteHeaderHeightOf absoluteSize: CGFloat, orthogonalBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .continuous) -> NSCollectionLayoutSection {
            
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: 0, bottom: itemInset, trailing: itemInset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalWidth), heightDimension: .fractionalHeight(fractionalHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: topInset, leading: leadingInset, bottom: bottomInset, trailing: 0)
        
//        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(absoluteSize))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
//        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = orthogonalBehavior
        
        return section
    }
    
    // MARK: - @objc Methods
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return movieModel.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueCell(type: MovieCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        default:
            let cell = UICollectionViewCell()
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
