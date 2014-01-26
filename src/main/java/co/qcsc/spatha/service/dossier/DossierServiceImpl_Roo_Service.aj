// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.dossier;

import co.qcsc.spatha.db.dossier.DossierRepository;
import co.qcsc.spatha.db.thirdparty.ClientRepository;
import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.service.dossier.DossierServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DossierServiceImpl_Roo_Service {
    
    declare @type: DossierServiceImpl: @Service;
    
    declare @type: DossierServiceImpl: @Transactional;
    
    @Autowired
    ClientRepository DossierServiceImpl.clientRepository;
    
    @Autowired
    DossierRepository DossierServiceImpl.dossierRepository;
    
    public long DossierServiceImpl.countAllClients() {
        return clientRepository.count();
    }
    
    public void DossierServiceImpl.deleteClient(Client client) {
        clientRepository.delete(client);
    }
    
    public Client DossierServiceImpl.findClient(Long id) {
        return clientRepository.findOne(id);
    }
    
    public List<Client> DossierServiceImpl.findAllClients() {
        return clientRepository.findAll();
    }
    
    public List<Client> DossierServiceImpl.findClientEntries(int firstResult, int maxResults) {
        return clientRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void DossierServiceImpl.saveClient(Client client) {
        clientRepository.save(client);
    }
    
    public Client DossierServiceImpl.updateClient(Client client) {
        return clientRepository.save(client);
    }
    
    public long DossierServiceImpl.countAllDossiers() {
        return dossierRepository.count();
    }
    
    public void DossierServiceImpl.deleteDossier(Dossier dossier) {
        dossierRepository.delete(dossier);
    }
    
    public Dossier DossierServiceImpl.findDossier(Long id) {
        return dossierRepository.findOne(id);
    }
    
    public List<Dossier> DossierServiceImpl.findAllDossiers() {
        return dossierRepository.findAll();
    }
    
    public List<Dossier> DossierServiceImpl.findDossierEntries(int firstResult, int maxResults) {
        return dossierRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void DossierServiceImpl.saveDossier(Dossier dossier) {
        dossierRepository.save(dossier);
    }
    
    public Dossier DossierServiceImpl.updateDossier(Dossier dossier) {
        return dossierRepository.save(dossier);
    }
    
}
