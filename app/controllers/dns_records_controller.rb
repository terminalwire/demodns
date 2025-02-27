class DnsRecordsController < ApplicationController
  before_action :set_dns_record, only: %i[ show edit update destroy ]
  before_action do
    if params.key? :domain_id
      @domain = Domain.find_by(id: params[:domain_id])
    else
      @domain = @dns_record.domain
    end
  end

  # GET /dns_records or /dns_records.json
  def index
    @dns_records = DnsRecord.all
  end

  # GET /dns_records/1 or /dns_records/1.json
  def show
  end

  # GET /dns_records/new
  def new
    @dns_record = DnsRecord.new
  end


  # GET /dns_records/1/edit
  def edit
  end

  # POST /dns_records or /dns_records.json
  def create
    @dns_record = DnsRecord.new(dns_record_params)
    @dns_record.domain = @domain

    respond_to do |format|
      if @dns_record.save
        format.html { redirect_to @dns_record, notice: "DNS record was successfully created." }
        format.json { render :show, status: :created, location: @dns_record }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dns_records/1 or /dns_records/1.json
  def update
    respond_to do |format|
      if @dns_record.update(dns_record_params)
        format.html { redirect_to @dns_record, notice: "DNS record was successfully updated." }
        format.json { render :show, status: :ok, location: @dns_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dns_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dns_records/1 or /dns_records/1.json
  def destroy
    @dns_record.destroy!

    respond_to do |format|
      format.html { redirect_to domain_dns_records_path(@dns_record.domain), status: :see_other, notice: "DNS record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dns_record
      @dns_record = DnsRecord.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dns_record_params
      params.expect(dns_record: [ :domain_id, :host, :record_type, :value, :ttl ])
    end
end
