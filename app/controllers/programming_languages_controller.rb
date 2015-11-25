class ProgrammingLanguagesController < ApplicationController

  before_action :find_language, only: [:show, :edit, :update, :destroy]

  def index
    @languages = ProgrammingLanguage.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 15
    end.results

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def new
    @language = ProgrammingLanguage.new
  end

  def create
    @language = ProgrammingLanguage.new(params[:programming_language])
    if @language.save
      flash[:success] = "New programming language was created successfully"
      redirect_to programming_languages_path
    else
      flash[:error] = "Cannot be saved"
      render "new"
    end
  end

  def edit
  end

  def update
    if @language.update_attributes(programming_language_params)
      flash[:success] = "Programming language was updated successfully"
      redirect_to programming_language_path
    else
      flash[:error] = "Cannot be saved"
      render "edit"
    end
  end

  def destroy
    @language.destroy
    flash[:success] = "#{@language.name} was deleted"
  end

  private

  def find_language
    @language = ProgrammingLanguage.find(params[:id])
  end

  def programming_language_params
    params.require(:programming_language).permit(:name, {type_ids: []}, {author_ids: []})
  end

end