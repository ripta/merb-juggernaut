class MerbJuggernaut::ChatDemos < MerbJuggernaut::Application
  # provides :xml, :yaml, :js
  
  def index
    @chat_demos = ChatDemo.all
    display @chat_demos
  end
  
  def show(id)
    @chat_demo = ChatDemo.get(id)
    raise NotFound unless @chat_demo
    display @chat_demo
  end
  
  def new
    only_provides :html
    @chat_demo = ChatDemo.new
    display @chat_demo
  end
  
  def edit(id)
    only_provides :html
    @chat_demo = ChatDemo.get(id)
    raise NotFound unless @chat_demo
    display @chat_demo
  end
  
  def create(chat_demo)
    @chat_demo = ChatDemo.new(chat_demo)
    if @chat_demo.save
      redirect resource(@chat_demo), :message => {:notice => "ChatDemo was successfully created"}
    else
      message[:error] = "ChatDemo failed to be created"
      render :new
    end
  end
  
  def update(id, chat_demo)
    @chat_demo = ChatDemo.get(id)
    raise NotFound unless @chat_demo
    if @chat_demo.update_attributes(chat_demo)
       redirect resource(@chat_demo)
    else
      display @chat_demo, :edit
    end
  end
  
  def destroy(id)
    @chat_demo = ChatDemo.get(id)
    raise NotFound unless @chat_demo
    if @chat_demo.destroy
      redirect resource(:chat_demos)
    else
      raise InternalServerError
    end
  end
  
end
