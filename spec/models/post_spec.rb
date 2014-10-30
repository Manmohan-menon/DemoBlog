require 'spec_helper'

describe Post do
  describe 'validations' do
  	subject(:post) { Post.new } # sets the subject
  	before { post.valid? } # running a precondition

  	[:title, :body].each do |attribute|
  		it "should validate presence of #{attribute}" do
  			expect(post).to have_at_least(1).error_on(attribute)
  			expect(post.errors.messages[attribute]).to include "can't be blank"
  		end
  	end
  end

  describe '#content' do
  	# Create a double of the MarkdownService
  	let(:markdown_service) { double('MarkdownService') }

  	before do
  		#not gonna use the actual one here
  		MarkdownService.stub(:new) { markdown_service } 
  	end

  	it 'should convert its body to markdown' do
  		markdown_service.should_receive(:render).with('post body')
  		Post.new(:body => 'post body').content
  	end
  end
end