class Admin::TrainingProvidersController < AdminController
  before_action :set_training_provider, only: [:show, :edit, :update, :destroy]


  def index
    @training_providers = TrainingProvider.all
  end

  def new
    @training_provider = TrainingProvider.new
  end

  def edit
  end

  def create
    @training_provider = TrainingProvider.new(training_provider_params)

    if @training_provider.save
      redirect_to admin_training_providers_path, notice: 'Training provider was successfully created.'
    else
      render :new
    end
  end

  def update
    if @training_provider.update(training_provider_params)
      redirect_to admin_training_providers_path, notice: 'Training provider was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @training_provider.destroy
    redirect_to training_providers_url, notice: 'Training provider was successfully destroyed.'
  end

  private

    def set_training_provider
      @training_provider = TrainingProvider.find(params[:id])
    end

    def training_provider_params
      params.require(:training_provider).permit(:name, :email)
    end
end
