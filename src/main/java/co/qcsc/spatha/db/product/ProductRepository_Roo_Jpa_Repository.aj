// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.db.product;

import co.qcsc.spatha.db.product.ProductRepository;
import co.qcsc.spatha.domain.product.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect ProductRepository_Roo_Jpa_Repository {
    
    declare parents: ProductRepository extends JpaRepository<Product, Long>;
    
    declare parents: ProductRepository extends JpaSpecificationExecutor<Product>;
    
    declare @type: ProductRepository: @Repository;
    
}
