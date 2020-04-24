module TestPassagesHelper
  def show_result
    if @test_passage.success?
      ("<h2 style='color:green'>#{result_message}<br>Congratulations! You have passed the test.</h2>").html_safe
    else
      ("<h2 style='color:red'>#{result_message}<br>You haven't passed the test.</h2>").html_safe
    end
  end

  def result_message
    "Your result is #{@test_passage.percent_of_corrent_answers} %."
  end
end
