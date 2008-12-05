if defined?(Merb::Plugins)
  
  $:.unshift File.dirname(__FILE__)
  
  load_dependency 'merb-slices'
  Merb::Plugins.add_rakefiles "merb-juggernaut/merbtasks", "merb-juggernaut/slicetasks", "merb-juggernaut/spectasks"
  
  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to 
  # the main application layout or no layout at all if needed.
  # 
  # Configuration options:
  # :layout - the layout to use; defaults to :merb-juggernaut
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:merb_juggernaut][:layout] ||= :merb_juggernaut
  
  # All Slice code is expected to be namespaced inside a module
  module MerbJuggernaut
    
    CR = "\0"
    CONFIG = YAML::load(ERB.new(IO.read(Merb.root / "config" / "juggernaut_hosts.yml")).result).freeze
    
    # Slice metadata
    self.description = "Eh chunkeh sliceh of Juggernauteh"
    self.version = "0.0.1"
    self.author = "Ripta Pasay"
    
    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
    end
    
    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices.deactivate(MerbJuggernaut)
    def self.deactivate
    end
    
    # Setup routes inside the host application
    # The slice is mounted at /merb-juggernaut - note that it comes before default_routes
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any 
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    #
    # @note prefix your named routes with :merb_juggernaut_
    #   to avoid potential conflicts with global named routes.
    def self.setup_router(scope)
      # Slice-level resource routes
      scope.resources(:chat_demos)
      # Default slice-level routes
      scope.match('/index(.:format)').to(:controller => 'main', :action => 'index').name(:index)
      scope.match('/').to(:controller => 'main', :action => 'index').name(:home)
      # scope.default_routes
    end
    
  end
  
  # Setup the slice layout for MerbJuggernaut
  #
  # Use MerbJuggernaut.push_path and MerbJuggernaut.push_app_path
  # to set paths to merb-juggernaut-level and app-level paths. Example:
  #
  # MerbJuggernaut.push_path(:application, MerbJuggernaut.root)
  # MerbJuggernaut.push_app_path(:application, Merb.root / 'slices' / 'merb-juggernaut')
  # ...
  #
  # Any component path that hasn't been set will default to MerbJuggernaut.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  MerbJuggernaut.setup_default_structure!
  
  # Add dependencies for other MerbJuggernaut classes below. Example:
  # dependency "merb-juggernaut/other"
  require "merb-juggernaut/commands"
  
end