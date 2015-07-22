class InvoicesController < ApplicationController
  def new
  	@invoice= Invoice.new
  	@item=Item.new
  	@billers= User.find(:all, :conditions =>{ :roles => 'biller'})
  	@customers= User.find(:all, :conditions => {:roles => 'customer'})
  	@products=Product.all
  end

  def create
  	@invoice=Invoice.new(params[:invoice])
    
  	if @invoice.save
  		params[:item].each do |i|
        @it=@invoice.items.build(i)
        unless @it.save
          Invoice.delete(@invoice.id)
          render :action =>'new'
          break;
        end
      end
      redirect_to root_url
  	else
  			render :action => 'new'	
  	end
  end

  def index
    if(request.url.include?("biller_invoices"))
      @invoices=Invoice.find(:all, :conditions => {:biller => current_user.username})
    elsif (request.url.include?("customer_invoices"))
      @invoices=Invoice.find(:all, :conditions => {:customer => current_user.username})
    else 
    	@invoices = Invoice.all()
    end
  end

  def show
  	@invoice = Invoice.find(params[:id])
  	@items = @invoice.items
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attribute(:invoice_status,"paid")
    #format.html{render action: "index"}
    #format.js{}
    redirect_to invoices_path
  end


  before_filter :authenticate, :only => [:new,:show,:update,:index,:delete]
  before_filter :authorize,:only =>[:new,:create,:delete,:update]

  def authorize
      if current_user.roles != "user"
        flash[:notice] = "Not A Authourized User!!"
        redirect_to root_url
      end
  end

end
