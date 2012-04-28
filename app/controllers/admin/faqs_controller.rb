class Admin::FaqsController < Admin::AdminController

  respond_to :html

  before_filter :find_faq, :only => [:edit,:update, :destroy]
  
  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new params[:faq]
    if @faq.save
      respond_with @faq, :location => admin_faqs_path
    else
      render :new

    end
  end

  def index
    respond_with @faqs = Faq.all
  end

  def edit
    respond_with @faq
  end

  def update
    if @faq.update_attributes(params[:faq])
      respond_with @faq, :location => admin_faqs_path
    else
      render :edit
    end  
  end

  def destroy
    @faq.destroy
    flash[:notice] = "Entry deleted"
    redirect_to admin_faqs_path
  end

  private

  def find_faq
    @faq = Faq.find params[:id]
  end
end
