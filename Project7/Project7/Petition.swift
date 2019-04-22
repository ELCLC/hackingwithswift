struct Petitions: Codable {
    let results: [Petition]
}

struct Petition: Codable {
    let title: String
    let body: String
    let signatureCount: Int
}
