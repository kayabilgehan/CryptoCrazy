import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel: CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 75/255, green: 57/225, blue: 204/255, alpha: 1.0),
            UIColor(red: 15/255, green: 147/225, blue: 14/255, alpha: 1.0),
            UIColor(red: 104/255, green: 57/225, blue: 54/255, alpha: 1.0),
            UIColor(red: 120/255, green: 127/225, blue: 64/255, alpha: 1.0),
            UIColor(red: 114/255, green: 57/225, blue: 204/255, alpha: 1.0),
            UIColor(red: 154/255, green: 67/225, blue: 224/255, alpha: 1.0)
        ]
        
        getData()
        
        //Extension örneği
        let myString = "asd"
        myString.printMyName()
    }
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/2be0f55346f62e545f2cc97aa8e28666aa672974/crypto.json")!
        WebService().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //CryptoCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        cell.currencyTextLabel.text = cryptoViewModel.name
        cell.priceTextLabel.text = cryptoViewModel.price
        
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        return cell
    }


}

