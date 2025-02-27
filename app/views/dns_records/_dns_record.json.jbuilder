json.extract! dns_record, :id, :domain_id, :host, :record_type, :value, :ttl, :created_at, :updated_at
json.url dns_record_url(dns_record, format: :json)
