shared_examples "an administrative listing page" do
  it "displays a table of all resources" do
    expect(page).to have_selector("table.#{resource_name.pluralize}_table")
  end

  it 'tags each resource with the proper class' do
    expect(page).to have_selector(".#{resource_name}")
  end

  it "shows a link to create a new resource" do
    expect(page).to have_selector '.button.add-button'
  end

  it "shows a link to edit a resource" do
    expect(page).to have_link 'Edit'
  end

  it "shows a link to delete a resource" do
    expect(page).to have_link 'Delete'
  end
end