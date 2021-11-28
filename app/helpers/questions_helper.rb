module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New '#{@test.title}' Question"
    else
      "Edit '#{question.test.title}' Question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repository)
    link_to 'Thinknetica Test Guru', "https://github.com/#{author}/#{repository}"
  end
end
