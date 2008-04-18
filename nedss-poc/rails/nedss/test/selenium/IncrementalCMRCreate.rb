require 'rubygems'
require 'selenium'
require 'test/unit'

class IncrementalCMRCreate < Test::Unit::TestCase
 NEDSS_URL = ENV['NEDSS_URL'] ||= 'http://utah:arches@ut-nedss-dev.csinitiative.com'

  def setup
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleneseInterpreter.new("localhost", 4444, "*firefox", NEDSS_URL, 10000);
      @selenium.start
    end
    @selenium.set_context("test_incremental_c_m_r_create")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_incremental_c_m_r_create
    @selenium.open "/nedss/"
    @selenium.click "link=New CMR"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "event_active_patient__active_primary_entity__person_last_name", "Jorgenson"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "event_active_patient__active_primary_entity__address_street_name", "Junglewood Court"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "event_active_patient__active_primary_entity__telephone_area_code", "801"
    @selenium.type "event_active_patient__active_primary_entity__telephone_phone_number", "581"
    @selenium.type "event_active_patient__active_primary_entity__telephone_extension", "1234"
    @selenium.type "event_active_patient__active_primary_entity__telephone_phone_number", "5811234"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[4]/a/em"
    @selenium.click "//li[2]/a/em"
    @selenium.select "event_disease_disease_id", "label=AIDS"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[3]/a/em"
    @selenium.select "event_lab_result_specimen_source_id", "label=Animal head"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[3]/a/em"
    @selenium.click "//li[2]/a/em"
    @selenium.select "event_active_patient__participations_treatment_treatment_given_yn_id", "label=Yes"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[5]/a/em"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[5]/a/em"
    @selenium.type "model_auto_completer_tf", "Happy Jacks Health Store"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[6]/a/em"
    @selenium.select "event_active_jurisdiction_secondary_entity_id", "label=Salt Lake Valley Health Department"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[2]/a/em"
    @selenium.select "event_active_hospital_secondary_entity_id", "label=Brigham City Community Hospital"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//li[2]/a/em"
    @selenium.select "event_disease_hospitalized_id", "label=Yes"
    @selenium.type "event_active_hospital__hospitals_participation_admission_date", "4/1/2008"
    @selenium.type "event_active_hospital__hospitals_participation_discharge_date", "4/25/2008"
    @selenium.click "event_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=Show"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("Junglewood Court")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("(801) 581-1234 Ext. 1234")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "//li[2]/a/em"
    begin
        assert @selenium.is_text_present("AIDS")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("Yes")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("Brigham City Community Hospital")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("2008-04-01")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("2008-04-25")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "//li[3]/a/em"
    begin
        assert @selenium.is_text_present("Animal head")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "//li[6]/a/em"
    begin
        assert @selenium.is_text_present("Salt Lake Valley Health Department")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=View CMRs"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Jorgenson")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
  end
end
