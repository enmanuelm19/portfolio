require 'rails_helper'

RSpec.describe 'Project module', js: true do
  feature 'Show list of projects' do
    let(:project) { FactoryBot.create(:project) }
    scenario 'user goes to projects list' do
      visit projects_path
      expect(page).to have_content(I18n.t('activerecord.models.project.other'))
    end

    scenario 'user selects a project' do
      project.reload
      visit projects_path
      find("a[href='/es/projects/#{project.id}']").click
      expect(page).to have_content(project.title)
    end
  end
end

