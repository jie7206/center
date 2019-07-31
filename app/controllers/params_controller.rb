class ParamsController < ApplicationController
  # GET /params
  # GET /params.xml
  # before_filter :check_if_admin

  def index
    @params = Param.all( :order => "order_num" )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @params }
    end
  end

  # GET /params/1
  # GET /params/1.xml
  def show
    @param = Param.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @param }
    end
  end

  # GET /params/new
  # GET /params/new.xml
  def new
    @param = Param.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @param }
    end
  end

  # GET /params/1/edit
  def edit
    @param = Param.find(params[:id])
  end

  # POST /params
  # POST /params.xml
  def create
    @param = Param.new(params[:param])

    respond_to do |format|
      if @param.save
        flash[:notice] = 'Param was successfully created.'
        format.html { redirect_to :action => 'index' }
        format.xml  { render :xml => @param, :status => :created, :location => @param }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @param.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /params/1
  # PUT /params/1.xml
  def update
    @param = Param.find(params[:id])
    ori_value = @param.value

    respond_to do |format|
      if @param.update_attributes(params[:param])
        if @param.rec_change and ori_value != @param.value
          auto_create_param_change( @param.id, @param.value, ori_value )
        end
        flash[:notice] = 'Param was successfully updated.'
        format.html { redirect_to :action => 'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @param.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /params/1
  # DELETE /params/1.xml
  def destroy
    @param = Param.find(params[:id])
    @param.destroy

    respond_to do |format|
      format.html { redirect_to(params_url) }
      format.xml  { head :ok }
    end
  end

  def order_up
    exe_order_up Param, params[:id]
    redirect_to :action => 'index'
  end

  def order_down
    exe_order_down Param, params[:id]
    redirect_to :action => 'index'
  end

  def update_exchange_rates_from_api
    new_value = usd2twd
    # 如果回傳>0才更新(有可能API連不上)
    if new_value > 0
      Param.find_by_name("exchange_rates_USD").update_attribute(:value,new_value)
      Param.find_by_name("exchange_rates_USD_to_MCY").update_attribute(:value,usd2cny)
      Param.find_by_name("exchange_rates_MCY").update_attribute(:value,cny2twd)
      Param.find_by_name("exchange_rates_KRW").update_attribute(:value,krw2twd)
      # 更新火币USDT/HUSD交易对汇率
      update_husd_rate(new_value)
      flash[:notice] = '6種匯率已經更新完畢！'
    else
      flash[:notice] = '無法更新！(有可能API連不上)'
    end
    redirect_to :action => 'index'
  end

end
