import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    /*
     func numberOfRowsInSection() -> Int{
         return self.cryptoCurrencyList.count
     }
     
     func cryptoAtIndex(index: Int) -> CryptoViewModel {
         let crypto = self.cryptoCurrencyList[index]
         return CryptoViewModel(cryptoCurrency: crypto)
     }
     */
}


//Extension örneği
extension String {
    func printMyName(){
        print("Bilgehan KAYA")
    }
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
}

extension CryptoViewModel {
    var name: String {
        return self.cryptoCurrency.currency
    }
    var price: String {
        return self.cryptoCurrency.price
    }
}
