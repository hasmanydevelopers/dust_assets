require 'tilt'

module DustAssets
  class TiltDust < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def evaluate(scope, locals, &block)
      template_name = scope.logical_path.to_s.gsub('"', "")
      compiled = Dust.precompile(data, template_name)
      <<-TEMPLATE
        (function(ctx, callback) {
          dust.loadSource(#{compiled.inspect});
          dust.render('#{template_name}', ctx, callback);
        })
      TEMPLATE
    end

    def prepare; end

  end
end
