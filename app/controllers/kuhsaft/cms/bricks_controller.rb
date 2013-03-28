module Kuhsaft
  module Cms
    class BricksController < AdminController

      respond_to :html, :js

      def create
        @brick = params[:brick][:type].constantize.new(params[:brick])
        @brick.image_size = ImageSize.all.first.name.to_s
        @brick.save(:validate => false)
      end

      def update
        @brick = Kuhsaft::Brick.find(params[:id])
        @brick.update_attributes(params[:brick])

        #
        # rails will fall back to html if ajax can't be used
        # this is the case with the image brick, because ajax does not
        # support image uploads
        #
        respond_with @brick do |format|
          format.js
          format.html { redirect_to edit_cms_page_path(@brick.parents.first) }
        end
      end

      def destroy
        @brick = Kuhsaft::Brick.find(params[:id])
        @parent_brick = @brick.brick_list
        @brick.destroy
      end

      def sort
        if params[:bricks].present?
          params[:bricks][:ids].split(',').each_with_index do |id, idx|
            Kuhsaft::Brick.find(id).update_attribute(:position, idx.to_i + 1)
          end
        end
        render :nothing => true
      end

    end
  end
end
