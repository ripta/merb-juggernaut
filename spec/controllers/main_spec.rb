require File.dirname(__FILE__) + '/../spec_helper'

describe "MerbJuggernaut::Main (controller)" do
  
  # Feel free to remove the specs below
  
  before :all do
    Merb::Router.prepare { add_slice(:MerbJuggernaut) } if standalone?
  end
  
  after :all do
    Merb::Router.reset! if standalone?
  end
  
  it "should have access to the slice module" do
    controller = dispatch_to(MerbJuggernaut::Main, :index)
    controller.slice.should == MerbJuggernaut
    controller.slice.should == MerbJuggernaut::Main.slice
  end
  
  it "should have an index action" do
    controller = dispatch_to(MerbJuggernaut::Main, :index)
    controller.status.should == 200
    controller.body.should contain('MerbJuggernaut')
  end
  
  it "should work with the default route" do
    controller = get("/merb-juggernaut/main/index")
    controller.should be_kind_of(MerbJuggernaut::Main)
    controller.action_name.should == 'index'
  end
  
  it "should work with the example named route" do
    controller = get("/merb-juggernaut/index.html")
    controller.should be_kind_of(MerbJuggernaut::Main)
    controller.action_name.should == 'index'
  end
    
  it "should have a slice_url helper method for slice-specific routes" do
    controller = dispatch_to(MerbJuggernaut::Main, 'index')
    
    url = controller.url(:merb_juggernaut_default, :controller => 'main', :action => 'show', :format => 'html')
    url.should == "/merb-juggernaut/main/show.html"
    controller.slice_url(:controller => 'main', :action => 'show', :format => 'html').should == url
    
    url = controller.url(:merb_juggernaut_index, :format => 'html')
    url.should == "/merb-juggernaut/index.html"
    controller.slice_url(:index, :format => 'html').should == url
    
    url = controller.url(:merb_juggernaut_home)
    url.should == "/merb-juggernaut/"
    controller.slice_url(:home).should == url
  end
  
  it "should have helper methods for dealing with public paths" do
    controller = dispatch_to(MerbJuggernaut::Main, :index)
    controller.public_path_for(:image).should == "/slices/merb-juggernaut/images"
    controller.public_path_for(:javascript).should == "/slices/merb-juggernaut/javascripts"
    controller.public_path_for(:stylesheet).should == "/slices/merb-juggernaut/stylesheets"
    
    controller.image_path.should == "/slices/merb-juggernaut/images"
    controller.javascript_path.should == "/slices/merb-juggernaut/javascripts"
    controller.stylesheet_path.should == "/slices/merb-juggernaut/stylesheets"
  end
  
  it "should have a slice-specific _template_root" do
    MerbJuggernaut::Main._template_root.should == MerbJuggernaut.dir_for(:view)
    MerbJuggernaut::Main._template_root.should == MerbJuggernaut::Application._template_root
  end

end