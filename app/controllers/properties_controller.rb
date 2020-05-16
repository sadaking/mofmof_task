class PropertiesController < ApplicationController
before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件情報を登録しました！"
    else
      render :new
    end
  end

  def show
    @nearest_stations = @property.nearest_stations
  end

  def edit
    @property.nearest_stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件情報を修正しました！"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice:"物件情報を削除しました！"
  end

  private

  def property_params
    params.require(:property).permit(
      :property_name,
      :rent,
      :street_address,
      :age,
      :remark,
      nearest_stations_attributes: [:route,
                                    :station,
                                    :minutes_walk],
                                    )
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
