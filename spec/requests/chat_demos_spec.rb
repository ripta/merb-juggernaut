require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a chat_demo exists" do
  ChatDemo.all.destroy!
  request(resource(:chat_demos), :method => "POST", 
    :params => { :chat_demo => { :id => nil }})
end

describe "resource(:chat_demos)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:chat_demos))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of chat_demos" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a chat_demo exists" do
    before(:each) do
      @response = request(resource(:chat_demos))
    end
    
    it "has a list of chat_demos" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      ChatDemo.all.destroy!
      @response = request(resource(:chat_demos), :method => "POST", 
        :params => { :chat_demo => { :id => nil }})
    end
    
    it "redirects to resource(:chat_demos)" do
      @response.should redirect_to(resource(ChatDemo.first), :message => {:notice => "chat_demo was successfully created"})
    end
    
  end
end

describe "resource(@chat_demo)" do 
  describe "a successful DELETE", :given => "a chat_demo exists" do
     before(:each) do
       @response = request(resource(ChatDemo.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:chat_demos))
     end

   end
end

describe "resource(:chat_demos, :new)" do
  before(:each) do
    @response = request(resource(:chat_demos, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@chat_demo, :edit)", :given => "a chat_demo exists" do
  before(:each) do
    @response = request(resource(ChatDemo.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@chat_demo)", :given => "a chat_demo exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(ChatDemo.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @chat_demo = ChatDemo.first
      @response = request(resource(@chat_demo), :method => "PUT", 
        :params => { :chat_demo => {:id => @chat_demo.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@chat_demo))
    end
  end
  
end

