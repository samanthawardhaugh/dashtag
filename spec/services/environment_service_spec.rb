require 'spec_helper'

describe EnvironmentService do
  describe "header title" do
    it "should return a title for user set in env" do
      expect(EnvironmentService.header_title).to eq(ENV["HEADER_TITLE"])
    end

    it "should return string of hashtags if title is not set in env" do
      default_val = ENV["HEADER_TITLE"]
      default_title = "##{EnvironmentService.hashtag_array.join(" #")}"
      ENV["HEADER_TITLE"] = nil
      expect(EnvironmentService.header_title).to eq(default_title)
      ENV["HEADER_TITLE"] = ""
      expect(EnvironmentService.header_title).to eq(default_title)
      ENV["HEADER_TITLE"] = default_val
    end
  end

  describe "hashtags" do
    it "should return an empty array if hashtag is not set in env" do
      default_val = ENV["HASHTAGS"]
      ENV["HASHTAGS"] = nil
      expect(EnvironmentService.hashtag_array).to be_empty
      ENV["HASHTAGS"] = ""
      expect(EnvironmentService.hashtag_array).to be_empty
      ENV["HASHTAGS"] = default_val
    end

    it 'should parse EnvironmentService.hashtag into an array' do
      default_val = ENV["HASHTAGS"]
      ENV["HASHTAGS"] = "yolo|dance|christmas"
      expected_array = ['yolo', 'dance', 'christmas']
      expect(EnvironmentService.hashtag_array).to eq(expected_array)
      ENV["HASHTAGS"] = default_val
    end
  end

  describe "twitter credentials" do
    it "should return twitter credentials set in env" do
      expect(EnvironmentService.twitter_bearer_credentials).to eq(ENV["TWITTER_BEARER_CREDENTIALS"])
    end
    it "should return nil if twitter credentials are not set in env" do
      default_cred = ENV["TWITTER_BEARER_CREDENTIALS"]
      ENV["TWITTER_BEARER_CREDENTIALS"] = nil
      expect(EnvironmentService.twitter_bearer_credentials).to be_nil
      ENV["TWITTER_BEARER_CREDENTIALS"] = default_cred
    end
  end
  describe "instagram credentials" do
    it "should return twitter credentials set in env" do
      expect(EnvironmentService.instagram_client_id).to eq(ENV["INSTAGRAM_CLIENT_ID"])
    end
    it "should return nil if twitter credentials are not set in env" do
      default_cred = ENV["INSTAGRAM_CLIENT_ID"]
      ENV["INSTAGRAM_CLIENT_ID"] = nil
      expect(EnvironmentService.instagram_client_id).to be_nil
      ENV["INSTAGRAM_CLIENT_ID"] = default_cred
    end
  end

  describe "censored words" do
    it "should return censored words set in env" do
      expect(EnvironmentService.censored_words).to eq(ENV["CENSORED_WORDS"])
    end
    it "should return nil if twitter credentials are not set in env" do
      default_cred = ENV["CENSORED_WORDS"]
      ENV["CENSORED_WORDS"] = nil
      expect(EnvironmentService.censored_words).to be_nil
      ENV["CENSORED_WORDS"] = default_cred
    end
  end

  describe "censored users" do
    it "should return censored users set in env" do
      expect(EnvironmentService.censored_users).to eq(ENV["CENSORED_USERS"])
    end
    it "should return nil if twitter credentials are not set in env" do
      default_cred = ENV["CENSORED_USERS"]
      ENV["CENSORED_USERS"] = nil
      expect(EnvironmentService.censored_users).to be_nil
      ENV["CENSORED_USERS"] = default_cred
    end
  end

  describe "disable retweets" do
    it "should return what is set in env in downcase" do
      test_env = ENV["DISABLE_RETWEETS"]
      ENV["DISABLE_RETWEETS"] = "fAlSe"
      expect(EnvironmentService.disable_retweets).to eq(false)
      ENV["DISABLE_RETWEETS"] = test_env
    end

    it "should return true by default" do
      test_env = ENV["DISABLE_RETWEETS"]
      ENV["DISABLE_RETWEETS"] = nil
      expect(EnvironmentService.disable_retweets).to eq(true)
      ENV["DISABLE_RETWEETS"] = test_env
    end
  end

  describe "api_rate" do
    it "should return what is set in env" do
      test_env = ENV["API_RATE"]
      ENV["API_RATE"] = "10"
      expect(EnvironmentService.api_rate).to eq(10)
      ENV["API_RATE"] = test_env
    end

    it "should return 15 by default" do
      test_env = ENV["API_RATE"]
      ENV["API_RATE"] = nil
      expect(EnvironmentService.api_rate).to eq(15)
      ENV["API_RATE"] = test_env
    end

    it "should return 15 if entry is not integer" do
      test_env = ENV["API_RATE"]
      ENV["API_RATE"] = "stuff"
      expect(EnvironmentService.api_rate).to eq(15)
      ENV["API_RATE"] = test_env
    end
  end

  describe "ajax_interval" do
    it "should return what is set in env" do
      test_env = ENV["AJAX_INTERVAL"]
      ENV["AJAX_INTERVAL"] = "1000"
      expect(EnvironmentService.ajax_interval).to eq(1000)
      ENV["AJAX_INTERVAL"] = test_env
    end

    it "should return 5000 by default" do
      test_env = ENV["AJAX_INTERVAL"]
      ENV["AJAX_INTERVAL"] = nil
      expect(EnvironmentService.ajax_interval).to eq(5000)
      ENV["AJAX_INTERVAL"] = test_env
    end

    it "should return 5000 if entry is not integer" do
      test_env = ENV["AJAX_INTERVAL"]
      ENV["AJAX_INTERVAL"] = "stuff"
      expect(EnvironmentService.ajax_interval).to eq(5000)
      ENV["AJAX_INTERVAL"] = test_env
    end
  end


  describe "db_row_limit" do
    it "should return what is set in env" do
      test_env = ENV["DB_ROW_LIMIT"]
      ENV["DB_ROW_LIMIT"] = "3000"
      expect(EnvironmentService.db_row_limit).to eq(3000)
      ENV["DB_ROW_LIMIT"] = test_env
    end

    it "should return 8000 by default" do
      test_env = ENV["DB_ROW_LIMIT"]
      ENV["DB_ROW_LIMIT"] = nil
      expect(EnvironmentService.db_row_limit).to eq(8000)
      ENV["DB_ROW_LIMIT"] = test_env
    end


    it "should return 8000 if entry is not integer" do
      test_env = ENV["DB_ROW_LIMIT"]
      ENV["DB_ROW_LIMIT"] = "stuff"
      expect(EnvironmentService.db_row_limit).to eq(8000)
      ENV["DB_ROW_LIMIT"] = test_env
    end
  end

  describe "color_1" do
    it "should return what is set in env" do
      test_env = ENV["COLOR_1"]
      ENV["COLOR_1"] = "#07c"
      expect(EnvironmentService.color_1).to eq("#07c")
      ENV["COLOR_1"] = test_env
    end
  end

    describe "color_2" do
    it "should return what is set in env" do
      test_env = ENV["COLOR_2"]
      ENV["COLOR_2"] = "#07c"
      expect(EnvironmentService.color_2).to eq("#07c")
      ENV["COLOR_2"] = test_env
    end
  end

    describe "color_3" do
    it "should return what is set in env" do
      test_env = ENV["COLOR_3"]
      ENV["COLOR_3"] = "#07c"
      expect(EnvironmentService.color_3).to eq("#07c")
      ENV["COLOR_3"] = test_env
    end
  end

    describe "color_4" do
    it "should return what is set in env" do
      test_env = ENV["COLOR_4"]
      ENV["COLOR_4"] = "#07c"
      expect(EnvironmentService.color_4).to eq("#07c")
      ENV["COLOR_4"] = test_env
    end
  end
end
