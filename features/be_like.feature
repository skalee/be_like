Feature: Be Like Matcher
  In order to check whether data structure matches given criteria
  I want to test it against some reference structure
  Which may contain keywords like anything, any_array and so on.

  Scenario: Very Boring Example, Testing Against Exact Simple Object
    Given a file named "simple_spec.rb" with:
      """
        require "spec_helper"

        describe "nil" do
          subject{ nil }
          it{ should be_like nil }
          it{ should_not be_like [] }
        end

        describe "A string which is a simple element" do
          subject{ "Once upon a midnight dreary, while I pondered weak and weary," }
          it{ should be_like "Once upon a midnight dreary, while I pondered weak and weary," }
          it{ should_not be_like nil }
        end
      """
    When I run `rspec simple_spec.rb`
    Then the examples should all pass

  Scenario: Using any* matchers
    Given a file named "anystar_spec.rb" with:
      """
        require "spec_helper"

        describe "A string" do
          subject{ "Quoth the raven, 'Nevermore.'" }
          it{ should     be_like Wildcard.any_string }
          it{ should_not be_like "any_string" }
          it{ should_not be_like Wildcard.any_array }
          it{ should     be_like Wildcard.anything }
          it{ should     be_like Wildcard.not_nil }
        end

        describe "nil" do
          subject{ nil }
          it{ should_not be_like Wildcard.any_array }
          it{ should     be_like Wildcard.anything }
          it{ should_not be_like Wildcard.not_nil }
        end
      """
    When I run `rspec anystar_spec.rb`
    Then the examples should all pass

  Scenario: A Complicated Structure Of Arrays
    Given a file named "arrays_spec.rb" with:
      """
        require "spec_helper"

        describe "An array with hashes and strings and bells and whistles" do
          subject{ [["black", "cat"], nil, [["edgar", "alan"], "poe"]] }
          it{ should     be_like Wildcard.any_array }
          it{ should     be_like Wildcard.anything }
          it{ should_not be_like Wildcard.any_hash }
          it{ should     be_like [Wildcard.anything, Wildcard.anything, Wildcard.anything] }
          it{ should_not be_like [Wildcard.anything, Wildcard.anything, Wildcard.anything, Wildcard.anything] }
          it{ should     be_like [Wildcard.not_nil, nil, Wildcard.not_nil] }
          it{ should     be_like [Wildcard.any_array, nil, Wildcard.any_array] }
          it{ should_not be_like [["cat", "black"], nil, Wildcard.any_array] }
          it{ should     be_like [Wildcard.anything, nil, [Wildcard.any_array, Wildcard.any_string]] }
          it{ should     be_like [["black", "cat"], nil, [Wildcard.any_array, "poe"]] }
          it{ should     be_like [["black", "cat"], nil, [["edgar", "alan"], "poe"]] }
          it{ should_not be_like [["black", "cat"], nil, ["edgar", "alan", "poe"]] }
        end
      """
    When I run `rspec arrays_spec.rb`
    Then the examples should all pass

  Scenario:
