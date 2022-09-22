class ScoreController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def list
  
    @records = Record.all
    listsub = []
    listnum = []
    for e in @records do
      listsub = listsub.append(e.subject)
      listnum = listnum.append(e.score)
    end  
    idx = listnum.each_with_index.max[1]
    @maxsub = listsub[idx]
    @maxscore = listnum[idx]
    @sumscore = listnum.sum
    
  end

  def edit
    if params[:select]
      @id = params[:id]
      @subject = Record.find(@id).subject
      @score = Record.find(@id).score
    else
      @id = params[:id]
      @t = Record.find(@id)
      @t.subject = params[:subject]
      @t.score = params[:score]
      @t.save!
      redirect_to controller: 'score', action: 'list'
    end
  end

  def delete
    Record.destroy_by(id: params[:id])
    redirect_to controller: 'score', action: 'list'
  end
end
