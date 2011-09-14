Factory.define :plan do |p|
  p.name "sample"
  p.email "test@mail.com"
  p.phone "1234567"
  p.description "sample_data"
  #p.file_file_name("sample.doc")
  #p.file_content_type("doc")
  p.file File.open(File.join(Rails.root, "public", "samples", "sample.doc"))
end

Factory.define :news do |f|
  f.description "Sample description"
  f.published_on Date.today
  f.show true
end