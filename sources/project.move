module SendMessage::EthicalSourcing {

    use aptos_framework::signer;
    use std::string::String;
    use std::vector;

    /// Tracks supplier's ethical compliance
    struct Supplier has key, store {
        owner: address,
        certifications: vector<String>,
        materials: vector<Material>
    }

    /// Records material sourcing details
    struct Material has store {
        name: String,
        origin: String,
        sustainability_score: u8
    }

    /// Initialize supplier profile
    public fun create_supplier(owner: &signer) {
        move_to(owner, Supplier {
            owner: signer::address_of(owner),
            certifications: vector::empty(),
            materials: vector::empty()
        });
    }

    /// Add material with sustainability data
    public fun add_material(
        supplier: &signer,
        name: String,
        origin: String,
        score: u8,
        certs: vector<String>
    ) acquires Supplier {
        let supplier_addr = signer::address_of(supplier);
        let supplier = borrow_global_mut<Supplier>(supplier_addr);
        
        let material = Material { name, origin, sustainability_score: score };
        vector::push_back(&mut supplier.materials, material);
        
        vector::append(&mut supplier.certifications, certs);
    }
}
