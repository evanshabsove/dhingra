namespace :image do
  desc "Re upload images so we can scale them"

  task :add_verify_true => :environment do
    Painting.all.each do |t|
      t.image.recreate_versions!(:thumb, :large)
    end
  end

end
