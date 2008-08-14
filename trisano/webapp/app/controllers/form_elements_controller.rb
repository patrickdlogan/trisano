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

class FormElementsController <  AdminController

  def index
    @form_elements = FormElement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_elements }
    end
  end

  def show
    @form_element = FormElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form_element }
    end
  end

  def new
    @form_element = FormElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @form_element }
    end
  end

  def edit
    @form_element = FormElement.find(params[:id])
  end

  def create
    @form_element = FormElement.new(params[:form_element])

    respond_to do |format|
      if @form_element.save
        flash[:notice] = 'Form element was successfully created.'
        format.html { redirect_to(@form_element) }
        format.xml  { render :xml => @form_element, :status => :created, :location => @form_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @form_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @form_element = FormElement.find(params[:id])

    respond_to do |format|
      if @form_element.update_attributes(params[:form_element])
        flash[:notice] = 'FormElement was successfully updated.'
        format.html { redirect_to(@form_element) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @form_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @form_element = FormElement.find(params[:id])
      @form_element.destroy_with_dependencies
      @form = Form.find(@form_element.form_id)
    rescue Exception => ex
      logger.debug ex
      flash[:notice] = 'An error occurred during the deletion process.'
      render :template => 'rjs-error'
    end
  end
  
  def filter_elements
    @reference_element = FormElement.find(params[:reference_element_id])
    direction = params[:direction]

    if params[:filter_by].blank?
      @library_elements = FormElement.roots(:conditions => ["form_id IS NULL"])
    else
      if direction == "to_library"
        @library_elements = FormElement.find_by_sql("SELECT * FROM form_elements WHERE form_id IS NULL AND type = 'GroupElement' and name ILIKE '%#{params[:filter_by]}%'")
      else
        @library_elements = FormElement.find_by_sql("SELECT * FROM form_elements WHERE form_id IS NULL AND id IN (SELECT question_element_id FROM questions WHERE question_text ILIKE '%#{params[:filter_by]}%')")
      end
    end
    render :partial => "forms/library_elements", :locals => {:direction => direction.to_sym}
  end
end
