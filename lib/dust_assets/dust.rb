# Based on https://github.com/josh/ruby-coffee-script
require 'execjs'
require 'pathname'

module DustAssets
  class Dust
    class << self
      def precompile(source, name)
        context.call('dust.compile', source, name)
      end

      private

      def context
        @context ||= ExecJS.compile(source)
      end

      def source
        @source ||= path.read
      end

      def path
        @path ||= assets_path.join('dust.js')
      end

      def assets_path
        @assets_path ||= Pathname(DustAssets.path)
      end
    end
  end
end
