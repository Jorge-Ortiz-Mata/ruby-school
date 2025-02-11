# spec/client_spec.rb
require 'spec_helper'
require_relative '../../classes/client'

RSpec.describe Client do
  let(:client) { build(:client) }
  let(:wrong_client) { build(:client, :wrong_credentials) }
  let(:user_info_data) { File.read('spec/fixtures/github_client/user_info.json') }
  let(:user_repositories_data) { File.read('spec/fixtures/github_client/user_repositories.json') }
  let(:repository_info_data) { File.read('spec/fixtures/github_client/repository_info.json') }
  let(:headers) { 
    { 
      'Accept': 'application/vnd.github+json',
      'Authorization': "Bearer #{ENV['GH_TOKEN']}",
      'X-GitHub-Api-Version': '2022-11-28'
    }
  }

  describe '#initialize' do
    it 'should have an authentication token' do
      expect(client.auth_token).to_not be_nil
    end
  end

  describe 'public methods' do
    context 'with sucessful responses' do
      it 'should call the user info method' do
        stub_request(:get, /./).to_return(status: 200, body: user_info_data, headers: headers)

        data = client.user_info('jorge-ortiz-sp')

        expect(data).to be_an_instance_of(Hash)
        expect(data).to_not be_nil
        expect(data['id']).to_not be_nil
        expect(data['login']).to_not be_nil
      end

      it 'should call the user repositories method' do
        stub_request(:get, /./).to_return(status: 200, body: [user_repositories_data].to_json, headers: headers)

        data = client.user_repositories('Jorge-Ortiz-Mata')

        expect(data).to be_an_instance_of(Array)
        expect(data.first['id']).to_not be_nil
        expect(data.first['name']).to_not be_nil
      end

      it 'should call the repository  info method' do
        stub_request(:get, /./).to_return(status: 200, body: repository_info_data, headers: headers)

        data = client.repository_info('Jorge-Ortiz-Mata', 'ruby-school')

        expect(data).to be_an_instance_of(Hash)
        expect(data['id']).to_not be_nil
        expect(data['name']).to_not be_nil
      end
    end

    context 'with unsuccessful responses' do
      it 'should return error with a wrong authentication token' do
        stub_request(:get, /./).to_return(status: 401, body: '{"message":"Unauthorized"}')

        expect { wrong_client.user_info('jorge-ortiz-sp') }.to raise_error(GithubClient::UnauthorizedError)
      end

      it 'should return error when the user is not found' do
        stub_request(:get, /./).to_return(status: 404, body: '{"message":"NotFoundError"}')

        expect { client.user_info('jorge-ortiz-sp-unknown-user') }.to raise_error(GithubClient::NotFoundError)
      end

      it 'should return error when the user repositories are not found' do
        stub_request(:get, /./).to_return(status: 404, body: '{"message":"NotFoundError"}')

        expect { client.user_repositories('jorge-ortiz-sp-unknown-user') }.to raise_error(GithubClient::NotFoundError)
      end

      it 'should return error when the repository is not found' do
        stub_request(:get, /./).to_return(status: 404, body: '{"message":"NotFoundError"}')

        expect { client.repository_info('Jorge-Ortiz-Mata', 'repository-does-not-exist') }.to raise_error(GithubClient::NotFoundError)
      end
    end
  end
end
