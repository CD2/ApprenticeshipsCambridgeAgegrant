task seed_pages: :environment do

  Page.create!(
    name: 'Do I Qualify?',
    body: '<p>Apprentices learn and earn at the same time, gaining hands-on experience in the workplace whilst also gaining valuable work-based skills and qualifications. Training could involve a mix of on-site assessment and college attendance.</p> <p>Typically, Apprenticeships take 12 months for Level 2 (Intermediate) or 18 to 24 months for a  Level 3 (Advanced) programmes.  Higher-level programmes can take up to 4 years to complete.  (this may vary depending on the type of Apprenticeship).</p><p>The package of learning is called the framework. Each framework is different.</p>',
    url_alias: 'do-i-qualify/'
  )

  Page.create!(
    name: 'How Much Funding Is Available?',
    body: '<p>The cost of training for 16-18 year old apprentices is fully funded by the government. There may be grants available to help with costs, for example, the Apprenticeship Grant for Employers (AGE) of 16-24 year olds supports businesses that would not otherwise be in a position to do so, to recruit individuals onto Apprenticeships.</p><p>The National Minimum Wage is applicable to apprentices aged 16-18 and those aged over 19 in the first year of their Apprenticeship (£3.30 phr, October 2015 rate).</p><p>If the apprentice is 19 or over, an employer contribution towards tuition fees is expected, which varies depending on the specific Apprenticeship and the Training Provider.</p><p>The Employer Training Initiative offers up to 30% cash-back against training undertaken. Details of this scheme and how to apply can be found here</p>',
    url_alias: 'how-much-funding-will-is-available/'
  )

  Page.create!(
    name: 'Ive Already Applied Once Can I Claim Again?',
    body: '<p>You will have a Training Provider who will be your main point of contact and provide guidance and support throughout the Apprenticeship programme to you and your apprentice and ensure they are meeting all targets.</p><p>When an apprentice has been enrolled on their programme, they will be allocated an assessor (from the Training Provider) who will explain the framework in detail; they will meet with you regularly to provide support and feedback.</p>',
    url_alias: 'ive-already-applied-once-can-i-claim-again/'
  )

  Page.create!(
    name: 'I Have Already Applied For A Grant And Need To Upload Evidence To Claim',
    body: '<p>Go to the Apprenticeships Norfolk Network for help in selecting a training provider. The training provider will contact you to discuss Apprenticeships in detail.</p><p>The training provider will be able to advertise the Apprenticeship vacancy on your behalf on Jobs24 and at GOV.UK .  This service is provided free of charge by members of the Apprenticeships Norfolk Network</p><p>If you have a young person already identified inform the Provider, if not a vacancy can be advertised for free online with the National Apprenticeship Service.</p><p>Initial sifting of applications can be undertaken by the Provider before you carry out final interviews and appoint an apprentice.</p>',
    url_alias: 'i-have-already-applied-for-a-grant-and-need-to-upload-evidence-to-claim/'
  )
  Page.create!(
    name: 'Search For An Apprentice',
    body: 'test',
    url_alias: 'search-for-an-apprentice/'
  )

  Page.create!(
  name: 'Apply For An AGE Grant',
  url_alias: 'age-grant'
)
end