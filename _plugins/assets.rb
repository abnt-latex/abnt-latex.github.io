require 'fileutils'

module Jekyll
  Jekyll::Hooks.register :site, :post_write do |site|
    response = false
    exception_message = "\t\"ImageMagick\" is required to create the favicon"
    begin
      response = system("convert --version")
    rescue
      raise exception_message
    ensure
      if !response
        raise exception_message
      end
    end

    destination = site.dest || "_site"
    config_logo = site.config['logo'] || "logo.svg"
    config_icon_ico = site.config['icon_ico'] || "favicon.ico"

    input_file = "#{destination}/#{config_logo}"
    output_file = "#{destination}/#{config_icon_ico}"
    system_command = "convert -density 256x256 -background transparent #{input_file} -define icon:auto-resize #{output_file}"

    response = false
    begin
      response = system(system_command)
    rescue
      puts "An error occurred"
    ensure
      if response
        puts "\tJekyll Assets: Generating favicon for site"
      else
        puts "An error occurred"
      end
    end
  end

  class SeoTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      description = context.registers[:site].config["description"]
      output = "#{@text}"
      output += "#{!description.empty? ? "<meta name=\"description\" content=\"#{description}\">" : ""}"

      output
    end
  end
end

Liquid::Template.register_tag('seo', Jekyll::SeoTag)