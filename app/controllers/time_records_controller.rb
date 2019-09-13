class TimeRecordsController < ApplicationController
  before_action :set_user
  before_action :set_time_record, only: [:show, :edit, :update, :destroy]

  # GET /time_records
  # GET /time_records.json
  def index
    @time_records = @user.time_records.order({date: :desc, created_at: :desc})
    logger.debug current_user.inspect
    logger.debug @user.inspect
    authorize! :list_time_records, @user
    @dated_records = @time_records.group_by {|r| r.date}
  end

  # GET /time_records/1
  # GET /time_records/1.json
  def show
    authorize! :read, @time_record
  end

  # GET /time_records/new
  def new
    @time_record = TimeRecord.new(user: @user)
    @time_record.date = Date.parse params[:date] rescue Date.today
    authorize! :create, @time_record
  end

  # GET /time_records/1/edit
  def edit
    authorize! :update, @time_record
  end

  # POST /time_records
  # POST /time_records.json
  def create
    @time_record = TimeRecord.new(time_record_params)
    @time_record.user = @user
    authorize! :create, @time_record

    respond_to do |format|
      if @time_record.save
        format.html { redirect_to [@user, @time_record], notice: 'Time record was successfully created.' }
        format.json { render :show, status: :created, location: @time_record }
      else
        format.html { render :new }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_records/1
  # PATCH/PUT /time_records/1.json
  def update
    authorize! :update, @time_record

    respond_to do |format|
      if @time_record.update(time_record_params)
        format.html { redirect_to [@user, @time_record], notice: 'Time record was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_record }
      else
        format.html { render :edit }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_records/1
  # DELETE /time_records/1.json
  def destroy
    authorize! :destroy, @time_record

    @time_record.destroy
    respond_to do |format|
      format.html { redirect_to user_time_records_url(@user), notice: 'Time record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_time_record
      @time_record = @user.time_records.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_record_params
      params.require(:time_record).permit(:date, :hours, :description)
    end
end
