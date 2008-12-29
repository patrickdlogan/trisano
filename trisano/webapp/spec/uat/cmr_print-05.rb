# Copyright (C) 2007, 2008, The Collaborative Software Foundation
#
# This file is part of TriSano.
#
# TriSano is free software: you can redistribute it and/or modify it under the 
# terms of the GNU Affero General Public License as published by the 
# Free Software Foundation, either version 3 of the License, 
# or (at your option) any later version.
#
# TriSano is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License 
# along with TriSano. If not, see http://www.gnu.org/licenses/agpl-3.0.txt.

require File.dirname(__FILE__) + '/spec_helper'

#$dont_kill_browser = true
$sleep_time = 5

describe 'Print CMR page' do
  it 'should create a CMR with demographic info' do
    @browser.open "/trisano/cmrs"
    click_nav_new_cmr(@browser).should be_true
    @browser.type('morbidity_event_active_patient__person_last_name', 'Lebowski')
    @browser.type('morbidity_event_active_patient__person_first_name', 'Jeffrey')
    @browser.type('morbidity_event_active_patient__person_middle_name', '`The Dude`')
    @browser.type('morbidity_event_active_patient__address_street_number', '123')
    @browser.type('morbidity_event_active_patient__address_street_name', 'Fake Street')
    @browser.type('morbidity_event_active_patient__address_city', 'Venice')
    @browser.select('morbidity_event_active_patient__address_state_id', 'label=California')
    @browser.select('morbidity_event_active_patient__address_county_id', 'label=Out-of-state')
    @browser.type('morbidity_event_active_patient__address_postal_code', '12345')
    @browser.type('morbidity_event_active_patient__person_birth_date', '4/20/1965')
    @browser.type('morbidity_event_active_patient__person_approximate_age_no_birthday', '43')
    @browser.click('link=New Telephone / Email')
    @browser.select('morbidity_event_active_patient__new_telephone_attributes__entity_location_type_id', 'label=Work')
    @browser.type('morbidity_event_active_patient__new_telephone_attributes__area_code', '555')
    @browser.type('morbidity_event_active_patient__new_telephone_attributes__phone_number', '5551345')
    @browser.select('morbidity_event_active_patient__person_birth_gender_id', 'label=Male')
    @browser.select('morbidity_event_active_patient__person_ethnicity_id', 'label=Not Hispanic or Latino')
    @browser.add_selection('morbidity_event_active_patient_race_ids', 'label=White')
    @browser.select('morbidity_event_active_patient__person_primary_language_id', 'label=Hmong')
#    save_cmr(@browser).should be_true
  end
  
  it 'should edit the CMR to include clinical info' do
 #   edit_cmr(@browser).should be_true
    click_core_tab(@browser, CLINICAL)
    @browser.select "morbidity_event_disease_disease_id", "label=Botulism, foodborne"
    @browser.type "morbidity_event_disease_disease_onset_date", "12/12/2002"
    @browser.type "morbidity_event_disease_date_diagnosed", "12/12/2003"
    @browser.click "link=Add a diagnosing facility"
    @browser.select "morbidity_event_new_diagnostic_attributes__secondary_entity_id", "label=American Fork Hospital"
    @browser.click "link=Add a diagnosing facility"
    @browser.select "//div[@id='diagnostics']/div[2]/span[1]/select", "label=Castleview Hospital"
    @browser.click "link=Add a diagnosing facility"
    @browser.select "//div[@id='diagnostics']/div[3]/span[1]/select", "label=Dixie Regional Medical Center"
    @browser.click "link=Add a diagnosing facility"
    @browser.select "//div[@id='diagnostics']/div[4]/span[1]/select", "label=Castleview Hospital"
    @browser.click "link=Add a hospital"
    @browser.select "morbidity_event_new_hospital_attributes__secondary_entity_id", "label=Ashley Regional Medical Center"
    @browser.type "morbidity_event_new_hospital_attributes__admission_date", "1/1/1901"
    @browser.type "morbidity_event_new_hospital_attributes__discharge_date", "12/12/2003"
    @browser.type "morbidity_event_new_hospital_attributes__medical_record_number", "7"
    @browser.select "morbidity_event_disease_died_id", "label=Yes"
    @browser.type "morbidity_event_active_patient__person_date_of_death", "5/5/2009"
    @browser.select "morbidity_event_active_patient__participations_risk_factor_pregnant_id", "label=Yes"
    @browser.type "morbidity_event_active_patient__participations_risk_factor_pregnancy_due_date", "12/12/2009"

    add_treatment(@browser, {:treatment => "White Russian", :treatment_given => "label=Yes", :treatment_date => "1/17/1901"})
    
    @browser.click "//a[@id='add_clinician_link']"
    sleep(1)       
    @browser.type "morbidity_event_new_clinician_attributes__last_name", "Mario"
    @browser.type "morbidity_event_new_clinician_attributes__first_name", "Mario"
    @browser.type "morbidity_event_new_clinician_attributes__middle_name", "A"
    @browser.select "morbidity_event_new_clinician_attributes__entity_location_type_id", "label=Home"
    @browser.type "morbidity_event_new_clinician_attributes__area_code", "555"
    @browser.type "morbidity_event_new_clinician_attributes__phone_number", "5551337"
    @browser.type "morbidity_event_new_clinician_attributes__extension", "555"
  #  save_cmr(@browser).should be_true
  end
  
  it 'should edit the CMR to include lab info' do
   # edit_cmr(@browser).should be_true
    add_lab_result(@browser, {:lab_name => "Venture Complex",
                              :lab_test_type => "Necromancy",
                              :lab_result_text => "Zombies",
                              :lab_interpretation => "Other",
                              :lab_specimen_source => "Blood",
                              :lab_collection_date => "12/12/2002",
                              :lab_test_date => "12/13/2005",
                              :sent_to_uphl => "Unknown"})
    #save_cmr(@browser).should be_true
  end
  
  it 'should edit the CMR to include contacts' do
   # edit_cmr(@browser).should be_true
    click_core_tab(@browser, CONTACTS)
    add_contact(@browser, {:last_name => "Lina", :first_name => "Inverse"},1)
    add_contact(@browser, {:last_name => "Steve", :first_name => "Jobbs"},2)    
    #save_cmr(@browser).should be_true
  end
  
  it 'should edit the CMR to include EPI info' do
    #edit_cmr(@browser).should be_true

    click_core_tab(@browser, EPI)
    @browser.select "morbidity_event_active_patient__participations_risk_factor_food_handler_id", "label=No"
    @browser.select "morbidity_event_active_patient__participations_risk_factor_healthcare_worker_id", "label=Yes"
    @browser.select "morbidity_event_active_patient__participations_risk_factor_group_living_id", "label=No"
    @browser.select "morbidity_event_active_patient__participations_risk_factor_day_care_association_id", "label=Yes"
    @browser.type "morbidity_event_active_patient__participations_risk_factor_occupation", "Unemployed"
    @browser.type "morbidity_event_active_patient__participations_risk_factor_risk_factors", "Nope"
    @browser.type "morbidity_event_active_patient__participations_risk_factor_risk_factors_notes", "Whatever, Man"
    @browser.select "morbidity_event_imported_from_id", "label=Unknown"
    #save_cmr(@browser).should be_true
  end
  
  it 'should edit the CMR to include reporting info' do
    #edit_cmr(@browser).should be_true
    add_reporting_info(@browser, {:agency => "why",
                                  :first_name => "what",
                                  :last_name => "how",
                                  :phone_type => "label=Unknown",
                                  :area_code => "555",
                                  :extension => "555",
                                  :phone_number => "5550150",
                                  :clinician_date => "12/12/2004",
                                  :PH_date => "12/12/2005"})
    #save_cmr(@browser).should be_true
  end

  it 'should create a note' do
    click_core_tab(@browser, NOTES)
    @browser.type "morbidity_event_new_note_attributes_note", "I'm the operator with my pocket calculator (beep boop)"
  end

  it 'should edit the CMR to include admin info' do
    #edit_cmr(@browser).should be_true
    click_core_tab(@browser, ADMIN)
    @browser.select "morbidity_event_lhd_case_status_id", "label=Confirmed"
    @browser.select "morbidity_event_udoh_case_status_id", "label=Not a Case"
    @browser.select "morbidity_event_outbreak_associated_id", "label=Yes"
    @browser.type "morbidity_event_outbreak_name", "POCKET MONSTERS"
    @browser.select "morbidity_event_active_jurisdiction_secondary_entity_id", "label=Central Utah Public Health Department"
    @browser.select "morbidity_event_event_status", "label=Accepted by Local Health Dept."
    @browser.type "morbidity_event_investigation_started_date", "12/3/2003"
    @browser.type "morbidity_event_investigation_completed_LHD_date", "12/7/2007"
    @browser.type "morbidity_event_event_name", "Y HELO THAR"
    @browser.type "morbidity_event_review_completed_UDOH_date", "12/5/1963"
    @browser.type "morbidity_event_acuity", "Extra Keen"
    save_cmr(@browser).should be_true
    print_cmr(@browser).should be_true
  end

  it 'should correctly display the information to the print page, report only' do
    @browser.is_text_present('Confidential Case Report').should be_true
    @browser.is_text_present('Lebowski').should be_true
    @browser.is_text_present('Botulism, foodborne').should be_true
    @browser.is_text_present('Lebowski').should be_true
    @browser.is_text_present('Jeffrey').should be_true
    @browser.is_text_present('`The Dude`').should be_true
    @browser.is_text_present('123').should be_true
    @browser.is_text_present('Fake Street').should be_true
    @browser.is_text_present('Venice').should be_true
    @browser.is_text_present('California').should be_true
    @browser.is_text_present('Out-of-state').should be_true
    @browser.is_text_present('12345').should be_true
    @browser.is_text_present('1965-04-20').should be_true
    @browser.is_text_present('43').should be_true
    @browser.is_text_present('(555) 555-1345').should be_true
    @browser.is_text_present('Male').should be_true
    @browser.is_text_present('Hmong').should be_true
    @browser.is_text_present('Not Hispanic or Latino').should be_true
    @browser.is_text_present('2002-12-12').should be_true
    @browser.is_text_present('2003-12-12').should be_true
    @browser.is_text_present('Yes').should be_true
    @browser.is_text_present('2009-05-05').should be_true
    @browser.is_text_present('2009-12-12').should be_true
    @browser.is_text_present('Unknown').should be_true
    @browser.is_text_present('American Fork Hospital').should be_true
    @browser.is_text_present('Castleview Hospital').should be_true
    @browser.is_text_present('Dixie Regional Medical Center').should be_true
    @browser.is_text_present('Ashley Regional Medical Center').should be_true
    @browser.is_text_present('1901-01-01').should be_true
    @browser.is_text_present('2003-12-12').should be_true
    @browser.is_text_present('7').should be_true
    @browser.is_text_present('No').should be_true
    @browser.is_text_present('White Russian').should be_true
    @browser.is_text_present('Mario').should be_true
    @browser.is_text_present('Venture Complex').should be_true
    @browser.is_text_present('Necromancy').should be_true
    @browser.is_text_present('Blood').should be_true
    @browser.is_text_present('Zombies').should be_true
    @browser.is_text_present('2005-12-13').should be_true
    @browser.is_text_present('Lina').should be_true
    @browser.is_text_present('Inverse').should be_true
    @browser.is_text_present('Steve').should be_true
    @browser.is_text_present('Jobbs').should be_true
    @browser.is_text_present('Unemployed').should be_true
    @browser.is_text_present('Whatever, Man').should be_true
    @browser.is_text_present('what').should be_true
    @browser.is_text_present('how').should be_true
    @browser.is_text_present('why').should be_true
    @browser.is_text_present('5550150').should be_true
    @browser.is_text_present('2004-12-12').should be_true
    @browser.is_text_present('2005-12-12').should be_true
    @browser.is_text_present('2005').should be_true
    @browser.is_text_present('POCKET MONSTERS').should be_true
    @browser.is_text_present('Y HELO THAR').should be_true
    @browser.is_text_present('Accepted by Local Health Dept.').should be_true
    @browser.is_text_present('2003-12-03').should be_true
    @browser.is_text_present('1963-12-05').should be_true
    @browser.is_text_present('2007-12-07').should be_true
    @browser.is_text_present('Extra Keen').should be_true
    @browser.is_text_present('Notes').should be_false
    @browser.is_text_present("I'm the operator with my pocket calculator (beep boop)").should be_false
    @browser.close()
    @browser.select_window ''
  end
  it 'should display notes on With Notes' do
    @browser.print_cmr(@browser, 1)
    @browser.is_text_present('Notes').should be_true
    @browser.is_text_present("I'm the operator with my pocket calculator (beep boop)").should be_true
    @browser.close()
    @browser.select_window 'null'
  end

end
