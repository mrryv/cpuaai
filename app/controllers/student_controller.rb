class StudentController < ApplicationController

  def show
    @students = Student.all
    @social_media_types = SocialMediaType.all
    @batches = Batch.all
  end

  def create
    ActiveRecord::Base.transaction do
      p = Person.create({ firstname: params[:firstname],
                          lastname: params[:lastname],
                          middlename: params[:middlename],
                          birthdate: DateTime.parse(params[:birthday]),
                          address: params[:address],
                          email: params[:email] })
      s = Student.create({ person: p,
                           batch_id: params[:batch],
                           alumni: params[:approved][:alumni],
                           voter: params[:approved][:voter] })
      SocialMediaType.all.each do |smt|
        next unless params[smt.name.to_sym]
        SocialMedium.create({ locator: params[smt.name.to_sym],
                             social_media_type: smt,
                             student: s })
      end
      redirect_to directory_path, notice: "Successfully Created Student"
    end
  end

  def delete
    Student.delete(params[:id].to_i)
    redirect_to directory_path, notice: "Successfully Deleted Student"
  end

end
