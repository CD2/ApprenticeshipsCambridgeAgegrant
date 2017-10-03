namespace :update2017 do
  task fix_pages: :environment do
    page = Page.find_by(
      name: 'Do I qualify?',
      body: '<p>To qualify for this funding, your business must have had a 16 to 24 year old who started an Apprenticeship Framework on or after the 1 August 2016. The apprentice has to be employed in a branch of the business with a postcode in Cambridgeshire or Peterborough and the total number of employees in the business (including any subsidiary or parent companies) must be less than 250.</p>',
      order: 1,
      cambridge: true,
      peterborough: true,
    )

    page.update!(
      body: '<p>To qualify for this funding, your business must have had a 16 to 24 year old who started an Apprenticeship Framework on or after the 1 August 2018. The apprentice has to be employed in a branch of the business with a postcode in Cambridgeshire or Peterborough and the total number of employees in the business (including any subsidiary or parent companies) must be less than 250.</p>',
    )

    page = Page.find_by(
      name: 'How much funding can I receive?',
      body: '<p>If your apprentice is aged 16 to 18 at the start of their Apprenticeship, then you will be paid £2,000 if you meet the relevant terms and conditions. For those aged 19 to 24, the rate is £1,500.</p>',
      order: 2,
      norfolk: true,
      cambridge: true,
      peterborough: true,
    )

    page.update!(
      body: '<p>If your apprentice is aged 16 to 18 at the start of their Apprenticeship, then you will be paid £1,000 if you meet the relevant terms and conditions. For those aged 19 to 24, the rate is £1,500.</p>',
    )

  end
end
