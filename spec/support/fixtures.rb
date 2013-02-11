# didn't call it fixture_path as this is already defined by the framework
def fixture_file_path(filename)
  File.join(Rails.root, '../fixtures/images', filename)
end

def fixture_file(filename)
  File.open(File.join(Rails.root, '../fixtures/images', filename))
end

