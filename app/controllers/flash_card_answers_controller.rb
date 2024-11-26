class FlashCardAnswersController < ApplicationController
  before_action :set_flash_card_answer, only: %i[ show edit update destroy ]

  # GET /flash_card_answers or /flash_card_answers.json
  def index
    @flash_card_answers = FlashCardAnswer.all
  end

  # GET /flash_card_answers/1 or /flash_card_answers/1.json
  def show
  end

  # GET /flash_card_answers/new
  def new
    @flash_card_answer = FlashCardAnswer.new
  end

  # GET /flash_card_answers/1/edit
  def edit
  end

  # POST /flash_card_answers or /flash_card_answers.json
  def create
    @flash_card_answer = FlashCardAnswer.new(flash_card_answer_params)

    respond_to do |format|
      if @flash_card_answer.save
        format.html { redirect_to @flash_card_answer, notice: "Flash card answer was successfully created." }
        format.json { render :show, status: :created, location: @flash_card_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flash_card_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flash_card_answers/1 or /flash_card_answers/1.json
  def update
    respond_to do |format|
      if @flash_card_answer.update(flash_card_answer_params)
        format.html { redirect_to @flash_card_answer, notice: "Flash card answer was successfully updated." }
        format.json { render :show, status: :ok, location: @flash_card_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flash_card_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flash_card_answers/1 or /flash_card_answers/1.json
  def destroy
    @flash_card_answer.destroy!

    respond_to do |format|
      format.html { redirect_to flash_card_answers_path, status: :see_other, notice: "Flash card answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flash_card_answer
      @flash_card_answer = FlashCardAnswer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def flash_card_answer_params
      params.expect(flash_card_answer: [ :flash_card_id, :value, :explanation ])
    end
end
