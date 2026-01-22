# frozen_string_literal: true

require "rails_helper"

RSpec.describe "SlimSelect inputs", type: :system do
  let(:authors) do
    Array.new(3) do |i|
      Author.create!(email: "some_email_#{i}@example.com", name: "John #{i}", age: 30 + (i * 3))
    end
  end
  let(:post) { Post.create!(title: "Test", author: authors.last) }
  let(:tags) do
    Array.new(3) do |i|
      Tag.create!(name: "A tag #{i}")
    end
  end

  before do
    post.tags << tags.last
  end

  after do
    post.destroy
    authors.each(&:destroy)
    tags.each(&:destroy)
  end

  context "with a single value slimselect input" do
    let(:slimselect_main) { "#post_author_input .ss-main" }

    it "includes the hidden select and the ss-main element" do
      visit "/admin/posts/#{post.id}/edit"

      expect(page).to have_select("post[author_id]", visible: :hidden, selected: authors.last.name)
      expect(page).to have_css(slimselect_main)
    end

    it "updates the entity association" do
      visit "/admin/posts/#{post.id}/edit"

      find(slimselect_main).click
      # SlimSelect renders dropdown in document.body, so we need to find globally
      find(".ss-option", text: "John 1").click
      find('[type="submit"]').click
      expect(page).to have_content("was successfully updated")
      expect(post.reload.author).to eq(authors.find { |item| item.name == "John 1" })
    end
  end

  context "with a multiple values slimselect input" do
    let(:slimselect_main) { "#post_tags_input .ss-main" }

    it "includes the hidden select and the ss-main element" do
      visit "/admin/posts/#{post.id}/edit"

      expect(page).to have_select("post[tag_ids][]", visible: :hidden, selected: tags.last.name)
      expect(page).to have_css(slimselect_main)
    end

    it "updates the entity association" do
      visit "/admin/posts/#{post.id}/edit"

      find(slimselect_main).click
      # SlimSelect renders dropdown in document.body, so we need to find globally
      find(".ss-option", text: "A tag 1").click
      scroll_to(find("#post_submit_action"))
      find('[type="submit"]').click
      expect(page).to have_content("was successfully updated")
      expect(post.reload.tags).to include(tags.find { |item| item.name == "A tag 1" })
    end
  end
end
