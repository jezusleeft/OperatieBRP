/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.dataaccess.repository.jpa.historie;

import java.util.Date;

import nl.bzk.brp.model.operationeel.kern.HisPersoonNationaliteit;
import nl.bzk.brp.model.operationeel.kern.PersistentPersoonNationaliteit;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

/**
 * Historie repository voor PersoonNationaliteit.
 */
@Repository
@Qualifier("persoonNationaliteitHistorieRepository")
public class PersoonNationaliteitHistorieRepository
        extends AbstractObjectTypeHistorieRepository<HisPersoonNationaliteit, PersistentPersoonNationaliteit>
{

    @Override
    protected HisPersoonNationaliteit maakNieuwHistorieRecord(final PersistentPersoonNationaliteit aLaagObject,
                                                              final Integer datumAanvangGeldigheid,
                                                              final Integer datumEindeGeldigheid,
                                                              final Date registratieTijd)
    {

        final HisPersoonNationaliteit hisPersoonNationaliteit = new HisPersoonNationaliteit();
        hisPersoonNationaliteit.setPersoonNationaliteit(aLaagObject);
        hisPersoonNationaliteit.setDatumAanvangGeldigheid(datumAanvangGeldigheid);
        hisPersoonNationaliteit.setDatumEindeGeldigheid(datumEindeGeldigheid);
        hisPersoonNationaliteit.setDatumTijdRegistratie(registratieTijd);
        return hisPersoonNationaliteit;
    }

    @Override
    protected String padNaarPersoonEntiteitInCLaagEntiteit() {
        return "persoonNationaliteit.pers";
    }

    @Override
    protected Class<HisPersoonNationaliteit> getCLaagDomainClass() {
        return HisPersoonNationaliteit.class;
    }
}
