class MainController < ApplicationController
  $listsub = []
  $listnum = []
  $gnum = 0
  
  def select
    @amount = []
    for i in 1..10 do
      @amount = @amount.append(i)
    end
  end

  def test
    @num = params[:num].to_i
    $gnum = @num
    valid = true

    for i in 1..@num do
      if params["subject#{i}"].blank? or params["score#{i}"].blank?
      	valid = false
      	break  
      
      else
        $listsub = $listsub.append(params["subject#{i}"])
        $listnum = $listnum.append(params["score#{i}"].to_f)
      end
    end
    
    if valid and params[:select]=="false"
      redirect_to controller: 'main', action: 'result'
    end
  end

  def result
    for i in 1..$gnum do
      record = Record.new
      record.subject = $listsub[i-1]
      record.score = $listnum[i-1]
      record.save
    end
    
    lsub = []
    lnum = []
    for e in Record.all do
      lsub = lsub.append(e.subject)
      lnum = lnum.append(e.score)
    end  
    idx = lnum.each_with_index.max[1]
    @maxsub = lsub[idx]
    @maxscore = lnum[idx]
    @sumscore = lnum.sum
  end
end
