class V1::ZonesController < V1::BaseController

  def create
    @zone = Zone.create(zone_params)
    @zone.user = current_user
    @zone.save!
    render :show, status: :created
  end

  def update
    @zone = Zone.find(params[:id])
    @zone.update_attributes!(zone_params)
    render :show, status: :accepted
  end

  def destroy
    zone = Zone.find(params[:id])
    zone.destroy!
    render status: :no_content, nothing: true
  end

  protected

  def zone_params
    params.require(:zone).permit(:name, :radius, :latitude, :longitude, :visible)
  end

end