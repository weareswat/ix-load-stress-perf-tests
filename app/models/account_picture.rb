class AccountPicture < ApplicationRecord

  def url
    # TODO adapt for every env
    key = "#{self.id}_#{self.filename}"
    file_name = "public#{self.public_filename}"
    cached_file_name = file_name.gsub(/#{self.filename}$/, key)

    cached_file_name
  end

  def public_filename
    #TODO check how this is generated
  end
end