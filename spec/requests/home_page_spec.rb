require 'spec_helper'

describe "Home page" do

  describe "before sign up or sign in" do

		before { visit root_path }

		it "should have selector 'title'" do
			page.should have_selector('title', text: "ToDo List")
		end

		it "should not have link 'New Task'" do
			page.should_not have_link('New Task', href: '/tasks/new')
		end
		
		it "should not have link 'Sing out'" do
			page.should_not have_link('Sign out', href: '/users/sign_out')
		end

		it "should have link 'sign up'" do
			page.should have_link("Sign up", href: new_user_registration_path)
		end

		it "should have link 'sign in'" do
			page.should have_link('Sign in', href: new_user_session_path)
		end
	end

	describe "after sign up" do

#		include Devise::TestHelpers --> issue https://github.com/rspec/rspec-rails/issues/534

		before do
			visit new_user_registration_path
			fill_in "Username",              with: "tyler"
			fill_in "Email",                 with: "tyler@tyler.in.ua"
			fill_in "Password",              with: "secretpassword"
			fill_in "Password confirmation", with: "secretpassword"
			click_button "Sign up"
		end

		it "should have link 'Sing out'" do
			page.should have_link('Sign out', href: destroy_user_session_path)
		end
		
		it "should have content 'username'" do
			page.should have_content('tyler')
		end
		
		it "should have link 'New task'" do
			page.should have_link('New Task', href: new_task_path)
		end
	end

	describe "after sign_in" do

		let(:user) { FactoryGirl.create(:user) }

		before do
			visit new_user_session_path
			fill_in "Username", with: user.username
			fill_in "Password", with: user.password
			click_button "Sign in"
		end

		it "should have link 'Sing out'" do
			page.should have_link('Sign out', href: destroy_user_session_path)
		end
		
		it "should have content 'username'" do
			page.should have_content('tyler')
		end
		
		it "should have link 'New task'" do
			page.should have_link('New Task', href: new_task_path)
		end
	end
end
