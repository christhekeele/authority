class TicketTypesController < ApplicationController
  before_action :set_ticket_type, only: [:show, :edit, :update, :destroy]
  
  # Notice in the ticket_type_authorizer we log the extra options. I show the output
  # of the logger before each authorization:
  
  # Notice nothing is logged here.
  # OPTS:
  authorize_actions_for TicketType, context: "controller-level doesn't accept options"
  
  before_action :custom_authorization
  
private

  def custom_authorization
    # This works.
    # OPTS:  {:context=>"custom controller-level accepts options"}
    authorize_action_for TicketType, context: "custom controller-level accepts options"
  end
  
public

  def index
    # This works.
    # OPTS:  {:context=>"action-level accepts options"}
    authorize_action_for TicketType, context: "action-level accepts options"
    @ticket_types = TicketType.all
  end

  def show
  end

  def new
    @ticket_type = TicketType.new
  end

  def edit
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to @ticket_type, notice: 'Ticket type was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_type }
      else
        format.html { render :new }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket_type.update(ticket_type_params)
        format.html { redirect_to @ticket_type, notice: 'Ticket type was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_type }
      else
        format.html { render :edit }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket_type.destroy
    respond_to do |format|
      format.html { redirect_to ticket_types_url, notice: 'Ticket type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ticket_type
      @ticket_type = TicketType.find(params[:id])
    end

    def ticket_type_params
      params.fetch(:ticket_type, {})
    end
end
