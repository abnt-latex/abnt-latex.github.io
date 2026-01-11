require 'fileutils'

module Jekyll
  Jekyll::Hooks.register :site, :post_write do |site|
    destination = site.dest || "_site"
    config_icon_svg = site.config['icon_svg'] || "icon.svg"
    config_icon_ico = site.config['icon_ico'] || "favicon.ico"

    input_file = "#{destination}/#{config_icon_svg}"
    output_file = "#{destination}/#{config_icon_ico}"
    system_command = "convert -density 256x256 -background transparent #{input_file} -define icon:auto-resize #{output_file}"

    response = false
    begin
      response = system(system_command)
    rescue
      puts "\t\"ImageMagick\" is required to create the favicon"
    ensure
      if response
        puts "\tJekyll Assets: Generating favicon for site"
      end
    end
  end
end