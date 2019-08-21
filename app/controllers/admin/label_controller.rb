class Admin::LabelController < ApplicationController
    def new
        @label = Label.new
    end

    def create
        label = Label.new(label_params)
        label.save
        redirect_to "/"
    end

    private

    def label_params
        params.require(:label).permit(:id, :labelname)
    end
end
