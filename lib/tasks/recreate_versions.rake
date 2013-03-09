task :recreate_versions => :environment do
  desc "Recreates the image files for each Photo model."

  Photo.all.each do |photo|
    photo.photo.recreate_versions! if photo.photo.present?
    print "Photo #{photo.id} done!\n"
  end

  print "Finished recreating versions.\n"
end