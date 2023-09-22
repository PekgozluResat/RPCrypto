//
//  MarketDataModel.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 20/03/2023.
//

import Foundation

/*
 URL Column: https://api.coingecko.com/api/v3/global
 
 JSON Response Column
 
 {
   "data": {
     "active_cryptocurrencies": 11244,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 685,
     "total_market_cap": {
       "btc": 43217167.40889968,
       "eth": 683554321.4802127,
       "ltc": 14737926252.012999,
       "bch": 9022159655.237953,
       "bnb": 3582982139.0254316,
       "eos": 1004537123478.1487,
       "xrp": 3169683322605.8384,
       "xlm": 13673065919561.23,
       "link": 164371348468.5746,
       "dot": 190235720517.87198,
       "yfi": 136563880.13773745,
       "usd": 1215899689445.6987,
       "aed": 4465689504913.252,
       "ars": 248645419152194.75,
       "aud": 1812370225200.4902,
       "bdt": 128015743464355.31,
       "bhd": 458622772062.64264,
       "bmd": 1215899689445.6987,
       "brl": 6374834402296.392,
       "cad": 1662185943259.224,
       "chf": 1125846510746.2793,
       "clp": 1003445536708850.9,
       "cny": 8364660323572.724,
       "czk": 27229978704960.633,
       "dkk": 8448841922671.797,
       "eur": 1134805259658.1174,
       "gbp": 992918277197.6292,
       "hkd": 9534872582187.516,
       "huf": 450077429045219.94,
       "idr": 18668544933088024,
       "ils": 4463908211868.214,
       "inr": 100397508534160.02,
       "jpy": 160178369438663.03,
       "krw": 1588258415329139.5,
       "kwd": 372759583693.0572,
       "lkr": 419496497670629.44,
       "mmk": 2553372013969993,
       "mxn": 22894419648410.65,
       "myr": 5454526006853.404,
       "ngn": 559788058023905.56,
       "nok": 12971306647684.03,
       "nzd": 1947658520046.356,
       "php": 66059826479885.78,
       "pkr": 342743797630522.5,
       "pln": 5338444063502.025,
       "rub": 93776270843897.52,
       "sar": 4567891953309.609,
       "sek": 12635877616256.328,
       "sgd": 1627564415501.9492,
       "thb": 41494197696620.47,
       "try": 23125134182683.574,
       "twd": 37131508270299.84,
       "uah": 44907388623653.43,
       "vef": 121748035904.19756,
       "vnd": 28676893824943624,
       "zar": 22546247988237.55,
       "xdr": 911084580398.8687,
       "xag": 54341888686.477135,
       "xau": 617567611.2663637,
       "bits": 43217167408899.68,
       "sats": 4321716740889968
     },
     "total_volume": {
       "btc": 6589081.302918832,
       "eth": 104217728.0287725,
       "ltc": 2247009698.5333147,
       "bch": 1375558535.195321,
       "bnb": 546277371.618828,
       "eos": 153156191746.0304,
       "xrp": 483263998298.3909,
       "xlm": 2084656362406.686,
       "link": 25060785883.59328,
       "dot": 29004182929.246647,
       "yfi": 20821135.74811275,
       "usd": 185381467372.6541,
       "aed": 680858857385.58,
       "ars": 37909585024185.53,
       "aud": 276322014625.5158,
       "bdt": 19517848862221.695,
       "bhd": 69923664915.35643,
       "bmd": 185381467372.6541,
       "brl": 971935568380.7491,
       "cad": 253424251920.04742,
       "chf": 171651559754.63284,
       "clp": 152989763578630.12,
       "cny": 1275313266643.4343,
       "czk": 4151603502056.132,
       "dkk": 1288147967155.5112,
       "eur": 173017450406.23492,
       "gbp": 151384730834.11755,
       "hkd": 1453729025379.5635,
       "huf": 68620803962661.664,
       "idr": 2846289281466867,
       "ils": 680587273535.879,
       "inr": 15307050091530.055,
       "jpy": 24421505676537.61,
       "krw": 242152932644392.66,
       "kwd": 56832581833.90193,
       "lkr": 63958299332507.13,
       "mmk": 389298438684374.56,
       "mxn": 3490584910834.648,
       "myr": 831621262633.7264,
       "ngn": 85347773763696.28,
       "nok": 1977663026778.5903,
       "nzd": 296948668974.20166,
       "php": 10071774566211.902,
       "pkr": 52256241768256.375,
       "pln": 813922893943.6594,
       "rub": 14297546783404.734,
       "sar": 696441096625.5883,
       "sek": 1926522026755.9626,
       "sgd": 248145700018.07877,
       "thb": 6326389687587.825,
       "try": 3525760673505.6714,
       "twd": 5661234679684.85,
       "uah": 6846779936856.54,
       "vef": 18562246328.02382,
       "vnd": 4372206608080781,
       "zar": 3437501113033.954,
       "xdr": 138908001935.53635,
       "xag": 8285205722.104481,
       "xau": 94157101.09324458,
       "bits": 6589081302918.832,
       "sats": 658908130291883.1
     },
     "market_cap_percentage": {
       "btc": 44.71135467342275,
       "eth": 17.590921754627743,
       "usdt": 6.284872577463297,
       "bnb": 4.403145097499699,
       "usdc": 2.9735523979416625,
       "xrp": 1.6036684987470642,
       "ada": 0.9864358389209963,
       "matic": 0.8559986735883309,
       "steth": 0.851399287102788,
       "doge": 0.8419413347736872
     },
     "market_cap_change_percentage_24h_usd": 0.5997668356607428,
     "updated_at": 1679325756
   }
 }
 */



struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
            case totalMarketCap = "total_market_cap"
            case totalVolume = "total_volume"
            case marketCapPercentage = "market_cap_percentage"
            case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        }
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }        
        return ""
    }
    
    var volume: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return "\(item.value.asPresentString())"
        }
        
        return ""
    }
}
