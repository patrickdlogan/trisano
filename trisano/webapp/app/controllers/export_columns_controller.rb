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

class ExportColumnsController < AdminController

  def index
    @export_columns = ExportColumn.find(:all, 
                                        :include => ['export_disease_group', 'export_name'], 
                                        :conditions => "export_names.export_name = 'CDC'", 
                                        :order => "export_disease_groups.name, export_columns.name ASC")
  end

  def show
    @export_column = ExportColumn.find(params[:id])
  end

  def new
    @export_column = ExportColumn.new
  end

  def edit
    @export_column = ExportColumn.find(params[:id])
  end

  def create
    @export_column = ExportColumn.new(params[:export_column])
    @export_column.export_name = ExportName.find(:first, :conditions => "export_name = 'CDC'") 

    if @export_column.save
      flash[:notice] = 'Export Column was successfully created.'
      redirect_to(@export_column)
    else
      render :action => "new"
    end
  end

  def update
    @export_column = ExportColumn.find(params[:id])
    
    if @export_column.update_attributes(params[:export_column])
      flash[:notice] = 'Export Column was successfully updated.'
      redirect_to(@export_column)
    else
      render :action => "edit"
    end
  end

  def destroy
    @export_column = ExportColumn.find(params[:id])
    @export_column.destroy
    redirect_to(export_columns_url)
  end

  def associate_disease
    @export_column = ExportColumn.find(params[:id])
    @disease = Disease.find(params[:disease_id])
    @export_column.diseases << @disease
    
    if @export_column.save
      render :update do |page|
        page.insert_html(:before, :associated_disease_link, :partial => 'disease', :locals => {:disease => @disease})
        page << "$('dissociated_disease_#{@disease.id}').remove()"
        page << "$('associated_disease_link').previous().highlight()"
      end        
    end
  end

  def dissociate_disease
    @export_column = ExportColumn.find(params[:id])
    @disease = Disease.find(params[:disease_id])
    @export_column.diseases.delete(@disease)
    
    if @export_column.save
      render :update do |page|
        page.insert_html(:top, :disease_table, :partial => 'dissociated_disease', :locals => {:dissociated_disease => @disease})
        page << "$('associated_disease_#{@disease.id}').remove()"
        page << "$('dissociated_disease_#{@disease.id}').highlight()"
      end
    end
  end

end
