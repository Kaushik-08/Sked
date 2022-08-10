# frozen_string_literal: true

require 'test_helper'

class DefaultImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get default_images_new_url
    assert_response :success
  end
end
