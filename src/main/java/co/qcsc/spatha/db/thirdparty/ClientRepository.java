package co.qcsc.spatha.db.thirdparty;
import co.qcsc.spatha.domain.thirdparty.Client;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Client.class)
public interface ClientRepository {
}
