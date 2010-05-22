require File.expand_path('../../spec_helper', __FILE__)

describe "The -d command line option" do
  before :each do
    @script = fixture __FILE__, "debug.rb"
  end

  it "sets $DEBUG to true" do
    if PlatformGuard.windows?
      ruby_exe(@script, :options => "-d").chomp.should == "true"
    else
      ruby_exe(@script, :options => "-d", :args => "2>/dev/null").chomp.should == "true"
    end
  end
end
