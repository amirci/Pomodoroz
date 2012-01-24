Given /^the following activities exist:$/ do |activities|
  @activities = activities.hashes.collect { |activity| Activity.create! activity }
end

When /^I'm on the activities page$/ do
  visit activities_path
end

Then /^I should see all the activities$/ do
  @activities.each do |activity|
    within_table('activities') do
      page.should have_content(activity.title)
    end
  end
end