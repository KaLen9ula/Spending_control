require 'rails_helper'

RSpec.describe "Spendings", type: :request do

  let(:current_user) { create(:user) }

  let(:user) { current_user }

  before { sign_in current_user }

  describe "GET #index" do
    subject { get spendings_path }

    context "user doesn't exist" do
      before(:each) do
        sign_out user
        subject
      end
      it "redirects to login page" do
        expect(response.status).to redirect_to new_user_session_path
      end
    end

    context "user exists" do
      before(:each) { subject }
      it "returns successful response and renders index page" do
        expect(response.status).to render_template(:index)
      end
    end
  end

  # New

  describe "GET #new" do
    subject { get new_spending_path }
    before(:each) { subject }

    context "successful request" do
      it "returns successful response and renders new form" do
        expect(response).to render_template(:new)
      end

      it "sends a new spending" do
        expect(assigns(:spending)).to be_a(Spending)
        expect(assigns(:spending)).to be_a_new(Spending)
      end
    end
  end

  describe "POST #create" do
    let(:spending_params) do
      { title: 'Saturday taxi',
        description: 'From friends to home',
        category: 'Other',
        amount: 100,
        user_id: current_user,
        created_at: Time.now }
    end

    subject { post spendings_path(spending: spending_params) }

    context "not authorized user" do
      before(:each) do
        sign_out current_user
        subject
      end

      it "has status unauthorized" do
        expect(response.status).to eq(302)
        expect(response.body).to redirect_to(new_user_session_path)
      end
    end

    context 'correct params are passed' do
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'adds new object to db' do
        expect{subject}.to change(Spending, :count).by(1)
      end
      it "renders new template" do
        subject
        expect(response.status).to redirect_to(spending_path(Spending.last))
      end
    end
  end

  # Show

  describe "GET #show" do
    subject { get spending_path(spending) }
    before(:each) { subject }

    context "successful request" do
      let(:spending) { create(:spending, user: current_user) }
      it "returns successful response and renders show page" do
        expect(response.status).to render_template(:show)
      end
    end

    context "pass spending" do
      let(:spending) { create(:spending, user: current_user) }
      it "returns valid spending" do
        expect(assigns(:spending)).to be_a(Spending)
        expect(assigns(:spending)).to eq(spending)
      end
    end
  end

  describe "DELETE #destroy" do
    subject { delete spending_path(spending) }

    let!(:spending) { create(:spending, user: current_user) }

    context 'correct params are passed' do
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'has successful redirect' do
        subject
        expect(response.body).to redirect_to(spendings_path)
      end

      it 'delete object from db' do
        expect{subject}.to change(Spending, :count).by(-1)
      end
    end
  end
end
