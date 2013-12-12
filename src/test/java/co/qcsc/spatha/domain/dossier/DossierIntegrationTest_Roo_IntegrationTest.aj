// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.db.dossier.DossierRepository;
import co.qcsc.spatha.domain.dossier.DossierDataOnDemand;
import co.qcsc.spatha.domain.dossier.DossierIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DossierIntegrationTest_Roo_IntegrationTest {
    
    declare @type: DossierIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: DossierIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: DossierIntegrationTest: @Transactional;
    
    @Autowired
    DossierDataOnDemand DossierIntegrationTest.dod;
    
    @Autowired
    DossierRepository DossierIntegrationTest.dossierRepository;
    
    @Test
    public void DossierIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", dod.getRandomDossier());
        long count = dossierRepository.count();
        Assert.assertTrue("Counter for 'Dossier' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void DossierIntegrationTest.testFind() {
        Dossier obj = dod.getRandomDossier();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to provide an identifier", id);
        obj = dossierRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Dossier' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Dossier' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void DossierIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", dod.getRandomDossier());
        long count = dossierRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Dossier', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Dossier> result = dossierRepository.findAll();
        Assert.assertNotNull("Find all method for 'Dossier' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Dossier' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void DossierIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", dod.getRandomDossier());
        long count = dossierRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Dossier> result = dossierRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Dossier' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Dossier' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void DossierIntegrationTest.testFlush() {
        Dossier obj = dod.getRandomDossier();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to provide an identifier", id);
        obj = dossierRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Dossier' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyDossier(obj);
        Integer currentVersion = obj.getVersion();
        dossierRepository.flush();
        Assert.assertTrue("Version for 'Dossier' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void DossierIntegrationTest.testSaveUpdate() {
        Dossier obj = dod.getRandomDossier();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to provide an identifier", id);
        obj = dossierRepository.findOne(id);
        boolean modified =  dod.modifyDossier(obj);
        Integer currentVersion = obj.getVersion();
        Dossier merged = dossierRepository.save(obj);
        dossierRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Dossier' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void DossierIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", dod.getRandomDossier());
        Dossier obj = dod.getNewTransientDossier(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Dossier' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Dossier' identifier to be null", obj.getId());
        try {
            dossierRepository.save(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        dossierRepository.flush();
        Assert.assertNotNull("Expected 'Dossier' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void DossierIntegrationTest.testDelete() {
        Dossier obj = dod.getRandomDossier();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Dossier' failed to provide an identifier", id);
        obj = dossierRepository.findOne(id);
        dossierRepository.delete(obj);
        dossierRepository.flush();
        Assert.assertNull("Failed to remove 'Dossier' with identifier '" + id + "'", dossierRepository.findOne(id));
    }
    
}