require 'test_helper'

module DustAssets
  class TiltDustTest < Test::Unit::TestCase
    def test_render
      # Try to act like sprockets.
      scope = Object.new
      class << scope
        def logical_path ; 'x11' ; end
      end
      template = DustAssets::TiltDust.new('/myapp/app/assets/templates/x11.jst.dust') { "Hello {name}!" }
      compiled_template = <<-TEMPLATE
        (function(ctx, callback) {
                  dust.loadSource('(function(){dust.register("x11",body_0);function body_0(chk,ctx){return chk.write("Hello ").reference(ctx.get("name"),ctx,"h").write("!");}return body_0;})();');
                  dust.render('x11', ctx, callback);
                })
      TEMPLATE
      assert_equal compiled_template, template.render(scope, {})
    end
  end
end
