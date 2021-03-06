require 'socket'

BUILD_DIR="#{Dir.pwd}/build"
OPENLMIS_DIR="#{Dir.pwd}/open-lmis"
MOZ_DIR="#{Dir.pwd}/moz"

def update_openlmis(branch)
  if !Dir.exists?(OPENLMIS_DIR)
    openlmis_setup(branch)
  else
    system("cd #{OPENLMIS_DIR} && git checkout . && git pull -f origin #{branch} && git submodule update")
  end
end

def openlmis_setup(branch)
  result1 = system("git clone https://github.com/SIGLUS/open-lmis.git #{OPENLMIS_DIR} && cd #{OPENLMIS_DIR} && git checkout #{branch}")
  return result1 if !result1
  puts "initing submodule"
  result2 = system("cd #{OPENLMIS_DIR} && git submodule init && git submodule update")
  return result2 if !result2
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
  system("cd #{OPENLMIS_DIR} && ./gradlew clean setupdb setupExtensions seed IntegrationTests build")
end

def build_slave_project
  system("rm #{OPENLMIS_DIR}/modules/report/src/main/resources/applicationContext-report.xml && cp #{MOZ_DIR}/applicationContext-report.xml #{OPENLMIS_DIR}/modules/report/src/main/resources/applicationContext-report.xml")
  system("rm #{OPENLMIS_DIR}/modules/email/src/main/resources/applicationContext-email.xml && cp #{MOZ_DIR}/applicationContext-email.xml #{OPENLMIS_DIR}/modules/email/src/main/resources/applicationContext-email.xml")
  system("cd #{OPENLMIS_DIR} && ./gradlew war -PwarName=openlmis-web-slave.war")
end

def setup_db
  system("cd #{OPENLMIS_DIR} && ./gradlew setupdb setupExtensions seed")
end

def start_jetty
  Thread.start do
    system "cd #{OPENLMIS_DIR} && ./gradlew run > startjetty.log"
  end
  wait_for_jetty
end

def build_data
  system("cd #{OPENLMIS_DIR}/.. && ./build/setup-data.sh")
end

def wait_for_jetty
  loop {
    break if (TCPSocket.open("localhost", 8080) rescue nil)
    puts "Waitting for jetty..."
    sleep 1
  }
  "jetty started"
end

def write_version_info
  version_html_path="#{OPENLMIS_DIR}/modules/openlmis-web/src/main/webapp/public/pages/version_base.html"
  openlmis_version = `cd #{OPENLMIS_DIR} && git log -1`.gsub(/\n/, "<br>")
  html_with_version = File.read(version_html_path).gsub(/VersionInfoAndMessage/, openlmis_version)
  File.open(version_html_path, "w") do |file|
    file.puts html_with_version
  end
  openlmis_version
end
