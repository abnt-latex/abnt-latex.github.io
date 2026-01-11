require 'fileutils'

module Jekyll
  Jekyll::Hooks.register :site, :post_write do |site|
    destination = site.dest
    input_file = "#{destination}/assets/logo.svg"
    output_file = "#{destination}/favicon.ico"
    system_command = "convert -density 256x256 -background transparent #{input_file} -define icon:auto-resize #{output_file}"

    puts "Jekyll Assets: Generating favicon for site"

    system(system_command)
  end
end