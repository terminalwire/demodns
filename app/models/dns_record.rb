class DnsRecord < ApplicationRecord
  RECORD_TYPES = %w(A AAAA CNAME MX TXT)

  belongs_to :domain
  validates :record_type, presence: true, inclusion: { in: RECORD_TYPES }
  validates :value, presence: true
end
