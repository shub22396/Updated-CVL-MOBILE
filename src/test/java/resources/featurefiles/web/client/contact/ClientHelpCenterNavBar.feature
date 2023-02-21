@ClientHelpCenterNavBar @Regression @Web @Traffic
Feature: Client Contact ClientHelpCenterNavBar

  Background: Navigating to Client Help Center From Nav Bar
   Given I login as a client

  @clientHelpText @MobileChrome
  Scenario: verify text in recruiters contact page
    Then I click on Menu Bar
    And  I click on "Contact Us"
    Then I should see text "Your Customer Success Executive"
    And  I should see text "n.church@resume-library.com"
    And  I should see text "1-857-239-0143"
    And  I should not see "centre"

  @clientHelpCenter @ReleaseRegression2 @MobileChrome
  Scenario: verify text in help center
    Then I navigate to page "Client Help"
    Then I should be able to see in browser URL "Client Help"
    Then I should see text H one tag "Client Help Center"
    And  I should see text "Client FAQs"
    And  I should see text "Job Posting Tips"
    And  I should see text "Job Enhancement Tips"
    And  I should see text "Resume Search Tips"
    And  I should see text "Resume Alert Tips"
    And  I should see text "Download User Manual"
    And  I should not see text "centre"
    When I click on "View Client FAQs"
    Then I should be able to see in browser URL "Faq"
    And  I should see text "How Can We Help You?"
    And  I move backward one page
    And  I click on "View Job Posting Tips"
    Then I should be able to see in browser URL "Client Help Job Posting"
    And  I should see text "How to Post a Job"
    And  I move backward one page
    And  I click on "View Job Enhancement Tips"
    Then I should be able to see in browser URL "Client Help Vacancy Enhancements"
    And  I should see text "Top Tips to Attract Candidates"
    And  I move backward one page
    And  I click on "View Resume Search Tips"
    Then I should be able to see in browser URL "Client Help Search Tips"
    And  I should see text "Improve Your Search Results"
    And  I move backward one page
    And  I click on "View Resume Alert Tips"
    Then I should be able to see in browser URL "Client Help Alert Tips"
    And  I should see text "Modify, Delete or Reactivate a Resume Alert"
    And  I move backward one page
    And  I click on "Account Options"
    And  I click on link "Contact Us" account options menu
   Then  I should be able to see in browser URL "/client/contact"
    And  I should see text "Our dedicated team is here to help answer any questions, Contact us"
    And  I move backward one page
    And  I click on "Download User Manual"
    And  I wait for "1" seconds
    Then I click on "Download" with native
    #Then I should be able to see in browser URL "Downloads Rl User Manual Pdf"

  @clientContactFormTextForm @MobileChrome
  Scenario: verify text in client contact form1
    Then I navigate to page "Client Help"
    And  I click on "Account Options"
    And  I click on link "Contact Us" account options menu
    Then I should be able to see in browser URL "/client/contact"
    Then I should see text "Phone number"
    And  I should see text "Optional"
    And  I should see text "Inquiry type"
    And  I should see text "Inquiry"

  @clientContactFormValidationForm @MobileChrome
  Scenario: Validation on client contact form
    Then I navigate to page "Client Help"
    And  I click on "Account Options"
    And  I click on link "Contact Us" account options menu
    When I press and wait "register_now"
    Then I should see text "This field is required"
    And  I should see text "Message is required"
    And  I should not see text "phone number is required"

  @clientContactFormSubmit @ReleaseRegression2 @MobileChrome
  Scenario: Submitting on client contact form
    Then I navigate to page "Client Help"
    And  I click on "Account Options"
    And  I click on link "Contact Us" account options menu
    And  I wait for "1" seconds
    Then I select the option value "resumesearch" from inquiry type
    Then I fill in inquiry messages text area with "inquiry message for form 1 "
    And  I wait for "1" seconds
    Then I click on id "register_now"
    Then I should see text "Thanks for getting in touch. A member of our team will get back to you shortly."
    And  I should see text "inquiry message for form 1"