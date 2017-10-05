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

    page = Page.find_by(
      name: 'My Provider has not completed the review or has not provided me with a copy. What should I do?',
      body: '<p>Please contact us on 01733 708064 or via email to AGE@peterborough.gov.uk  if you are not able to provide the evidence required.</p>',
      order: 6,
      cambridge: true,
      peterborough: true,
    )

    page.update!(
      body: '<p>Please contact us on 01733 588367 or via email to AGE@peterborough.gov.uk  if you are not able to provide the evidence required.</p>',
    )

    page = Page.find_by(
      name: 'Your system does not work on my computer, what do I do now?',
      body: '<p>If you are having trouble getting the online system to work or you have limited access to ICT, please contact us on  01733 708064 or via email to <a href="mailto:AGE@peterborough.gov.uk">AGE@peterborough.gov.uk</a> so that we can investigate. </p>',
      order: 7,
      cambridge: true,
      peterborough: true,
    )

    page.update!(
      body: '<p>If you are having trouble getting the online system to work or you have limited access to ICT, please contact us on  01733 588367 or via email to <a href="mailto:AGE@peterborough.gov.uk">AGE@peterborough.gov.uk</a> so that we can investigate. </p>',
    )

    page = Page.find_by(
      name: 'My company is based outside Cambridgeshire and Peterborough. What should I do?',
      body: '<p>If you do not employ an apprentice in a branch or premises within Cambridgeshire or Peterborough, then you are unable to claim a grant through our system.  You may however be eligible for the national AGE grant and information about this can be found <a href="https://www.gov.uk/government/collections/apprenticeship-grant-for-employers-of-16-to-24-year-olds">here</a>. Employers in Cambridgeshire or Peterborough can apply to the local scheme there through this link.</p>',
      order: 9,
      cambridge: true,
      peterborough: true,
    )

    page.update!(
      body: '<p>Unfortunately, the national AGE scheme has now closed and therefore you are only eligible if you are within Cambridgeshire and Peterborough. However, you may still be eligible for incentive payments that are payable through your training provider. Please speak to them for further information.</p>'
    )
  end

  task fix_pages2: :environment do
    page = Page.find_by(
      name: 'Do I qualify?',
      body: '<p>To qualify for this funding, your business must have had a 16 to 24 year old who started an Apprenticeship Framework on or after the 1 August 2018. The apprentice has to be employed in a branch of the business with a postcode in Cambridgeshire or Peterborough and the total number of employees in the business (including any subsidiary or parent companies) must be less than 250.</p>',
      order: 1,
      cambridge: true,
      peterborough: true,
    )


    page.update!(
      body: '<p>To qualify for this funding, your business must have had a 16 to 24 year old who started an Apprenticeship Framework on or after the 1 August 2017. The apprentice has to be employed in a branch of the business within the Cambridgeshire and Peterborough Combined Authority area and the total number of employees in the business (including any subsidiary or parent companies) must be less than 250.</p>',
    )
  end
end
