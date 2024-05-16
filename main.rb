require 'redcarpet'
require 'wicked_pdf'
require 'pry'

source_file_content = ARGF.read
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)

pdf = WickedPdf.new.pdf_from_string(markdown.render(source_file_content))

File.open('markdown_as_pdf.pdf', 'wb') do |file|
  file << pdf
end

