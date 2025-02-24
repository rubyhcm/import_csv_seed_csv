require 'csv'

class CsvMe
  @my_proc = ->(rows_size, num_batches, current_batch_number, batch_duration_in_secs) {
  # Using the arguments provided to the callable, you can
  # send an email, post to a websocket,
  # update slack, alert if import is taking too long, etc.
}

  # From a file
  def self.call_first
    CSV.foreach("test.csv") do |row|
      # each row
    end
  end

  def self.call_second
    arr_of_arrs = CSV.read("test.csv")
    # arr_of_arrs is array of all lines
  end

  # From a string
  def self.call_third
    CSV.parse("CSV,data,String\nLoi,hcm,hello") do |row|
      # will create two line by \n
    end
  end

  def self.call_fourth
    arr_of_arrs = CSV.parse("CSV,data,String")
  end

  # Write to a file
  def self.call_fifth
    CSV.open("test.csv", "wb") do |csv|
      csv << ["row", "of", "CSV", "data"]
      csv << ["another", "row"]
    end
  end
  # Write to a string
  def self.call_sixth
    csv_string = CSV.generate do |csv|
      csv << ["row", "of", "CSV", "data"]
      csv << ["another", "row"]
    end
  end

  # Import using gem "activerecord-import"
  # columns = [ :title, :author ]
  # values = [ ['Book1', 'George Orwell'], ['Book2', 'Bob Jones'] ]
  # Post.import columns, values, validate: false ==> default of validate is true
  def self.call_seventh
    items = []

    CSV.foreach('test.csv', headers: true) do |row|
      items << Post.new(row.to_h)
    end
    Post.import(items)
  end

  def self.call_eighth
    values = [{ title: 'Book1', body: 'George Orwell' }, { title: 'Book2', body: 'Bob Jones'}]
    # Post.import values, validate: true, batch_size: 1
    Post.import values, validate: true, batch_size: 2, batch_progress: @my_proc
  end
end
