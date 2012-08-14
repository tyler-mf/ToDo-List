require 'spec_helper'

describe "Task" do 
	let(:user) { FactoryGirl.create(:user) }

	before do
		visit new_user_session_path
		fill_in "Username", with: user.username
		fill_in "Password", with: user.password
		click_button "Sign in"
	end

	describe "create" do
		before { visit new_task_path }

		describe "with invalid information" do
			it "should not create a task" do 
				expect { click_button "Create Task" }.should_not change(Task, :count)
			end
		end

		describe "with valid information" do
      		before { fill_in 'Content', with: "Lorem ipsum" }
      		it "should create a task" do
        		expect { click_button "Create Task" }.should change(Task, :count).by(1)
      		end
    	end
	end

	describe "delete" do

		before do 
			FactoryGirl.create(:task, user: user)
		end

		describe "delete task" do
			before { visit "/tasks/1/edit" }

			it { expect { click_link "Delete" }.should change(Task, :count).by(-1) }
		end
	end
end