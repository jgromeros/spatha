// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.db.dossier;

import co.qcsc.spatha.db.dossier.DossierItemFileRepository;
import co.qcsc.spatha.domain.dossier.DossierItemFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect DossierItemFileRepository_Roo_Jpa_Repository {
    
    declare parents: DossierItemFileRepository extends JpaRepository<DossierItemFile, Long>;
    
    declare parents: DossierItemFileRepository extends JpaSpecificationExecutor<DossierItemFile>;
    
    declare @type: DossierItemFileRepository: @Repository;
    
}
