class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = current_user.message_summery
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @messages = current_user.message_summery
    @message = Message.new
    respond_to do |format|
      format.html
      format.js { render layout: false}
    end
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.sender = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url, notice: 'Message was successfully send.' }
        format.json { render :show, status: :created, location: @message }
        format.js { render layout: false}
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
        format.js { render inline: 'alert("Something went wrong! Please try again later.");'}
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all
    @user = User.find(params[:user_id])
    @messages = current_user.messages_with(@user.id)
    respond_to do |format|
      format.html { redirect_to messages_url}
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:receiver_id, :text, :status, :seen_at)
    end
end
