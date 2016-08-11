require 'test_helper'

class GrantDetailStuffTest < ActionDispatch::IntegrationTest


  test "old and young numbers update" do
    get '/'
    assert_select 'span.old', 1
    assert_select 'span.count_down.old', 1
    assert_select 'span.count_down.young', 1

    assert_difference 'GrantDetail.old.count', 1 do
      grant_details(:grant_detail_50_years_old).dup.save!
    end
    assert_difference 'GrantDetail.young.count', 1 do
      grant_details(:grant_detail_17_years_old).dup.save!
    end
    assert_select 'span.count_down.young', 1
  end

  test 'data isnt messed up on save' do
    get '/apply'
    assert_select 'form', 1

    #gen params
    gd_params = Hash[*JSON.load(grant_details(:grant_detail_50_years_old).to_json).map{ |k, v| [k.to_sym, v] }.flatten]
    user_params = Hash[*JSON.load(users(:non_admin).to_json).map{ |k, v| [k.to_sym, v] }.flatten]
    user_params[:email] = 'unique@email.com'
    user_params[:password] = 'pass123'


    assert_difference 'GrantDetail.count', 1 do
      post '/age-grant', params: {grant_detail: gd_params.merge(user_params)}
      assert_response 302
    end

    get '/admin/grant_details'
    assert_response 302
    login(users(:admin))
    get '/admin/grant_details'
    assert_response 200

    assert_select 'td', text: user_params[:email]

  end


  test 'emails if no training provider' do

   assert_difference 'ActionMailer::Base.deliveries.count', 2 do

      gd_params = Hash[*JSON.load(grant_details(:grant_detail_50_years_old).to_json).map{ |k, v| [k.to_sym, v] }.flatten]
      user_params = Hash[*JSON.load(users(:non_admin).to_json).map{ |k, v| [k.to_sym, v] }.flatten]
      user_params[:email] = 'unique@email.com'
      user_params[:password] = 'pass123'
      gd_params[:training_provider] = -1

      assert_difference 'GrantDetail.count', 1 do
        post '/age-grant', params: {grant_detail: gd_params.merge(user_params)}
        assert_response 302
      end

    end

  end


end
