class Friend < ActiveRecord::Base
  validates :name, presence: true
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file
    :avatar,
    styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
      },
    :storage => :s3,
    :bucket => 'hohohohoho',
    :s3_credentials => "#{Rails.root}/config/aws.yml",
    :path => "resources/:id/:style/:basename.:extension"
end
