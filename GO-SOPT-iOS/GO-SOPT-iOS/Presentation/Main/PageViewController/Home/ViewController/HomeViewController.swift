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
    
    private typealias SectionType = Section
    
    private enum Section: CaseIterable {
        case poster, content, live, paramount, advertising
    }
    
    // MARK: - UI Components
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    var movieModel: [MovieModel] = MovieModel.moviedummyData()
    private var contentModel: [ContentModel] = []

    // MARK: - Properties

    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setRegister()
        fetchContent()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .clear
        
        homeCollectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
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
        homeCollectionView.registerCell(PosterCollectionViewCell.self)
        homeCollectionView.registerCell(ContentCollectionViewCell.self)
        homeCollectionView.registerHeader(SectionHeaderView.self)
    }
    
    private func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[section]
            switch sectionType {
            case .poster:
                return self.getLayoutPosterSection()
            case .content:
                return self.getLayoutContentSection()
            case .live:
                return self.getLayoutLiveSection()
            case .paramount:
                return self.getLayoutContentSection()
            case .advertising:
                return self.getLayoutAdvertisingSection()
            }
        }
    }
    
    private func getLayoutPosterSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(600)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func getLayoutContentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.6),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(55)
        )
        let haeder = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [haeder]
        
        return section
    }
    
    private func getLayoutLiveSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .absolute(80)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(41)
        )
        let haeder = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [haeder]
        
        return section
    }
    
    private func getLayoutAdvertisingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(58)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 49, leading: 0, bottom: 80, trailing: 0)
        return section
    }
    
    // MARK: - @objc Methods
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .poster:
            return movieModel.count
        case .content:
            return contentModel.count
        case .live:
            return movieModel.count
        case .paramount:
            return contentModel.count
        case .advertising:
            return 1

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let cell = collectionView.dequeueCell(type: PosterCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        case .content:
            let cell = collectionView.dequeueCell(type: ContentCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: contentModel[indexPath.row])
            return cell
        case .live:
            let cell = collectionView.dequeueCell(type: PosterCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        case .paramount:
            let cell = collectionView.dequeueCell(type: ContentCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: contentModel[indexPath.row])
            return cell
        case .advertising:
            let cell = collectionView.dequeueCell(type: PosterCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let view = UICollectionReusableView()
            return view
        case .content:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: SectionHeaderView.self, indexPath: indexPath)
            headerView.setSectionTitle(text: "티빙에서 꼭 봐야하는 콘텐츠")
            return headerView
        case .live:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: SectionHeaderView.self, indexPath: indexPath)
            headerView.setSectionTitle(text: "인기 LIVE 채널")
            return headerView
        case .paramount:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: SectionHeaderView.self, indexPath: indexPath)
            headerView.setSectionTitle(text: "1화 무료! 파라마운트+ 인기 시리즈")
            return headerView
        case .advertising:
            let view = UICollectionReusableView()
            return view
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
}

extension HomeViewController {
    
    private func fetchContent() {
        ContentService.shared.content { response in
            switch response {
            case .success(let data):
                guard let data = data as? ContentResponse else { return }
                print("💚💚💚💚💚💚💚💚💚💚성공💚💚💚💚💚💚💚💚💚💚")
                dump(data)
                print("💚💚💚💚💚💚💚💚💚💚성공💚💚💚💚💚💚💚💚💚💚")
                self.contentModel = data.convertToContent()
                self.homeCollectionView.reloadData()
            case .serverErr:
                print("🔥🔥🔥🔥🔥서버 이상 서버 이상🔥🔥🔥🔥🔥")
            case .pathErr:
                print("-----------경로이상-------------")
            case .networkErr:
                print("💧💧💧💧💧네트워크에런데 뭔ㄹ지머름💧💧💧💧💧")
            default:
                return
            }
        }
    }
}
