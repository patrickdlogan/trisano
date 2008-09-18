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

# Diseases are represented as an array of strings

diseases = YAML::load_file "#{RAILS_ROOT}/db/defaults/diseases.yml"
Disease.transaction do
  diseases.each do |disease|
    d = Disease.find_or_initialize_by_disease_name(:disease_name => disease)
    d.save! if d.new_record?
  end
end

# Hospitals are represented as an array of strings

hospitals = YAML::load_file "#{RAILS_ROOT}/db/defaults/hospitals.yml"
Entity.transaction do
  hospitals.each do |hospital|
    hospital_type_id = Code.find_by_code_name_and_the_code("placetype", "H").id
    h = Entity.find(:first, 
      :include => :places, 
      :select => "places.name", 
      :conditions => ["entities.entity_type = 'place' and places.place_type_id = ? and places.name = ?",
        hospital_type_id, hospital])
    Entity.create(:entity_type => 'place', :place => {:name => hospital, :place_type_id => hospital_type_id}) if h.nil?
  end
end

# Jurisdictions are represented as an array of strings

jurisdictions = YAML::load_file "#{RAILS_ROOT}/db/defaults/jurisdictions.yml"
Entity.transaction do
  jurisdictions.each do |jurisdiction|
    jurisdiction_type_id = Code.find_by_code_name_and_the_code("placetype", "J").id
    j = Entity.find(:first, 
      :include => :places, 
      :select => "places.name", 
      :conditions => ["entities.entity_type = 'place' and places.place_type_id = ? and places.name = ?",
        jurisdiction_type_id, jurisdiction['name'] ])
    Entity.create(:entity_type => 'place', :place => {:name => jurisdiction['name'], :short_name => jurisdiction['short_name'], :place_type_id => jurisdiction_type_id}) if j.nil?
  end
end

# Roles are represented as an array of strings

roles = YAML::load_file "#{RAILS_ROOT}/db/defaults/roles.yml"
Role.transaction do
  roles.each do |role|
    r = Role.find_or_initialize_by_role_name(:role_name => role)
    r.save! if r.new_record?
  end
end

# Privileges are represented as an array of strings

privileges = YAML::load_file "#{RAILS_ROOT}/db/defaults/privileges.yml"
Privilege.transaction do
  privileges.each do |privilege|
    p = Privilege.find_or_initialize_by_priv_name(:priv_name => privilege)
    p.save! if p.new_record?
  end
end

# Users are represented as an array of hashes
users = YAML::load_file "#{RAILS_ROOT}/db/defaults/users.yml"

# Can't simply delete all and insert as the delete may trigger a FK constraint
User.transaction do
  users.each do |user|
    u = User.find_or_initialize_by_uid(:uid => user['uid'], :user_name => user['user_name'])
    u.attributes = user unless u.new_record?
    u.save!
  end
end

PrivilegesRole.transaction do
  
  jurisdiction_type_id = Code.find_by_code_name_and_the_code("placetype", "J").id
  jurisdictions = Entity.find(:all, 
    :include => :places, 
    :conditions => ["entities.entity_type = 'place' and places.place_type_id = ?",
      jurisdiction_type_id])
    
  user = User.find_by_user_name('default_user')
  mike = User.find_by_user_name('mike')
  chuck = User.find_by_user_name('chuck')
  davidjackson = User.find_by_user_name('davidjackson')
  richard = User.find_by_user_name('Rkurzban')
  ben = User.find_by_user_name('benjamingoodrich')
                  
  roles = Role.find(:all)
  privileges = Privilege.find(:all)
                  
  jurisdictions.each do |jurisdiction|
    roles.each do |role|
      privileges.each do |privilege|
        unless (role.role_name == 'investigator' && privilege.priv_name == 'administer')
          pr = PrivilegesRole.find_or_initialize_by_jurisdiction_id_and_role_id_and_privilege_id(:jurisdiction_id => jurisdiction.id, 
            :role_id => role.id, 
            :privilege_id => privilege.id)
          pr.save! if pr.new_record?
        end
      end
      
      # While, we're at it, grant the default user all roles for all jurisdictions
      user.update_attributes( { :role_membership_attributes => [{ :role_id => role.id, :jurisdiction_id => jurisdiction.id }] } )
      mike.update_attributes( { :role_membership_attributes => [{ :role_id => role.id, :jurisdiction_id => jurisdiction.id }] } )
      chuck.update_attributes( { :role_membership_attributes => [{ :role_id => role.id, :jurisdiction_id => jurisdiction.id }] } )
      davidjackson.update_attributes( { :role_membership_attributes => [{ :role_id => role.id, :jurisdiction_id => jurisdiction.id }] } )
      richard.update_attributes( { :role_membership_attributes => [{ :role_id => role.id, :jurisdiction_id => jurisdiction.id }] } )
      ben.update_attributes( { :role_membership_attributes => [{ :role_id => role.id, :jurisdiction_id => jurisdiction.id }] } )
      
    end
  end
end


# TODO: Make this smarter when it comes to production
User.transaction do

  data_entry_tech = User.find_by_user_name('data_entry_tech')
  surveillance_mgr = User.find_by_user_name('surveillance_mgr')
  investigator = User.find_by_user_name('investigator')
  lhd_manager = User.find_by_user_name('lhd_manager')
  state_manager = User.find_by_user_name('state_manager')

  bear_river = Place.find_by_name("Bear River Health Department").entity_id
  unassigned = Place.find_by_name("Unassigned").entity_id

  create_event = Privilege.find_by_priv_name("create_event").id
  view_event = Privilege.find_by_priv_name("view_event").id
  update_event = Privilege.find_by_priv_name("update_event").id
  route_event_to_any_lhd = Privilege.find_by_priv_name("route_event_to_any_lhd").id
  accept_event_for_lhd = Privilege.find_by_priv_name("accept_event_for_lhd").id
  route_event_to_investigator = Privilege.find_by_priv_name("route_event_to_investigator").id
  accept_event_for_investigation = Privilege.find_by_priv_name("accept_event_for_investigation").id
  investigate_event = Privilege.find_by_priv_name("investigate_event").id
  approve_event_at_lhd = Privilege.find_by_priv_name("approve_event_at_lhd").id
  approve_event_at_state = Privilege.find_by_priv_name("approve_event_at_state").id

  data_entry_tech.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => bear_river)
  data_entry_tech.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => bear_river)
  data_entry_tech.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => bear_river)
  data_entry_tech.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => unassigned)
  data_entry_tech.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => unassigned)
  data_entry_tech.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => unassigned)
  data_entry_tech.entitlements << Entitlement.new(:privilege_id => route_event_to_any_lhd, :jurisdiction_id => unassigned)

  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => bear_river)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => bear_river)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => bear_river)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => unassigned)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => unassigned)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => unassigned)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => accept_event_for_lhd, :jurisdiction_id => bear_river)
  surveillance_mgr.entitlements << Entitlement.new(:privilege_id => route_event_to_investigator, :jurisdiction_id => bear_river)

  investigator.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => bear_river)
  investigator.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => bear_river)
  investigator.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => bear_river)
  investigator.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => unassigned)
  investigator.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => unassigned)
  investigator.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => unassigned)
  investigator.entitlements << Entitlement.new(:privilege_id => accept_event_for_investigation, :jurisdiction_id => bear_river)
  investigator.entitlements << Entitlement.new(:privilege_id => investigate_event, :jurisdiction_id => bear_river)

  lhd_manager.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => bear_river)
  lhd_manager.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => bear_river)
  lhd_manager.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => bear_river)
  lhd_manager.entitlements << Entitlement.new(:privilege_id => approve_event_at_lhd, :jurisdiction_id => bear_river)

  state_manager.entitlements << Entitlement.new(:privilege_id => create_event, :jurisdiction_id => bear_river)
  state_manager.entitlements << Entitlement.new(:privilege_id => view_event, :jurisdiction_id => bear_river)
  state_manager.entitlements << Entitlement.new(:privilege_id => update_event, :jurisdiction_id => bear_river)
  state_manager.entitlements << Entitlement.new(:privilege_id => approve_event_at_state, :jurisdiction_id => bear_river)

end
