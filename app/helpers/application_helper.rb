module Merb
  module MerbJuggernaut
    
    module ApplicationHelper
      
      def juggernaut(options = { })
        hosts = ::MerbJuggernaut::CONFIG[:hosts].select {|h| !h[:environment] || h[:environment].to_sym == Merb.env.to_sym }
        random_host = hosts[rand(hosts.length)]
        options = {
          :host                 => (random_host[:public_host] || random_host[:host]),
          :port                 => (random_host[:public_port] || random_host[:port]),
          :width                => '0px',
          :height               => '0px',
          :session_id           => session.session_id,
          :swf_address          => "/media/juggernaut.swf",
          :ei_swf_address       => "/media/expressinstall.swf",
          :flash_version        => 8,
          :flash_color          => "#fff",
          :swf_name             => "juggernaut_flash",
          :bridge_name          => "juggernaut",
          :debug                => (Merb.env.to_s == 'development'),
          :reconnect_attempts   => 3,
          :reconnect_intervals  => 3
        }.merge(options)
        %Q{<script type="text/javascript" charset="utf-8">
          jQuery(document).ready(function() {
            jQuery.Juggernaut.initialize(#{options.to_json})
          });
        </script>}
      end
      
      # @param *segments<Array[#to_s]> Path segments to append.
      #
      # @return <String> 
      #  A path relative to the public directory, with added segments.
      def image_path(*segments)
        public_path_for(:image, *segments)
      end
      
      # @param *segments<Array[#to_s]> Path segments to append.
      #
      # @return <String> 
      #  A path relative to the public directory, with added segments.
      def javascript_path(*segments)
        public_path_for(:javascript, *segments)
      end
      
      # @param *segments<Array[#to_s]> Path segments to append.
      #
      # @return <String> 
      #  A path relative to the public directory, with added segments.
      def stylesheet_path(*segments)
        public_path_for(:stylesheet, *segments)
      end
      
      # Construct a path relative to the public directory
      # 
      # @param <Symbol> The type of component.
      # @param *segments<Array[#to_s]> Path segments to append.
      #
      # @return <String> 
      #  A path relative to the public directory, with added segments.
      def public_path_for(type, *segments)
        ::MerbJuggernaut.public_path_for(type, *segments)
      end
      
      # Construct an app-level path.
      # 
      # @param <Symbol> The type of component.
      # @param *segments<Array[#to_s]> Path segments to append.
      #
      # @return <String> 
      #  A path within the host application, with added segments.
      def app_path_for(type, *segments)
        ::MerbJuggernaut.app_path_for(type, *segments)
      end
      
      # Construct a slice-level path.
      # 
      # @param <Symbol> The type of component.
      # @param *segments<Array[#to_s]> Path segments to append.
      #
      # @return <String> 
      #  A path within the slice source (Gem), with added segments.
      def slice_path_for(type, *segments)
        ::MerbJuggernaut.slice_path_for(type, *segments)
      end
      
    end
  end
end