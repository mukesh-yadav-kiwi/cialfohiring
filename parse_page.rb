
require 'nokogiri'
require 'open-uri'


class ParsePage

  def fetch_page(url)
    @html_page = Nokogiri::HTML(open(url))
  end

  def extract_rows(selector)
    @rows = @html_page.css(selector)
  end

  def extract_name(row)
    row.css('td div a').text
  end

  def extract_rank(row)
    row.css('td div span').text.match(/\#(\d)/)[1]
  end

  def extract_tuition_fees(row)
    row.css('td')[1].css('div').text.strip
  end

  def extract_total_enrollment(row)
    row.css('td')[2].css('div').text.strip
  end

  def to_json
    output = []
    fetch_page('http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data')
    extract_rows('#search-application-results-view tbody tr[data-view=colleges-search-results-table-row]')

    @rows.each do |row|
      output_json = {}
      output_json["name"] = extract_name(row)
      output_json["rank"] = extract_rank(row)
      output_json["tuition_fees"] = extract_tuition_fees(row)
      output_json["total_enrollment"] = extract_total_enrollment(row)
      output.push(output_json)
    end

    return output
  end
end
