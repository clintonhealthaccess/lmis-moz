BUILD_DIR="#{Dir.pwd}/build"
OPENLMIS_DIR="#{Dir.pwd}/open-lmis"
MOZ_DIR="#{Dir.pwd}/moz"

def update_openlmis
  if !Dir.exists?(OPENLMIS_DIR)
    return openlmis_setup
  else
    return system("cd #{OPENLMIS_DIR} && git checkout . && git pull -f origin 2.0-moz")
  end
end

def openlmis_setup
  result1 = system("git clone https://github.com/OpenLMIS/open-lmis.git #{OPENLMIS_DIR}")
  return result1 if !result1
  result2 = system("cd #{OPENLMIS_DIR} && git checkout 2.0-moz && git submodule init && git submodule update")
  return result2 if !result2

  #HACK: forcefully go into stock-management directory and update code,
  #git submodule update here does not always work
  system("cd #{OPENLMIS_DIR}/modules/stock-management && git checkout 2.0-moz && git pull -f origin 2.0-moz")

  result3 = system("cd #{OPENLMIS_DIR}/modules/openlmis-web && npm install")
  return result3 if !result3
end

def replace_file_list
  ['modules/openlmis-web/src/main/resources/openlmis_logging.xml',
   'modules/openlmis-web/build.gradle',
   'modules/db/src/main/resources/db/migration/V5_2__create_product_forms.sql']
end

def properties_files
  ['modules/openlmis-web/src/main/resources/atomfeed.properties',
   'modules/openlmis-web/src/main/resources/default.properties',
   'modules/openlmis-web/src/main/resources/local/app.properties',
   'modules/openlmis-web/src/main/resources/uat/app.properties']
end

def replace_files
  result = false
  replace_file_list.each do |file_path|
    result = system("rm #{OPENLMIS_DIR}/#{file_path} && cp #{MOZ_DIR}/#{file_path} #{OPENLMIS_DIR}/#{file_path}")
    break if !result
    puts "replaced #{file_path}"
  end
  result
end

def remove_openlmis_properties_files
  result = false
  properties_files.each do |file_path|
    result = system("rm #{OPENLMIS_DIR}/#{file_path}")
    break if !result
    puts "removed #{file_path}"
  end
  result
end

def build_project
  return system("cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle clean setupdb setupExtensions seed build")
  end

def setup_db
  return system("cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle setupdb setupExtensions seed")
  end

def start_jetty
  return system("cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle run")
end

def build_data
  return system("cd #{OPENLMIS_DIR}/.. && ./build/setup-data.sh")
end