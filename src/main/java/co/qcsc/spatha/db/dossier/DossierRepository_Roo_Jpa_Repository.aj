// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.db.dossier;

import co.qcsc.spatha.db.dossier.DossierRepository;
import co.qcsc.spatha.domain.dossier.Dossier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect DossierRepository_Roo_Jpa_Repository {
    
    declare parents: DossierRepository extends JpaRepository<Dossier, Long>;
    
    declare parents: DossierRepository extends JpaSpecificationExecutor<Dossier>;
    
    declare @type: DossierRepository: @Repository;
    
}
