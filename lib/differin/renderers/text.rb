# frozen-string-literal: true
require 'differin/renderers/text/exceptions'
require 'colorize'

unless defined?(Differin::Diff)
  fail Differin::Renderers::TextExceptions::DifferinRequired
end

module Differin
  module Renderers
    class Text < Differin::Renderers::Base
      def render
        self.string = ''

        print_header
        print_body
        print_footer

        string
      end

      private

      # Getters/Setters
      attr_accessor :string, :current_row

      def print_header
        string << "\r\n"
        string << "Differin: #{Differin::VERSION}\r\n"
        line = "#{diff.file1.filename} <=> #{diff.file2.filename}"
        string << "#{line}\r\n"
        string << "#{'*' * line.size}\r\n"
      end

      def print_body
        diff.render(Differin::Renderers::Hash).each do |row|
          self.current_row = row
          string << "#{line_prefix} #{line_text}\r\n".colorize(line_color)
        end
      end

      def print_footer
        string << "\r\n"
      end

      def line_color
        case current_row[:status]
        when Differin::MODIFIED
          :yellow
        when Differin::ADDED
          :green
        when Differin::REMOVED
          :red
        else
          {}
        end
      end

      def line_prefix
        case current_row[:status]
        when Differin::MODIFIED
          '*'
        when Differin::ADDED
          '+'
        when Differin::REMOVED
          '-'
        when Differin::EQUAL
          '='
        else
          ' '
        end
      end

      def line_text
        case current_row[:status]
        when Differin::MODIFIED
          "#{current_row[:values].first}|#{current_row[:values].last}"
        else
          current_row[:values].first || current_row[:values].last
        end
      end
    end
  end
end

Differin::ALLOWED_RENDERERS << Differin::Renderers::Text
