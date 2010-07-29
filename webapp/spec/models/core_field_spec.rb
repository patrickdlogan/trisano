# Copyright (C) 2007, 2008, 2009, 2010 The Collaborative Software Foundation
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

require File.dirname(__FILE__) + '/../spec_helper'

describe CoreField do
  before :all do
    CoreField.delete_all  # There's been fixutures spotted around these parts.
  end

  after :all do
    Fixtures.reset_cache
  end

  before :each do
    @core_field = CoreField.create(:key => 'morbidity_event[test_field]', :event_type => 'morbidity_event')
  end

  after { I18n.locale = :en }

  it { should have_many(:core_fields_diseases) }
  it { should have_many(:diseases) }

  it "should update help text" do
    @core_field.help_text = 'Here is some help text'
    @core_field.save.should be_true
    CoreField.find_by_key(@core_field.key).help_text.should == 'Here is some help text'
  end

  it 'should provide hashes based on event type' do
    CoreField.event_fields('morbidity_event').size.should == 1
    CoreField.event_fields('contact_event').size.should == 0
    CoreField.event_fields('place_event').size.should == 0
  end

  it 'should provide hashes based on event' do
    CoreField.event_fields(MorbidityEvent.new).size.should == 1
  end

  it 'should return fields based on key' do
    hash = CoreField.event_fields('morbidity_event')
    hash['morbidity_event[test_field]'].should_not be_nil
  end

  it "should memoize fields for rendering" do
    hash = CoreField.event_fields('morbidity_event')
    old_field = hash['morbidity_event[test_field]']
    CoreField.all(:conditions => ["key=?", 'morbidity_event[test_field]']).each do |cf|
      cf.help_text = 'some help text'
      cf.save
    end
    hash = CoreField.event_fields('morbidity_event')
    old_field.object_id.should_not == hash['morbidity_event[test_field]'].object_id
  end

  it "event_fields should return hash of core fields" do
    hash = CoreField.event_fields('morbidity_event')
    hash['morbidity_event[test_field]'].class.should == CoreField
  end

  it "should pull english translations for name" do
    I18n.locale = :en
    cf = CoreField.create!(:key => 'morbidity_event[places]', :event_type => 'morbidity_event')
    cf.name.should == 'Places'
  end

  it "should return scope for I18n retrieval" do
    cf = CoreField.create!(:key => 'morbidity_event[places]', :event_type => 'morbidity_event')
    cf.i18n_scope.should == ['event_fields', 'morbidity_event']
  end

  it "should return the name key for i18n retrieval" do
    cf = CoreField.create!(:key => 'morbidity_event[places]', :event_type => 'morbidity_event')
    cf.name_key.should == 'places'
  end

  shared_examples_for "disease is associated" do

    it "should be rendered if disease association is for showing the field" do
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf)
      @cf.should be_rendered(@event)
    end

    it "should not be rendered if association is for hiding field" do
      Factory.create(:core_fields_disease,
        :disease => @disease,
        :core_field => @cf,
        :rendered => false)
      @cf.should_not be_rendered(@event)
    end

  end

  describe "rendering disease specific core fields" do
    before do
      @event = Factory.create(:morbidity_event)
      @disease = Factory.create(:disease)
      @event.build_disease_event(:disease => @disease).save!
      @cf = Factory.create(:core_field, :disease_specific => true)
    end

    it "should be disease specific" do
      @cf.should be_disease_specific
    end

    it "should not render if no disease is associated" do
      @cf.should_not be_rendered(@event)
    end

    it "should not be rendered if event is nil" do
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf)
      @cf.should_not be_rendered(nil)
    end

    it "should not render if event's disease is not associated" do
      @event.disease_event.update_attributes!(:disease => Factory.create(:disease))
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf)
      @cf.should_not be_rendered(@event)
    end

    it_should_behave_like "disease is associated"

  end
  
  describe "regular ol' core fields" do
    before do
      @event = Factory.create(:morbidity_event)
      @disease = Factory.create(:disease)
      @event.build_disease_event(:disease => @disease).save!
      @cf = Factory.create(:core_field)
    end

    it "should not be disease specific" do
      @cf.should_not be_disease_specific
    end

    it "should be rendered if event's disease is associated" do
      @cf.should be_rendered(@event)
    end

    it "should be rendered if event is nil" do
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf)
      @cf.should be_rendered(nil)
    end

    it "should be rendered if event's disease is not associated" do
      Factory.create(:core_fields_disease,
        :disease => Factory.create(:disease),
        :core_field => @cf)
      @cf.should be_rendered(@event)
    end

    it_should_behave_like "disease is associated"
  end

  describe "replacing disease-specific core fields" do
    before do
      @event = Factory.create(:morbidity_event)
      @disease = Factory.create(:disease)
      @event.build_disease_event(:disease => @disease).save!
      @cf = Factory.create(:core_field, :disease_specific => true)
    end
    
    it "should not replace if no disease is associated" do
      @cf.should_not be_replaced(@event)
    end

    it "should not be replaced if event is nil" do
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf, :rendered => true, :replaced => true)
      @cf.should_not be_replaced(nil)
    end

    it "should not replace if event's disease is not associated" do
      @event.disease_event.update_attributes!(:disease => Factory.create(:disease))
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf, :rendered => true, :replaced => true)
      @cf.should_not be_replaced(@event)
    end

    it "should replace if disease association is for replacing the field" do
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf, :rendered => true, :replaced => true)
      @cf.should be_replaced(@event)
    end

    it "should not replace if disease association is not for replacing the field" do
      Factory.create(:core_fields_disease, :disease => @disease, :core_field => @cf, :rendered => true, :replaced => false)
      @cf.should_not be_replaced(@event)
    end
  end

  describe "replacing non-disease-specific core fields" do
    before do
      @event = Factory.create(:morbidity_event)
      @disease = Factory.create(:disease)
      @event.build_disease_event(:disease => @disease).save!
      @cf = Factory.create(:core_field, :disease_specific => false)
    end

    it "should replace if no disease is associated" do
      @cf.should be_replaced(@event)
    end

    it "should be replaced if event is nil" do
      @cf.should be_replaced(nil)
    end
  end

end
