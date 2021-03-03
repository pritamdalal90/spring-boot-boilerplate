package com.terran.boilerplate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;

@SpringBootApplication
@RestController
@EnableAutoConfiguration
public class BoilerplateApplication extends SpringBootServletInitializer {

	public static void main(String[] args) throws JsonProcessingException {
		/*
		 * LicenseAndAttachmentModel model=new LicenseAndAttachmentModel();
		 * List<MultipleTaskAttachmentModel> a1=new
		 * ArrayList<MultipleTaskAttachmentModel>(); MultipleTaskAttachmentModel mo=new
		 * MultipleTaskAttachmentModel(); mo.setCreatedAt(new Date());
		 * mo.setDplLicense(null); mo.setFileStream(""); mo.setPurchaseOrder(null);
		 * mo.setTitle("title1"); mo.setUpdatedAt(new Date());
		 * MultipleTaskAttachmentModel mo1=new MultipleTaskAttachmentModel();
		 * mo1.setCreatedAt(new Date()); mo1.setDplLicense(null); mo1.setFileStream("");
		 * mo1.setPurchaseOrder(null); mo1.setTitle("title"); mo1.setUpdatedAt(new
		 * Date()); a1.add(mo1); a1.add(mo); List<LicenseEntries> en=new
		 * ArrayList<LicenseEntries>(); LicenseEntries e=new LicenseEntries();
		 * 
		 * e.setCreatedAt(new Date()); e.setDplLicense(null); e.setLicenseDate(new
		 * Date()); e.setLicenseNumber("dsdfadfa"); e.setLicenseQuantity(756l);
		 * e.setOnlineDate(new Date()); e.setOnlineID("dfdf"); e.setPurchaseOrder(null);
		 * e.setUpdatedAt(new Date());
		 * 
		 * LicenseEntries e1=new LicenseEntries();
		 * 
		 * e1.setCreatedAt(new Date()); e1.setDplLicense(null); e1.setLicenseDate(new
		 * Date()); e1.setLicenseNumber("dsd342fadfa"); e1.setLicenseQuantity(756l);
		 * e1.setOnlineDate(new Date()); e1.setOnlineID("d324fdf");
		 * e1.setPurchaseOrder(null); e1.setUpdatedAt(new Date()); en.add(e1);
		 * en.add(e); model.setLicenseEntries(en);
		 * model.setMultipleTaskAttachmentModel(a1);
		 */
		
		//ObjectMapper m=new ObjectMapper();
		
		//String s=m.writeValueAsString(model);
		//System.out.println(s);
		SpringApplication.run(BoilerplateApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder){
		
		return builder.sources(BoilerplateApplication.class);
	}
}
