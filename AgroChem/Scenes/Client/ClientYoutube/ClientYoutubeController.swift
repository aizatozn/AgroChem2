//
//  ClientYoutubeController.swift
//  AgroChem
//
//  Created by Abdulmajit Kubatbekov on 16/6/24.
//

import UIKit
import SnapKit
import WebKit

final class ClientYoutubeController: UIViewController {
    
    private var randomTrendingMovie: Medicine_Youtube?
    private let firstData: [Medicine_Youtube] = [
        Medicine_Youtube(
                youtubeID: "upEHfwvXTsM",
                title: "Качественное применение",
                image: "https://preview.redd.it/exploring-the-captivating-world-of-history-with-the-movie-v0-hc6tfgvqc3fb1.jpg?width=870&format=pjpg&auto=webp&s=1b5ef17ca355c27267f6c125ecb12d4cf9e8add2",
                description: "В этом видео вы узнаете о важности правильного применения средств защиты растений для здоровья и урожайности ваших культур. Эксперты расскажут о методах и техниках использования гербицидов, инсектицидов и фунгицидов, а также о том, как избежать распространенных ошибок. Видеоматериал включает практические советы, пошаговые инструкции и реальные примеры, которые помогут вам эффективно использовать средства защиты растений на ваших полях."),
        Medicine_Youtube(
                youtubeID: "yB_ycoIRn24",
                title: "БИОПРЕПАРАТЫ. Проверенные эффективные биопрепараты для защиты растений",
                image: "https://moviesmedia.ign.com/movies/image/object/800/800318/avatar-final-imax-1sheet.jpg",
                description: "В этом видео мы рассмотрим самые эффективные и проверенные биопрепараты для защиты растений. Узнайте, как использовать биологические средства для борьбы с вредителями и болезнями, сохраняя экологическое равновесие и улучшая здоровье ваших культур. Видео содержит подробные инструкции по применению, примеры успешного использования и советы от экспертов в области агрономии."),
        Medicine_Youtube(
                youtubeID: "LQJAsAQQZtU",
                title: "Third Title",
                image: "https://moviesmedia.ign.com/movies/image/object/800/800318/avatar-final-imax-1sheet.jpg",
                description: "Third description"),
    ]
    
    private let secondData: [Medicine_Youtube] = [
        Medicine_Youtube(
                youtubeID: "LQJAsAQQZtU",
                title: "First",
                image: "https://preview.redd.it/exploring-the-captivating-world-of-history-with-the-movie-v0-hc6tfgvqc3fb1.jpg?width=870&format=pjpg&auto=webp&s=1b5ef17ca355c27267f6c125ecb12d4cf9e8add2",
                description: "First description"),
        Medicine_Youtube(
                youtubeID: "FIpvVOxNIAc",
                title: "Минеральные удобрения",
                image: "https://moviesmedia.ign.com/movies/image/object/800/800318/avatar-final-imax-1sheet.jpg",
                description: "В этом видео вы узнаете о процессе производства минеральных удобрений, начиная от добычи сырья до конечного продукта. Показаны основные этапы технологического процесса, включая обработку и смешивание компонентов. Эксперты расскажут о контроле качества и экологических аспектах производства. Видео также освещает современные технологии и инновации, применяемые в отрасли, что позволяет улучшить эффективность и безопасность производственного процесса."),
        Medicine_Youtube(
                youtubeID: "LQJAsAQQZtU",
                title: "Third Title",
                image: "https://moviesmedia.ign.com/movies/image/object/800/800318/avatar-final-imax-1sheet.jpg",
                description: "Third description"),
    ]
    
    private let thirdData: [Medicine_Youtube] = [
        Medicine_Youtube(
                youtubeID: "HO6ebtWczX8",
                title: "Eight",
                image: "https://popcornforone.co.uk/wp-content/uploads/2019/06/mHP0043_1024x1024.jpeg",
                description: "First description"),
        Medicine_Youtube(
                youtubeID: "HO6ebtWczX8",
                title: "Nignth",
                image: "https://popcornforone.co.uk/wp-content/uploads/2019/06/mHP0043_1024x1024.jpeg",
                description: "Second description"),
        Medicine_Youtube(
                youtubeID: "YAdH0-y7fxI",
                title: "ПАСЛЕНОВЫЕ КУЛЬТУРЫ",
                image: "https://popcornforone.co.uk/wp-content/uploads/2019/06/mHP0043_1024x1024.jpeg",
                description: "Это видео, которое предлагает агрономам и фермерам комплексные советы по эффективному уходу за основными сельскохозяйственными культурами, такими как пшеница, кукуруза и соя. Видео включает рекомендации по посеву, поливу, удобрению и защите от болезней и вредителей, помогая повысить урожайность и качество продукции."),
    ]
    
    let sectionTitles: [String] = ["Средства защиты растений", "Минеральные удобрения", "Уход за различными культурами"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
  
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Medicines"
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

extension ClientYoutubeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
        withIdentifier: CollectionViewTableViewCell.identifier,
        for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        cell.delegate = self
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            cell.configure(with: firstData)
         
        case Sections.TrendingTv.rawValue:
            cell.configure(with: secondData)

        case Sections.Popular.rawValue:
            cell.configure(with: thirdData)

        default:
            return UITableViewCell()
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.uppercased()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: -offset)
    }
}


extension ClientYoutubeController: CollectionViewTableCellDelegate {
    
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: Medicine_Youtube) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel.youtubeID, title: viewModel.title, desc: viewModel.description)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
