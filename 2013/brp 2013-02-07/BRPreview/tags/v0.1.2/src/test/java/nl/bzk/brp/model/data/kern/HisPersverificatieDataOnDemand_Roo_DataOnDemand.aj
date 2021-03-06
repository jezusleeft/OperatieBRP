// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.kern;

import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import nl.bzk.brp.model.data.kern.Actie;
import nl.bzk.brp.model.data.kern.ActieDataOnDemand;
import nl.bzk.brp.model.data.kern.HisPersverificatie;
import nl.bzk.brp.model.data.kern.HisPersverificatieDataOnDemand;
import nl.bzk.brp.model.data.kern.Persverificatie;
import nl.bzk.brp.model.data.kern.PersverificatieDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect HisPersverificatieDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HisPersverificatieDataOnDemand: @Component;
    
    private Random HisPersverificatieDataOnDemand.rnd = new SecureRandom();
    
    private List<HisPersverificatie> HisPersverificatieDataOnDemand.data;
    
    @Autowired
    private ActieDataOnDemand HisPersverificatieDataOnDemand.actieDataOnDemand;
    
    @Autowired
    private PersverificatieDataOnDemand HisPersverificatieDataOnDemand.persverificatieDataOnDemand;
    
    public HisPersverificatie HisPersverificatieDataOnDemand.getNewTransientHisPersverificatie(int index) {
        HisPersverificatie obj = new HisPersverificatie();
        setActieinh(obj, index);
        setActieverval(obj, index);
        setDat(obj, index);
        setPersverificatie(obj, index);
        setTsreg(obj, index);
        setTsverval(obj, index);
        return obj;
    }
    
    public void HisPersverificatieDataOnDemand.setActieinh(HisPersverificatie obj, int index) {
        Actie actieinh = actieDataOnDemand.getRandomActie();
        obj.setActieinh(actieinh);
    }
    
    public void HisPersverificatieDataOnDemand.setActieverval(HisPersverificatie obj, int index) {
        Actie actieverval = actieDataOnDemand.getRandomActie();
        obj.setActieverval(actieverval);
    }
    
    public void HisPersverificatieDataOnDemand.setDat(HisPersverificatie obj, int index) {
        BigDecimal dat = BigDecimal.valueOf(index);
        obj.setDat(dat);
    }
    
    public void HisPersverificatieDataOnDemand.setPersverificatie(HisPersverificatie obj, int index) {
        Persverificatie persverificatie = persverificatieDataOnDemand.getRandomPersverificatie();
        obj.setPersverificatie(persverificatie);
    }
    
    public void HisPersverificatieDataOnDemand.setTsreg(HisPersverificatie obj, int index) {
        Date tsreg = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setTsreg(tsreg);
    }
    
    public void HisPersverificatieDataOnDemand.setTsverval(HisPersverificatie obj, int index) {
        Date tsverval = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setTsverval(tsverval);
    }
    
    public HisPersverificatie HisPersverificatieDataOnDemand.getSpecificHisPersverificatie(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        HisPersverificatie obj = data.get(index);
        Long id = obj.getId();
        return HisPersverificatie.findHisPersverificatie(id);
    }
    
    public HisPersverificatie HisPersverificatieDataOnDemand.getRandomHisPersverificatie() {
        init();
        HisPersverificatie obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return HisPersverificatie.findHisPersverificatie(id);
    }
    
    public boolean HisPersverificatieDataOnDemand.modifyHisPersverificatie(HisPersverificatie obj) {
        return false;
    }
    
    public void HisPersverificatieDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = HisPersverificatie.findHisPersverificatieEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'HisPersverificatie' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<HisPersverificatie>();
        for (int i = 0; i < 10; i++) {
            HisPersverificatie obj = getNewTransientHisPersverificatie(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
