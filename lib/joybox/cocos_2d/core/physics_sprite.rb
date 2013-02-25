# TODO: Revisar el nombre de esto
module Joybox
  module Cocos2D
    module Core

      class PhysicsSprite < Sprite

        attr_accessor :physics_body


        def dirty

          true
        end

        # We need this method to return true, so Cocos2d continue
        # to call the nodeToParentTransform method
        def nodeToParentTransform

          position = @physics_body.position.to_coordinates

          position = position + anchorPointInPoints if ignoreAnchorPointForPosition

          angle = @physics_body.angle

          x = position.x
          y = position.y
          cosine = Math.cos(angle)
          sine = Math.sin(angle)


          unless anchorPointInPoints == CGPointZero

            x = x + cosine * -anchorPointInPoints.x + -sine * -anchorPointInPoints.y
            y = y + sine * -anchorPointInPoints.x + cosine * -anchorPointInPoints.y        
          end


          CGAffineTransformMake(cosine, sine, -sine, cosine, x, y)
        end

      end

    end
  end
end