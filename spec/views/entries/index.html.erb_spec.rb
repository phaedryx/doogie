require 'spec_helper'

describe "entries/index.html.erb" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :content => "MyText"
      ),
      stub_model(Entry,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
