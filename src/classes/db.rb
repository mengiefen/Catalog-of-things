require 'fileutils'
require 'json'
class DB
  def initialize
    # Initialize database
    @folder_path = '../storage/'
    FileUtils.mkdir_p(@folder_path) unless File.exist?(@folder_path)
    @file_path = ''
    @file = ''
  end

  def save(data, file_name)
    check_files(file_name)

    # open file and parse json
    json = JSON.parse(@file.read)

    # get next id
    id = json.keys.length + 1

    # merge new data to file_data
    json[id] = data

    # parse data to json
    data_json = JSON.generate(json)

    # write data to file
    File.write(@file_path, data_json)

    true
  end

  def get_all_data_of(file_name)
    check_files(file_name)
    JSON.parse(@file.read).map { |id, data| data.merge({ 'id' => id }) }
  end

  private

  def check_files(file_name)
    @file_path = "#{@folder_path}/#{file_name}.json"
    File.write(@file_path.to_s, '{}') unless File.exist?(@file_path)
    @file = File.open(@file_path, 'r')
  end
end
