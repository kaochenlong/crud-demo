class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    clean_params = params.require(:candidate).permit(:name, :age, :party, :gender)

    @candidate = Candidate.new(clean_params)

    if @candidate.save
      redirect_to candidates_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無此資料" unless @candidate
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無此資料" unless @candidate

    clean_params = params.require(:candidate).permit(:name, :age, :party, :gender)
    if @candidate.update_attributes(clean_params)
      redirect_to candidates_path, notice: "#{@candidate.name} 更新成功!"
    else
      render :edit
    end
  end

end

