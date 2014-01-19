namespace :versions do
  desc "TODO"
  task assign_download_id: :environment do
  	versions = Version.all
  	versions.each do |v|
  		v.download_id = SecureRandom.hex(2)
  		v.save
  	end
  end

end
