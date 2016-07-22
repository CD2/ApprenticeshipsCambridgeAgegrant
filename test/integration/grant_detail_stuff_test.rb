require 'test_helper'

class GrantDetailStuffTest < ActionDispatch::IntegrationTest


  test "old and young numbers update" do
    get '/'
    assert_select 'span.count_down.old', 1, GrantDetail.old.count
    assert_difference 'GrantDetail.old.count', 1 do
      grant_details(:grant_detail_50_years_old).dup.save!
    end
    assert_select 'span.count_down.old', 1, GrantDetail.old.count
    assert_select 'span.count_down.young', 1, GrantDetail.old.count
    assert_difference 'GrantDetail.young.count', 1 do
      grant_details(:grant_detail_17_years_old).dup.save!
    end
    assert_select 'span.count_down.young', 1, GrantDetail.old.count
  end

  test 'data isnt messed up on save' do
    get '/apply'
    assert_select 'form', 1

    # params = Hash[*JSON.load(grant_details(:grant_detail_50_years_old).to_json).map{ |k, v| [k.to_sym, v] }.flatten]
    
    # post '/age-grant', params: params
  end


end
