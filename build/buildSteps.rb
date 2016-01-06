require 'socket'

BUILD_DIR="#{Dir.pwd}/build"
OPENLMIS_DIR="#{Dir.pwd}/open-lmis"
MOZ_DIR="#{Dir.pwd}/moz"

def update_openlmis
  if !Dir.exists?(OPENLMIS_DIR)
    openlmis_setup
  else
    system("cd #{OPENLMIS_DIR} && git checkout . && git pull -f origin 2.0-moz && git submodule update")
  end
end

def openlmis_setup
  result1 = system("git clone --depth 1 --branch 2.0-moz https://github.com/OpenLMIS/open-lmis.git --single-branch #{OPENLMIS_DIR}")
  return result1 if !result1
  puts "initing submodule"
  result2 = system("cd #{OPENLMIS_DIR} && git submodule init && git submodule update")
  return result2 if !result2

  #HACK: forcefully go into stock-management directory and update code,
  #git submodule update here does not always work
  puts "force pull submodule"
  system("cd #{OPENLMIS_DIR}/modules/stock-management && git checkout 2.0-moz && git pull -f origin 2.0-moz")

  result3 = system("cd #{OPENLMIS_DIR}/modules/openlmis-web && npm install")
  result3 if !result3
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
   'modules/openlmis-web/src/main/resources/app.properties',
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
  system("cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle clean setupdb setupExtensions seed build")
end

def setup_db
  system("cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle setupdb setupExtensions seed")
end

def start_jetty
  t = Thread.start do
    system "cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle run > startjetty.log"
  end
  wait_for_jetty
end

def build_data
  system("cd #{OPENLMIS_DIR}/.. && ./build/setup-data.sh")
end

def wait_for_jetty
  loop {
    break if (TCPSocket.open("localhost", 9091) rescue nil)
    puts "Waitting for jetty..."
    sleep 1
  }
  "jetty started"
end
