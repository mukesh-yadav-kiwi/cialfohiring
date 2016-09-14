require 'spec_helper'

describe ParsePage do

  let(:file) { '../output.json' }

  before(:each) do
    @doc = <<-HTML
      <tr>
        <td>
          <div><a href="/best-colleges">Harvard University</a></div>
          <div class="text-small"><span class="text-strong">#2 in National Universities</span></div>
        </td>
        <td><div>$47,074</div></td>
        <td><div>6,699</div></td>
      </tr>
    HTML
   end


  describe "#fetch_page" do
    it "should fetch a page to scrap" do
      new_parser = ParsePage.new
      expect(new_parser.fetch_page('http://www.google.com').class).to eq(Nokogiri::HTML::Document)
    end
  end

  describe "#extract_rows" do
    it "should fetch a row for schools with given selector on correct page" do
      new_parser = ParsePage.new
      new_parser.fetch_page('http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data')
      expect(new_parser.extract_rows('#search-application-results-view tbody tr[data-view=colleges-search-results-table-row]').length).to be > 0
    end

    it "should fetch a row for schools with given selector on wrong page" do
      new_parser = ParsePage.new
      new_parser.fetch_page('http://www.google.com')
      expect(new_parser.extract_rows('#search-application-results-view tbody tr[data-view=colleges-search-results-table-row]').length).to eq(0)
    end
  end

  describe "#extract_name" do
    it "should extract name from dom" do
      row = Nokogiri::HTML(@doc)
      new_parser = ParsePage.new
      new_parser.extract_name(row)
      expect(new_parser.extract_name(row)).to eq('Harvard University')
    end
  end

  describe "#extract_rank" do
    it "should fetch a rank from dom" do
      row = Nokogiri::HTML(@doc)
      new_parser = ParsePage.new
      new_parser.extract_name(row)
      expect(new_parser.extract_rank(row)).to eq('2')
    end
  end

  describe "#extract_tuition_fees" do
    it "should fetch tuition fees from dom" do
      row = Nokogiri::HTML(@doc)
      new_parser = ParsePage.new
      new_parser.extract_name(row)
      expect(new_parser.extract_tuition_fees(row)).to eq('$47,074')
    end
  end

  describe "#extract_total_enrollment" do
    it "should fetch total enrollment from dom" do
      row = Nokogiri::HTML(@doc)
      new_parser = ParsePage.new
      new_parser.extract_name(row)
      expect(new_parser.extract_total_enrollment(row)).to eq('6,699')
    end
  end

  describe "#to_json" do
    it "should create a json document file" do
      new_parser = ParsePage.new
      json_object = new_parser.to_json
      expect(json_object.class ).to eq(Array)
      expect(json_object[0]["name"] ).not_to eq(nil)
    end
  end

end
