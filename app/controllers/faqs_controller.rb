class FaqsController < HomeController
  def index
    @faqs = Faq.all
  end
end
