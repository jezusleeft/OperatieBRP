/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.business.bedrijfsregels;

import java.util.List;
import java.util.Map;

import nl.bzk.brp.model.objecttype.operationeel.statisch.SoortActie;


/**
 * Standaard implementatie van de {@link BedrijfsRegelManager} interface. Deze bedrijfsregelmanager bepaalt welke
 * bedrijfsregels uitgevoerd dienen te worden voor een bepaalde soort actie.
 */
public class BedrijfsRegelManagerImpl implements BedrijfsRegelManager {

    private Map<SoortActie, List<? extends BedrijfsRegel>> bedrijfsRegelsPerActie;

    /**
     * Constructor voor de bedrijfsregelmanager, als argument wordt een map meegegeven met per soort actie de
     * bedrijfsregels die dienen te worden uitgevoerd.
     *
     * @param bedrijfsRegelsPerActie De map die per soort actie een lijst van bedrijfsregels kent.
     */
    public BedrijfsRegelManagerImpl(final Map<SoortActie, List<? extends BedrijfsRegel>> bedrijfsRegelsPerActie) {
        this.bedrijfsRegelsPerActie = bedrijfsRegelsPerActie;
    }

    /** {@inheritDoc} */
    @Override
    public List<? extends BedrijfsRegel> getUitTeVoerenBedrijfsRegels(final SoortActie soortActie) {
        return bedrijfsRegelsPerActie.get(soortActie);
    }
}
