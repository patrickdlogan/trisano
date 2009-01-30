# Copyright (C) 2007, 2008, 2009 The Collaborative Software Foundation
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

require File.dirname(__FILE__) + '/../../spec_helper'

describe "/search/cmrs.html.haml" do
  
  def do_render
    mock_user
    render "/search/cmrs.html.haml"
  end
  
  it "should render a search form" do
    assigns[:diseases] = [mock_disease]
    assigns[:genders] = [mock_gender]
    assigns[:cities] = [mock_gender]
    assigns[:counties] = [mock_county]
    assigns[:jurisdictions] = [mock_jurisdiction]
    assigns[:event_statuses] = [mock_event_status]
    assigns[:event_types] = [ {:name => "Morbidity Event (CMR)", :value => "MorbidityEvent"}, {:name => "Contact Event", :value => "ContactEvent"} ]
    do_render
    response.should have_tag("form[action=?][method=get]", search_path + "/cmrs")
  end
  
  it "should show results when results are present" do
    cmr = mock('search result')
    cmr.stub!(:record_number).and_return("20083453")
    cmr.stub!(:event_id).and_return("1234567")
    cmr.stub!(:entity_id).and_return("12")
    cmr.stub!(:first_name).and_return("John")
    cmr.stub!(:middle_name).and_return("J")
    cmr.stub!(:last_name).and_return("Johnson")
    cmr.stub!(:disease_name).and_return("Chicken Pox")
    cmr.stub!(:birth_date).and_return("1977/1/12")
    cmr.stub!(:gender).and_return("Male")
    cmr.stub!(:city).and_return("Provo")
    cmr.stub!(:county).and_return("Salt Lake")
    cmr.stub!(:district).and_return("Alpine")
    cmr.stub!(:county).and_return("Salt Lake")
    cmr.stub!(:event_status).and_return("NEW")
    cmr.stub!(:jurisdiction_name).and_return("Weber-Morgan Health District")
    cmr.stub!(:deleted_at).and_return(nil)
    cmr.should_receive(:disease_onset_date).and_return('2008-12-12')

    assigns[:cmrs] = [cmr]
    assigns[params[:disease]] = "1"
    assigns[:diseases] = [mock_disease]
    assigns[:genders] = [mock_gender]
    assigns[:cities] = [mock_gender]
    assigns[:counties] = [mock_county]
    assigns[:jurisdictions] = [mock_jurisdiction]
    assigns[:districts] = [mock_district]
    assigns[:event_statuses] = [mock_event_status]
    assigns[:event_types] = [ {:name => "Morbidity Event (CMR)", :value => "MorbidityEvent"}, {:name => "Contact Event", :value => "ContactEvent"} ]

    do_render
    response.should_not have_text("Your search returned no results.")
    response.should have_tag("div.tools") do
      with_tag('a', "Export All to CSV")
    end
    response.should have_tag("table.tabular") do
      with_tag('td', '2008-12-12')
    end
  end
  
  it "should show message when no results are present" do
    assigns[:cmr] = []
    params[:disease] = "1"
    assigns[:diseases] = [mock_disease]
    assigns[:genders] = [mock_gender]
    assigns[:cities] = [mock_gender]
    assigns[:counties] = [mock_county]
    assigns[:jurisdictions] = [mock_jurisdiction]
    assigns[:districts] = [mock_district]
    assigns[:event_statuses] = [mock_event_status]
    assigns[:event_types] = [ {:name => "Morbidity Event (CMR)", :value => "MorbidityEvent"}, {:name => "Contact Event", :value => "ContactEvent"} ]
    do_render
    response.should have_text(/Your search returned no results./)
  end
  
  def mock_disease
    disease = mock_model(Disease)
    disease.stub!(:id).and_return("1")
    disease.stub!(:disease_name).and_return("Chicken Pox")
    disease
  end
  
  def mock_gender
    gender = mock_model(ExternalCode)
    gender.stub!(:id).and_return("1")
    gender.stub!(:code_description).and_return("Male")
    gender
  end

  def mock_city
    city = mock_model(ExternalCode)
    city.stub!(:id).and_return("1")
    city.stub!(:code_description).and_return("Provo")
    city
  end

  def mock_county
    county = mock_model(ExternalCode)
    county.stub!(:id).and_return("1")
    county.stub!(:code_description).and_return("Salt Lake")
    county
  end

  def mock_place
    place = mock_model(Place)
    place.stub!(:name).and_return("Davis County")
    place
  end

  def mock_jurisdiction
    jurisdiction = mock_model(Place)
    jurisdiction.stub!(:entity_id).and_return("1")
    jurisdiction.stub!(:name).and_return("Weber-Morgan")
    jurisdiction
  end

  def mock_district
    district = mock_model(ExternalCode)
    district.stub!(:id).and_return("1")
    district.stub!(:code_description).and_return("Alpine")
    district
  end

  def mock_event_status
    OpenStruct.new( :state => "UI", :description => "Under Investigation")
  end
end
