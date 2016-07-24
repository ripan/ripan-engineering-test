namespace :db do
  desc "Create material and supplier. Ensures all the necessary bootstrap data is inserted."
  task :import_materials => :environment do

    supplier_urls = []

    supplier_urls << "http://dev.hexagonalwax.com.s3-website-eu-west-1.amazonaws.com/engineering-test/resources/supplier/WNP-SWCL001-010.xml"
    supplier_urls << "http://dev.hexagonalwax.com.s3-website-eu-west-1.amazonaws.com/engineering-test/resources/supplier/ZDW-EOWW005-010.xml"

    supplier_urls.each do |supplier_url|
      material = Material.new
      xml_doc  = Nokogiri::XML(open(supplier_url))
      xml_doc.xpath('//supplierInfo').each do |supplierInfo|
        supplierInfo.xpath('supplierInfo').each do |supplier|
          puts "\n **Creating supplier: #{supplier}** \n"
          name = supplier.text
          material.supplier = Supplier.find_or_create_by!(name: name)
        end
      end

      xml_doc.xpath('//mediaInfo').each do |media|
        puts "\n **Creating material: #{media}** \n"
        material.title =  media.xpath('title').text
        material.episode =  media.xpath('episode').text
        material.year =  media.xpath('year').text
        material.som =  media.xpath('SOM').text
        material.eom =  media.xpath('EOM').text
        material.aspect_ratio =  media.xpath('aspectRatio').text
        material.material_type =  media.xpath('materialType').text
        material.delivery_channel_group =  media.xpath('deliveryChannelGroup').text
      end
      puts "#{material.title}:  Created successfully" if material.save!
    end
  end
end
