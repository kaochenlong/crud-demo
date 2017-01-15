class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
    @text = "你好，我是XXX，上台之後一定會..."
  end

  def show
  end

  def vote
    @candidate.votes.create(ip_address: request.remote_ip)
    redirect_to candidates_path, notice: "投票成功!"
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate.update_attributes(candidate_params)
      redirect_to candidates_path, notice: "#{@candidate.name} 更新成功!"
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice: "已刪除"
  end

  private
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無此資料" unless @candidate
  end

  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :gender)
  end
end

