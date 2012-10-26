# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  page.body.should match /#{e1}.*#{e2}/m
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(/,\s*/).each do |rating|
    rating = "ratings_#{rating}"
    if uncheck
      uncheck(rating)
    else
      check(rating)
    end
  end
end

Then /I should (not )?see movies rated: (.*)/ do |should_not, rating_list|
  rating_list.split(/,\s*/).each do |rating|
    if should_not
      assert page.has_no_xpath?('//td', :text => "#{rating}")
    else
      assert page.has_xpath?('//td', :text => "#{rating}")
    end
  end
end

Then /I should see (.*) of the movies/ do |quantity|
  rows = page.all('table#movies tr').count
  case quantity
  when 'none'
    rows.should == 1
  when 'all'
    rows.should == 11
  end
end
