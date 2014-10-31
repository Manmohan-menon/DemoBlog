require 'spec_helper'

describe Post do
  describe 'validations' do
  	subject(:post) { Post.new } # sets the subject
  	before { post.valid? } # running a precondition

  	[:title, :body].each do |attribute|
  		it "should validate presence of #{attribute}" do
  			expect(post.errors[attribute].size).to be >= 1
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

  	describe '#author_name'do
  		context 'when the author exists' do
  			let(:author) { AdminUser.new }
  			subject { Post.new(author: author).author_name }

  			before { author.stub(:name) { "Jane Smith" } }
  			it {should eq "Jane Smith" }
  		end

  		context 'when the author doesnt exist' do
  			subject { Post.new.author_name }

  			it { should eq "Nobody" }
  		end
  	end
  end
end