class UploadedFile
  include Mongoid::Document

  mount_uploader :avatar, AvatarUploader

  validate :file_ext

  def file_ext
    unless avatar.file.extension.downcase == 'csv'
      errors.add(:file_type, "::You cannot upload a file other then CSV file")
    end
  end
end
