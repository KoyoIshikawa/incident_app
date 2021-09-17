class ImportText
  def self.solution_data
    if find_or_create_by!(solution: "") 
      File.open('db/text_data/solution_template.txt') do |file|
        file.each_line do |subject|
          
        end
        puts subject
      end

    end
    p subject
  end
end