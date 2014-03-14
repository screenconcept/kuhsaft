module Kuhsaft
  class AnchorBrick < Brick
    validates :caption, presence: true

    def user_can_add_childs?
      false
    end

    def collect_fulltext
      [super, caption].join(' ')
    end

    def to_id
      "anchor-#{caption.parameterize}"
    end
  end
end
