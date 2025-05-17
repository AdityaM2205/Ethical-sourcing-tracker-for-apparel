# Ethical Sourcing Tracker Smart Contract

Aptos-based solution for tracking apparel supply chain compliance with ethical sourcing standards.

## 📑 Overview
Module: SendMessage::EthicalSourcing
Network: Aptos Mainnet/Testnet

text
Tracks material origins, sustainability scores, and supplier certifications through two core functions.

## ✨ Key Features
- **Supplier Profile Management** 
- **Material Origin Tracking** (Name, Source Location)
- **Sustainability Scoring** (1-100 scale)
- **Certification Documentation** (ISO, Fair Trade, etc.)

## 🛠️ Usage

### Prerequisites
- Aptos CLI installed
- Funded developer account

### 📋 Core Functions

#### 1. Create Supplier Profile
aptos move run --function-id <address>::EthicalSourcing::create_supplier

text

#### 2. Add Material Record
aptos move run --function-id <address>::EthicalSourcing::add_material
--args string:"Organic Cotton"
string:"India"
u8:92
vector<string>:"["GOTS", "OEKO-TEX"]"

text

### 📊 Data Structures
struct Supplier {
owner: address,
certifications: [String], // Array of certification IDs
materials: [Material] // Sourced materials list
}

struct Material {
name: String, // e.g., "Recycled Polyester"
origin: String, // e.g., "Vietnam"
sustainability_score: u8 // 0-100 scale
}

text

## 🔄 Example Workflow
1. **Deploy Contract**
2. **Initialize Supplier**
create_supplier(signer)

text
3. **Record Material**
add_material(signer, "Linen", "France", 88, ["ECO-CERT", "BSCI"])

text

## 📌 Notes
- Requires supplier authorization for profile modifications
- Scores automatically validate (0-100 range)
- Certifications stored as immutable records

## 🤝 Contribution Guidelines
PRs welcome for:

Supply chain visualization features

Third-party audit integration

Historical data versioning

text

▶️ **Next Steps**: Implement batch material uploads or sustainability analytics dashboard.
