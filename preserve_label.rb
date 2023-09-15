require 'json'
require_relative 'label'

class PreserveLabels
  def gets_labels
    return unless File.exist?('./labels.json')

    saved_labels = []
    file_data = File.read('./labels.json')
    data = JSON.parse(file_data)
    data.each { |elem| saved_labels << Label.new(elem['title'], elem['color'], elem['id']) }
    saved_labels
  end

  def save_labels(labels)
    return if labels.empty?

    data_hash = []
    labels.each do |label|
      data_hash << { id: label.id, title: label.title, color: label.color, items_class: label.items[0].class }
    end
    File.write('./labels.json', JSON.dump(data_hash))
  end
end
