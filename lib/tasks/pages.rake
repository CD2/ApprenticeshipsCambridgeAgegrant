task seed_pages: :environment do

  Page.create!(
    name: 'Do I Qualify?',
    body: '<p>To qualify for this funding, your business has had to have a 16 to 24 year old who started an Apprenticeship Framework on or after the 1 August 2016. The apprentice has to be employed in a branch of the business with a postcode in Norfolk or Suffolk and the total number of employees in the business (including any subsidiary or parent companies) should be less than 250.</p>',
    order: 1,
    norfolk: true
  )

  Page.create!(
    name: 'Do I Qualify?',
    body: '<p>To qualify for this funding, your business needs to have a 16 to 24 year old who started an Apprenticeship Framework on or after the 1 August 2016. The apprentice has to be employed in a branch of the business with a postcode in Peterborough or Cambridgeshire and the total number of employees in the business (including any subsidiary or parent companies) must be less than 250.</p>',
    order: 1,
    cambridge: true,
    peterborough: true,
  )

  Page.create!(
    name: 'How Much Funding Is Available?',
    body: '<p>If your apprentice is aged 16 to 18 at the start of their Apprenticeship, then you will be paid £2,000 if you meet the relevant terms and conditions. For those aged 19 to 24, the rate is £1,500.</p>',
    order: 2,
    norfolk: true,
    cambridge: true,
    peterborough: true,
  )

  Page.create!(
    name: 'What do I need to do to claim?',
    body: '<p>To claim, you need a valid email address. Please complete the online registration form and create a password as soon as possible after your apprentice starts their Apprenticeship. You will need to select the training provider you are working with from the drop down list.</p>
    <p>Once you have created your password, you will be asked to review the details you have entered and check a box to make a declaration that this information is correct and true. Once you save this information, the grant money is allocated to you. Once the apprentice has been on their Apprenticeship for 10 weeks or more, the training provider should contact you to arrange a review. Please ask the provider for an electronic copy of this once it has been completed and log back into the site using your email address and password. You will then be asked to upload the review (which should be signed by the apprentice, provider and yourself or your nominated employee as the employer. Once we have this, we will pay you your allocated grant by BACS.</p>',
    order: 3,
    norfolk: true,
  )

  Page.create!(
    name: 'What do I need to do to claim?',
    body: '<p>Please complete the online registration form and create a password as soon as possible after your apprentice starts their Apprenticeship.  You will need to select the training provider you are working with from the drop down list.</p>
    <p>Once you have created your password, you will be asked to review the details you have entered and check a box to make a declaration that this information is correct and true.  Once you save this information, the grant money is allocated to you.  Once the apprentice has been on their Apprenticeship for 10 weeks or more, the training provider should contact you to arrange a review.  Please ask the provider for an electronic copy of this once it has been completed and log back into the site using your email address and password.  You will then be asked to upload the review (which should be signed by the apprentice, provider and yourself or your nominated employee as the employer).  Once we have this, we will pay you your allocated grant by BACS.</p>',
    order: 3,
    cambridge: true,
    peterborough: true,
  )

  Page.create!(
    name: 'I have applied once already, Can I Claim Again?',
    body: '<p>You may only make one claim for each individual apprentice who starts with you. You may apply for grants for up to 5 apprentices in your organisation over the course of the year however we will make checks with the provider for any subsequent application you use to assure ourselves that previous apprentices that you have claimed for are still on an Apprenticeship with you, or have completed their Apprenticeship before we allow you to claim a further grant. If you have not retained your previous apprentice and are requesting a further grant, this will be declined.</p>',
    order: 4,
    norfolk: true,
    cambridge: true,
    peterborough: true,
  )

  Page.create!(
      name: 'How quickly will I receive the money?',
      body: '<p>Once you make your initial application, you need to wait for 10 weeks or more before uploading the first review. Once you upload the review document, you will receive your BACS payment within 28 days unless we inform you otherwise. Payment will be delayed if the review document is not signed by all parties, is incomplete in any way, does not demonstrate that the apprentice has been in learning for 10 weeks or longer or is in a format that our online system does not recognise. We may, at our discretion delay the payment whilst we make checks on the evidence submitted but we will notify you within 14 days if this is the case.</p>',
      order: 5,
      norfolk: true,
  )

  Page.create!(
      name: 'How quickly will I receive the money?',
      body: '<p>Once you make your initial application, you need to wait for 10 weeks or more before uploading the first review.  Once you upload the review document, you will receive your BACS payment within 28 days of the evidence being verified unless we inform you otherwise.  Payment will be delayed if the review document is not signed by all parties, is incomplete in any way, does not demonstrate that the apprentice has been in learning for at least 10 weeks or is in a format that our online system does not recognise.  We may, at our discretion delay the payment whilst we make checks on the evidence submitted but we will notify you within 14 days if this is the case. </p>',
      order: 6,
      cambridge: true,
      peterborough: true,
  )

  Page.create!(
      name: 'What will you accept as a review document?',
      body: '<p>It does not have to be a standard training provider review document. We will accept documentation evidencing that the learner has remained in place on the Apprenticeship for at least 10 weeks which has been signed by the employer, training provider AND the learner.</p>',
      order: 6,
      norfolk: true,
      cambridge: true,
      peterborough: true,
  )

  Page.create!(
      name: 'My Provider has not completed the review or has not provided me with a copy. What should I do?',
      body: '<p>Please contact us on 0344 8008024 if you are not able to provide the evidence required. Providers are contractually required to carry out a review by week 13.</p>',
      order: 6,
      norfolk: true,
  )

  Page.create!(
      name: 'My Provider has not completed the review or has not provided me with a copy. What should I do?',
      body: '<p>Please contact us on 01733 708064 or via email to AGE@peterborough.gov.uk  if you are not able to provide the evidence required.  Providers are contractually required to carry out a review by week 13.</p>',
      order: 6,
      cambridge: true,
      peterborough: true,
  )

  Page.create!(
      name: 'Your system does not work on my computer, what do I do now?',
      body: '<p>If you are having trouble getting the online system to work or you have limited access to ICT, please contact us on 0344 8008024 so that we can investigate and correct the issue.</p>',
      order: 7,
      norfolk: true,
  )
  Page.create!(
      name: 'Your system does not work on my computer, what do I do now?',
      body: '<p>If you are having trouble getting the online system to work or you have limited access to ICT, please contact us on  01733 708064 or via email to AGE@peterborough.gov.uk  so that we can investigate and correct the issue. </p>',
      order: 7,
      cambridge: true,
      peterborough: true,
  )
  Page.create!(
      name: 'I had an AGE grant from Government in the last year, can I still claim a grant from you if I take on another apprentice?',
      body: '<p>Yes, this is acceptable.</p>',
      order: 8,
      norfolk: true,
      cambridge: true,
      peterborough: true,
  )
  Page.create!(
      name: 'My company is based outside Norfolk or Suffolk. What should I do?',
      body: '<p>If you do not employ an apprentice in a branch or premises within Norfolk or Suffolk, then you are unable to claim a grant through our system. You may however be eligible for the national AGE grant and information about this can be found <a href="https://www.gov.uk/government/collections/apprenticeship-grant-for-employers-of-16-to-24-year-olds">here</a>. Employers in Cambridgeshire or Peterborough can apply to the local scheme there through this link.</p>',
      order: 9,
      norfolk: true,
  )
  Page.create!(
      name: 'My company is based outside Peterborough and Cambridgeshire. What should I do?',
      body: '<p>If you do not employ an apprentice in a branch or premises within Peterborough or Cambridgeshire, then you are unable to claim a grant through our system.  You may however be eligible for the national AGE grant and information about this can be found <a href="https://www.gov.uk/government/collections/apprenticeship-grant-for-employers-of-16-to-24-year-olds">here</a>. Employers in Cambridgeshire or Peterborough can apply to the local scheme there through this link.</p>',
      order: 9,
      cambridge: true,
      peterborough: true,
  )
  Page.create!(
      name: 'What is your complaints process?',
      body: '<p>Please <a href="https://www.norfolk.gov.uk/what-we-do-and-how-we-work/policy-performance-and-partnerships/policies-and-strategies/corporate/compliments-and-complaints">click here</a> to access the complaints process for you to follow.</p>',
      order: 10,
      norfolk: true,
  )
  Page.create!(
      name: 'What is your complaints process?',
      body: '

<p><u>Apprenticeship Grant for Employers Complaints Process</u></p>

<p align="left">The Apprenticeship Grant for Employers complaints procedure will have two stages:</p>

<p align="left">Stage One (Investigation)</p>

<p align="left">Stage Two (Complaint Review)</p>

<p align="left"><strong>Stage One (Investigation)</strong></p>

<p align="left">We aim to settle the majority of complaints quickly and satisfactorily. The complaint will be investigated by the service manager or team leader of the service being complained about. The complaint may be resolved <strong>informally</strong> over the telephone. If this is possible then a written response will not be required. We will have 5 working days to resolve a complaint informally. A complaint is only resolved informally if the complainant is satisfied with the resolution. If this is not possible the manager will complete a formal investigation of the complaint and send a written response.</p>

<p align="left">If the complaint cannot be resolved informally a written acknowledgement confirming receipt of the complaint should be sent responding to the complaint. It is expected that this will be by email if the complaint has been made by email or in writing in all other cases. The acknowledgement should be sent within 5 days of the receipt of the complaint (where the matter has not been resolved informally).</p>

<p align="left">We will have 20 working days to investigate a formal complaint. The response should answer the complaint points raised and inform the complainant how they can pursue a complaint if they are not satisfied. We should also offer the complainant the opportunity to contact the investigating manager to clarify the decision or any points raised in their response.</p>

<p align="left"><strong></strong></p>

<p align="left"><strong>Stage Two (Complaint Review)</strong></p>

<p align="left">If the complainant remains unhappy with the Stage One response, they can request escalation to Stage Two. It is expected that if contact with the complainant to discuss the matter has not previously occurred then this will happen at this point.</p>

<p>This will then be escalated to Cambridgeshire County Council to conduct a complaint review. This will acknowledged in writing within 5 working days of the receipt of the escalation.</p>

<p>We will then have 20 working days to complete the complaint review and the complainant will be contacted in writing to confirm the outcome and advise them of the final decision concerning this complaint.</p>
',
      order: 11,
      cambridge: true,
      peterborough: true,
  )

end