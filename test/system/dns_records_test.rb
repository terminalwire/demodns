require "application_system_test_case"

class DnsRecordsTest < ApplicationSystemTestCase
  setup do
    @dns_record = dns_records(:one)
  end

  test "visiting the index" do
    visit dns_records_url
    assert_selector "h1", text: "Dns records"
  end

  test "should create dns record" do
    visit dns_records_url
    click_on "New dns record"

    fill_in "Domain", with: @dns_record.domain_id
    fill_in "Host", with: @dns_record.host
    fill_in "Record type", with: @dns_record.record_type
    fill_in "Ttl", with: @dns_record.ttl
    fill_in "Value", with: @dns_record.value
    click_on "Create DNS record"

    assert_text "Dns record was successfully created"
    click_on "Back"
  end

  test "should update Dns record" do
    visit dns_record_url(@dns_record)
    click_on "Edit this DNS record", match: :first

    fill_in "Domain", with: @dns_record.domain_id
    fill_in "Host", with: @dns_record.host
    fill_in "Record type", with: @dns_record.record_type
    fill_in "Ttl", with: @dns_record.ttl
    fill_in "Value", with: @dns_record.value
    click_on "Update Dns record"

    assert_text "Dns record was successfully updated"
    click_on "Back"
  end

  test "should destroy Dns record" do
    visit dns_record_url(@dns_record)
    click_on "Destroy this DNS record", match: :first

    assert_text "Dns record was successfully destroyed"
  end
end
