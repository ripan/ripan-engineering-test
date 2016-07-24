namespace :db do
  desc "Create material and supplier. Ensures all the necessary bootstrap data is inserted."
  task :import_materials => :environment do
    xml_doc  = Nokogiri::XML(open("http://dev.hexagonalwax.com.s3-website-eu-west-1.amazonaws.com/engineering-test/resources/supplier/WNP-SWCL001-010.xml"))
    xml_doc.xpath('//supplierInfo').each do |char_element|
      char_element.xpath('//supplierName').each do |char_element|
        puts char_element.text
      end
      char_element.xpath('//deliveryDate').each do |char_element|
        puts char_element.text
      end
    end
  end
end
