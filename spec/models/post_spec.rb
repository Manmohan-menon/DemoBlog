require 'spec_helper'

describe Post do
  it 'should validate presence of title' do
    post = Post.new
    post.valid?
    expect(post.errors.messages[:title]).to include "can't be blank"
  end
end