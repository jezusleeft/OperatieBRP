/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.preview.model;

public class BerichtKenmerken {

    private Gemeente verzendendePartij;

    private String   burgerZakenModuleNaam;

    private boolean  isPrevalidatie;

    public BerichtKenmerken() {
    }

    public BerichtKenmerken(final Gemeente verzendendePartij, final String burgerZakenModuleNaam) {
        this.verzendendePartij = verzendendePartij;
        this.burgerZakenModuleNaam = burgerZakenModuleNaam;
    }

    public Gemeente getVerzendendePartij() {
        return verzendendePartij;
    }

    public void setVerzendendePartij(final Gemeente verzendendePartij) {
        this.verzendendePartij = verzendendePartij;
    }

    public String getBurgerZakenModuleNaam() {
        return burgerZakenModuleNaam;
    }

    public void setBurgerZakenModuleNaam(final String burgerZakenModuleNaam) {
        this.burgerZakenModuleNaam = burgerZakenModuleNaam;
    }

    public boolean isPrevalidatie() {
        return isPrevalidatie;
    }

    public void setPrevalidatie(final boolean isPrevalidatie) {
        this.isPrevalidatie = isPrevalidatie;
    }

}
